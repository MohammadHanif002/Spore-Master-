import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporemaster/models/sensor_data_model.dart';
import 'package:sporemaster/screens/splash_screen.dart';
import 'package:sporemaster/screens/januari_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Mengatur locale ke bahasa Indonesia
    FirebaseAuth.instance.setLanguageCode('id'); // 'id' untuk bahasa Indonesia

    // Mengaktifkan App Check dengan provider yang sesuai
    await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider(
          'your-recaptcha-site-key'), // Ganti dengan kunci situs reCAPTCHA Anda
      androidProvider: AndroidProvider
          .debug, // Gunakan 'AndroidProvider.playIntegrity' di production
    );

    _setupLogging(); // Tambahkan setup logging

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SensorData()),
        ],
        child: MyApp(),
      ),
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spore Master',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SplashScreen(),
    );
  }
}
