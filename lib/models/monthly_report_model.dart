import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MonthlyReport with ChangeNotifier {
  double _averageTemperature = 0.0;
  double _averageHumidity = 0.0;
  int _wateringCount = 0;

  double get averageTemperature => _averageTemperature;
  double get averageHumidity => _averageHumidity;
  int get wateringCount => _wateringCount;

  Future<void> fetchData(String month) async {
    CollectionReference temperatureRef =
        FirebaseFirestore.instance.collection('temperature');
    CollectionReference humidityRef =
        FirebaseFirestore.instance.collection('humidity');
    CollectionReference wateringRef =
        FirebaseFirestore.instance.collection('watering');

    QuerySnapshot temperatureSnapshot =
        await temperatureRef.where('month', isEqualTo: month).get();
    QuerySnapshot humiditySnapshot =
        await humidityRef.where('month', isEqualTo: month).get();
    QuerySnapshot wateringSnapshot =
        await wateringRef.where('month', isEqualTo: month).get();

    List<double> temperatures = [];
    List<double> humidities = [];
    int wateringCount = 0;

    temperatureSnapshot.docs.forEach((doc) {
      temperatures.add(doc['value']);
    });

    humiditySnapshot.docs.forEach((doc) {
      humidities.add(doc['value']);
    });

    wateringSnapshot.docs.forEach((doc) {
      wateringCount += (doc['count'] as int); // Cast to int
    });

    _averageTemperature = temperatures.isNotEmpty
        ? temperatures.reduce((a, b) => a + b) / temperatures.length
        : 0.0;
    _averageHumidity = humidities.isNotEmpty
        ? humidities.reduce((a, b) => a + b) / humidities.length
        : 0.0;
    _wateringCount = wateringCount;

    notifyListeners();
  }
}
