// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class DataProvider with ChangeNotifier {
//   final DatabaseReference _databaseRef = FirebaseDatabase.instance.reference();
//   double _temperature = 0.0;
//   double _humidity = 0.0;

//   double get temperature => _temperature;
//   double get humidity => _humidity;

//   DataProvider() {
//     _databaseRef
//         .child('temperature')
//         .orderByKey()
//         .limitToLast(1)
//         .onValue
//         .listen((event) {
//       if (event.snapshot.value != null) {
//         var data = (event.snapshot.value as Map<dynamic, dynamic>).values.last;
//         _temperature = double.parse(data.toString());
//         notifyListeners();
//       }
//     });

//     _databaseRef
//         .child('humidity')
//         .orderByKey()
//         .limitToLast(1)
//         .onValue
//         .listen((event) {
//       if (event.snapshot.value != null) {
//         var data = (event.snapshot.value as Map<dynamic, dynamic>).values.last;
//         _humidity = double.parse(data.toString());
//         notifyListeners();
//       }
//     });
//   }
// }
