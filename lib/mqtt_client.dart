// import 'package:flutter/material.dart';
// import 'package:mqtt_client/mqtt_client.dart';

// class MQTTManager {
//   MqttClient? client;

//   void connect() async {
//     client = MqttClient('broker.example.com', '');
//     client?.port = 1883;
//     client?.logging(on: true);

//     final connMessage = MqttConnectMessage()
//         .withClientIdentifier('flutter_client')
//         .startClean();

//     client?.connectionMessage = connMessage;

//     try {
//       await client?.connect();
//       print('Connected to broker');
//     } catch (e) {
//       print('Exception: $e');
//       client?.disconnect();
//     }
//   }

//   void subscribe(String topic) {
//     client?.subscribe(topic, MqttQos.atLeastOnce);
//     client?.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
//       final payload =
//           MqttPublishPayload.bytesToStringAsString(recMess.payload.message!);
//       print('Received message: $payload from topic: ${c[0].topic}');
//     });
//   }

//   void publish(String topic, String message) {
//     final builder = MqttClientPayloadBuilder();
//     builder.addString(message);
//     client?.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
//   }
// }

// void main() {
//   // Membuat instance dari MQTTManager
//   MQTTManager mqttManager = MQTTManager();

//   // Menjalankan metode connect untuk melakukan koneksi ke broker MQTT
//   mqttManager.connect();

//   // Menjalankan metode publish untuk mengirim pesan ke perangkat IoT
//   mqttManager.publish('topik_publish', 'pesan_yang_ingin_dikirim');
// }
