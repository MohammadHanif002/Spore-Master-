// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
// import 'package:sporemaster/services/temperature_provider.dart';
import 'package:sporemaster/models/sensor_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  late DatabaseReference _databaseRef;
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.of(context).pushReplacementNamed('LoginScreen');
    } else {
      setState(() {
        _currentUser = user;
        _databaseRef = FirebaseDatabase.instance.ref();
      });
    }
  }

  Future<void> _toggleRelayStatus(int currentStatus) async {
    int newStatus = currentStatus == 0 ? 1 : 0;
    await _databaseRef.child('relayStatus').set(newStatus);
  }

  void _showAlert(String title, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                CircleAvatar(
                  backgroundColor: Colors.red[400],
                  radius: 30,
                  child: Icon(
                    Icons.announcement_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 135, 9, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 24,
        ),
        title: Text('Suhu dan Kelembapan'),
      ),
      body: _currentUser == null
          ? Center(child: CircularProgressIndicator())
          : Consumer<SensorData>(
              builder: (context, sensorData, child) {
                if (sensorData.data.isNotEmpty) {
                  var data = sensorData.data;
                  double temperature = _getLatestValue(data['temperature']);
                  double humidity = _getLatestValue(data['humidity']);
                  int relayStatus = data['relayStatus'] ?? 0;

                  // Add debug prints to verify values
                  print('Temperature: $temperature, Humidity: $humidity');
                  print(
                      'Checking condition: temperature >= 28.00 && humidity <= 20.00');
                  bool conditionMet =
                      (temperature >= 28.00 || humidity <= 20.00);
                  print('Condition result: $conditionMet');

                  if (conditionMet) {
                    print('Condition met, showing alert');
                    _showAlert("Warning",
                        "Suhu di atas 28°C atau kelembapan di bawah 20%");
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/top_background.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Monitoring suhu dan kelembapan',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 51, 50, 50),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: Column(
                                  children: [
                                    _buildInfoBox(
                                      'SUHU SAAT INI',
                                      '${temperature.toStringAsFixed(1)}°C',
                                      MediaQuery.of(context).size.width * 0.8,
                                      MediaQuery.of(context).size.height * 0.3,
                                      temperature,
                                      Color.fromRGBO(255, 135, 9, 1),
                                      const Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    SizedBox(height: 40),
                                    _buildInfoBox(
                                      'KELEMBAPAN',
                                      '${humidity.toStringAsFixed(1)}%',
                                      MediaQuery.of(context).size.width * 0.8,
                                      MediaQuery.of(context).size.height * 0.3,
                                      humidity,
                                      Color.fromRGBO(1, 128, 220, 1),
                                      const Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    SizedBox(height: 40),
                                    _buildInfoBox(
                                      'RELAY STATUS',
                                      relayStatus == 0 ? 'OFF' : 'ON',
                                      MediaQuery.of(context).size.width * 0.8,
                                      MediaQuery.of(context).size.height * 0.3,
                                      double.parse(relayStatus.toString()),
                                      relayStatus == 0
                                          ? Colors.red
                                          : Colors.green,
                                      const Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () =>
                                          _toggleRelayStatus(relayStatus),
                                      child: Text(
                                        relayStatus == 0
                                            ? 'Turn Relay ON'
                                            : 'Turn Relay OFF',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/bottom_background.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Loading...'),
                  );
                }
              },
            ),
    );
  }

  double _getLatestValue(dynamic values) {
    double latestValue = 0.0;
    int latestKey = 0;

    if (values is Map) {
      values.forEach((key, value) {
        int currentKey = int.tryParse(key.toString()) ?? 0;
        if (currentKey > latestKey) {
          latestKey = currentKey;
          if (value is double) {
            latestValue = value;
          } else if (value is int) {
            latestValue = value.toDouble();
          }
        }
      });
    } else if (values is double) {
      latestValue = values;
    } else if (values is int) {
      latestValue = values.toDouble();
    }

    return latestValue;
  }

  Widget _buildInfoBox(
    String label,
    String value,
    double width,
    double height,
    double data,
    Color color,
    Color textColor,
  ) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Last Update: ${DateTime.now().toString().substring(11, 16)}',
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
