// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HttpService {
//   final String baseUrl =
//       'https://sporebase-4a15a-default-rtdb.asia-southeast1.firebasedatabase.app';

//   Future<Map<String, dynamic>> fetchData() async {
//     try {
//       final temperatureResponse =
//           await http.get(Uri.parse('$baseUrl/temperature.json'));
//       final humidityResponse =
//           await http.get(Uri.parse('$baseUrl/humidity.json'));

//       if (temperatureResponse.statusCode == 200 &&
//           humidityResponse.statusCode == 200) {
//         final Map<String, dynamic> temperatureData =
//             json.decode(temperatureResponse.body);
//         final Map<String, dynamic> humidityData =
//             json.decode(humidityResponse.body);

//         return {
//           'temperature': temperatureData.values.last.toDouble() ?? 0.0,
//           'humidity': humidityData.values.last.toDouble() ?? 0.0,
//         };
//       } else {
//         throw Exception('Failed to load data from Firebase');
//       }
//     } catch (error) {
//       throw Exception('Error: $error');
//     }
//   }
// }
