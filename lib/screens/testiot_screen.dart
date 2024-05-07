import 'package:flutter/material.dart';
import 'package:sporemaster/mqtt_connection.dart'; // Impor file mqtt_connection.dart untuk menggunakan fungsi-fungsi MQTT

void main() {
  runApp(TestiotScreen());
}

class TestiotScreen extends StatefulWidget {
  @override
  _TestiotScreenState createState() => _TestiotScreenState();
}

class _TestiotScreenState extends State<TestiotScreen> {
  double temperature = 0.0;
  double humidity = 0.0;

  @override
  void initState() {
    super.initState();
    // Panggil fungsi connect() saat aplikasi dijalankan
    connect();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sensor Data'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Temperature: $temperature C',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Humidity: $humidity %',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk memperbarui nilai sensor pada antarmuka pengguna
  void updateSensorValues(double temp, double hum) {
    setState(() {
      temperature = temp;
      humidity = hum;
    });
  }

  @override
  void dispose() {
    // Panggil fungsi closeConnection() saat aplikasi ditutup
    closeConnection();
    super.dispose();
  }
}
