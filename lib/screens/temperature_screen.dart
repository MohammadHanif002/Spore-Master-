import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  double temperature = 25.0;
  double humidity = 60.0;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 0, right: 0),
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/top_background.jpeg",
                  ),
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
                          w * 0.8,
                          h * 0.3,
                          temperature,
                          Color.fromRGBO(
                              255, 135, 9, 1), // Warna untuk kotak suhu
                          const Color.fromARGB(255, 255, 255,
                              255), // Warna untuk teks "Suhu Saat Ini"
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        _buildInfoBox(
                          'KELEMBAPAN',
                          '${humidity.toStringAsFixed(1)}%',
                          w * 0.8,
                          h * 0.3,
                          humidity,
                          Color.fromRGBO(
                              1, 128, 220, 1), // Warna untuk kotak kelembapan
                          const Color.fromARGB(255, 255, 255,
                              255), // Warna untuk teks "Kelembapan Saat Ini"
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.03),
            Container(
              margin: const EdgeInsets.only(left: 0, right: 0),
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bottom_background.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
                  color: textColor, // Warna untuk teks
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
