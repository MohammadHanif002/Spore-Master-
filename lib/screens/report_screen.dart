import 'package:flutter/material.dart';
import 'package:sporemaster/screens/farmer_login_screen.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FarmerLoginScreen(), // Ganti dengan halaman beranda yang sesuai
    );
  }
}
