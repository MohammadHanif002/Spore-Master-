import 'dart:async'; // Tambahkan ini untuk StreamSubscription
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:logging/logging.dart';
// import 'package:sporemaster/screens/temperature_screen.dart';

class SensorData with ChangeNotifier {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();
  final Logger _logger = Logger('SensorData');

  Map<String, dynamic> _data = {};
  StreamSubscription<DatabaseEvent>? _subscription;

  Map<String, dynamic> get data => _data;

  SensorData() {
    _initialize();
  }

  void _initialize() {
    _subscription = _databaseRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        final data = event.snapshot.value as Map<dynamic, dynamic>;
        _data = Map<String, dynamic>.from(data);
        _logData();
        notifyListeners();
      } else {
        _logger.warning('No data received from Firebase');
      }
    }, onError: (error) {
      _logger.severe('Error listening to database: $error');
    });
  }

  void _logData() {
    if (_data.containsKey('temperature')) {
      double temperature = _getLatestValue(_data['temperature']);
      _logger.info('Temperature data received: $temperature');
    }
    if (_data.containsKey('humidity')) {
      double humidity = _getLatestValue(_data['humidity']);
      _logger.info('Humidity data received: $humidity');
    }
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

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Future<void> toggleRelayStatus(int currentStatus) async {
    int newStatus = currentStatus == 0 ? 1 : 0;
    await _databaseRef.child('relayStatus').set(newStatus);
  }
}
