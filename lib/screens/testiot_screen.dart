import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';

class TestiotScreen extends StatefulWidget {
  final StreamController<Map<String, dynamic>> controller;
  TestiotScreen({required this.controller});
  @override
  _TestiotScreenState createState() => _TestiotScreenState();
}

class _TestiotScreenState extends State<TestiotScreen> {
  late StreamController<Map<String, dynamic>> _controller;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(); // Initialize Firebase
    _controller = widget.controller;
    _subscribeToFirebase();
  }

  void _subscribeToFirebase() {
    final String databaseURL =
        'https://sporebase-4a15a-default-rtdb.asia-southeast1.firebasedatabase.app'; // Ganti dengan URL database Firebase Anda
    final String temperaturePath = '/temperature.json';
    final String humidityPath = '/humidity.json';
    Stream.periodic(Duration(seconds: 5)).listen((_) async {
      try {
        final temperatureResponse = await http.get(
          Uri.parse('$databaseURL$temperaturePath'),
          headers: {
            "Cache-Control": "no-cache"
          }, // Tambahkan header Cache-Control
        );
        final humidityResponse = await http.get(
          Uri.parse('$databaseURL$humidityPath'),
          headers: {
            "Cache-Control": "no-cache"
          }, // Tambahkan header Cache-Control
        );
        print('Fetching data from Firebase...'); // Tambahkan print statement
        if (temperatureResponse.statusCode == 200 &&
            humidityResponse.statusCode == 200) {
          final Map<String, dynamic> temperatureData =
              json.decode(temperatureResponse.body);
          final Map<String, dynamic> humidityData =
              json.decode(humidityResponse.body);
          // Tambahkan data baru ke saluran
          if (!_controller.isClosed) {
            _controller.add({
              'temperature': temperatureData.values.last.toDouble() ?? 0.0,
              'humidity': humidityData.values.last.toDouble() ?? 0.0,
            });
          }
        } else {
          throw Exception('Failed to load data from Firebase');
        }
      } catch (error) {
        print('Error: $error');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Karena ini bukan widget UI, kembalikan container kosong
  }

  @override
  void dispose() {
    super.dispose();
  }
}
