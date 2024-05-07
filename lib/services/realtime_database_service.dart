// import 'package:firebase_database/firebase_database.dart';
// import 'package:sporemaster/services/database_service.dart';

// class RealtimeDatabaseService {
//   final DatabaseReference _database = FirebaseDatabase.instance.reference();

//   // Method untuk mendapatkan data suhu dan kelembapan dari Firebase Realtime Database
//   Future<Map<String, dynamic>> getTemperatureAndHumidityData() async {
//     try {
//       // Dapatkan referensi ke node data suhu dan kelembapan
//       DataSnapshot snapshot =
//           await _database.child('temperature_humidity').once();

//       // Periksa apakah snapshot memiliki nilai
//       if (snapshot.value != null) {
//         // Ubah nilai snapshot menjadi Map
//         Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.value);
//         return data;
//       } else {
//         // Jika snapshot tidak memiliki nilai, kembalikan nilai null
//         return null;
//       }
//     } catch (e) {
//       // Tangani kesalahan jika terjadi
//       print('Error getting temperature and humidity data: $e');
//       return null;
//     }
//   }

//   // Method untuk subscribe ke perubahan data suhu dan kelembapan
//   void subscribeToTemperatureAndHumidityData(
//       void onData(Map<String, dynamic> data)) {
//     // Langganan ke node data suhu dan kelembapan
//     _database.child('temperature_humidity').onValue.listen((event) {
//       // Dapatkan data dari event
//       Map<dynamic, dynamic> values =
//           Map<dynamic, dynamic>.from(event.snapshot.value);

//       // Panggil fungsi onData untuk mengirimkan data ke pemanggil
//       onData(values);
//     });
//   }
// }

// class RealtimeDatabaseService {
//   final DatabaseReference _database = FirebaseDatabase.instance.reference();

//   // Method untuk mendapatkan data suhu dan kelembapan dari Firebase Realtime Database
//   Future<Map<String, dynamic>> getTemperatureAndHumidityData() async {
//     try {
//       // Dapatkan referensi ke node data suhu dan kelembapan
//       DataSnapshot snapshot =
//           await _database.child('temperature_humidity').once();

//       // Periksa apakah snapshot memiliki nilai
//       if (snapshot.value != null) {
//         // Ubah nilai snapshot menjadi Map
//         Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.value);
//         return data;
//       } else {
//         // Jika snapshot tidak memiliki nilai, kembalikan nilai null
//         return null;
//       }
//     } catch (e) {
//       // Tangani kesalahan jika terjadi
//       print('Error getting temperature and humidity data: $e');
//       return null;
//     }
//   }

//   // Method untuk subscribe ke perubahan data suhu dan kelembapan
//   void subscribeToTemperatureAndHumidityData(
//       void onData(Map<String, dynamic> data)) {
//     // Langganan ke node data suhu dan kelembapan
//     _database.child('temperature_humidity').onValue.listen((event) {
//       // Dapatkan data dari event
//       Map<dynamic, dynamic> values =
//           Map<dynamic, dynamic>.from(event.snapshot.value);

//       // Panggil fungsi onData untuk mengirimkan data ke pemanggil
//       onData(values);
//     });
//   }
// }
