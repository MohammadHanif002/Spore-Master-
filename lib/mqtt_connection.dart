// import 'package:sporemaster/mqtt_client.dart';
// import 'package:sporemaster/mqtt_server_client.dart';


// MqttServerClient? mqttClient;

// void connect() async {
//   mqttClient = MqttServerClient('your_broker_address', '');

//   mqttClient!.logging(on: false);
//   mqttClient!.onDisconnected = onDisconnected;
//   mqttClient!.onConnected = onConnected;
//   mqttClient!.onSubscribed = onSubscribed;
//   mqttClient!.onUnsubscribed = onUnsubscribed;

//   final connMess = MqttConnectMessage()
//       .withClientIdentifier('your_client_id')
//       .keepAliveFor(60)
//       .startClean()
//       .authenticateAs('your_username', 'your_password');

//   mqttClient!.connectionMessage = connMess;

//   try {
//     await mqttClient!.connect();
//   } catch (e) {
//     print('Exception: $e');
//     mqttClient!.disconnect();
//   }
// }

// void onDisconnected() {
//   print('Disconnected');
// }

// void onConnected() {
//   print('Connected');
// }

// void onSubscribed(String topic) {
//   print('Subscribed to topic $topic');
// }

// void onUnsubscribed(String topic) {
//   print('Unsubscribed from topic $topic');
// }

// void closeConnection() {
//   mqttClient?.disconnect();
// }
