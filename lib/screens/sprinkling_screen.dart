import 'package:flutter/material.dart';
import 'package:sporemaster/screens/februari_screen.dart';
import 'package:sporemaster/screens/januari_screen.dart';
import 'package:sporemaster/screens/maret_screen.dart';
import 'package:sporemaster/screens/april_screen.dart';
import 'package:sporemaster/screens/mei_screen.dart';
import 'package:sporemaster/screens/juni_screen.dart';
import 'package:sporemaster/screens/juli_screen.dart';
import 'package:sporemaster/screens/agustus_screen.dart';
import 'package:sporemaster/screens/september_screen.dart';
import 'package:sporemaster/screens/oktober_screen.dart';
import 'package:sporemaster/screens/november_screen.dart';
import 'package:sporemaster/screens/desember_screen.dart';

class DetailMonthScreen extends StatelessWidget {
  final String month;

  DetailMonthScreen({required this.month});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Bulan'),
      ),
      body: Center(
        child: Text('Detail bulan: $month'),
      ),
    );
  }
}

// Lanjutkan untuk bulan-bulan lainnya...

class SprinklingScreen extends StatefulWidget {
  @override
  _SprinklingScreenState createState() => _SprinklingScreenState();
}

class _SprinklingScreenState extends State<SprinklingScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Monitoring Penyiraman'),
        backgroundColor: Color.fromRGBO(255, 135, 9, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 0, right: 0),
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/top_background.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2, // Ubah jumlah kolom menjadi 3
                crossAxisSpacing: 10, // Ubah spasi antar kolom menjadi 10
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 1,
                // Ubah spasi antar baris menjadi 10
                children: List.generate(12, (index) {
                  List<String> months = [
                    'Januari',
                    'Februari',
                    'Maret',
                    'April',
                    'Mei',
                    'Juni',
                    'Juli',
                    'Agustus',
                    'September',
                    'Oktober',
                    'November',
                    'Desember'
                  ];

                  return GestureDetector(
                    onTap: () {
                      // Tambahkan aksi saat kotak bulan diklik
                      // Contoh: Navigasi ke tampilan detail bulan sesuai dengan bulan yang diklik
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JanuariScreen()),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FebruariScreen()),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MaretScreen()),
                          );
                          break;
                        case 3:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AprilScreen()),
                          );
                          break;
                        case 4:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MeiScreen()),
                          );
                          break;
                        case 5:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JuniScreen()),
                          );
                          break;
                        case 6:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JuliScreen()),
                          );
                          break;
                        case 7:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AgustusScreen()),
                          );
                          break;
                        case 8:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeptemberScreen()),
                          );
                          break;
                        case 9:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OktoberScreen()),
                          );
                          break;
                        case 10:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NovemberScreen()),
                          );
                          break;
                        case 11:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DesemberScreen()),
                          );
                          break;
                        case 12:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JanuariScreen()),
                          );
                          break;
                        // Tambahkan case untuk bulan-bulan lainnya sesuai kebutuhan
                        default:
                          break;
                      }
                    },
                    child: Container(
                      width: w * 0.25, // Menggunakan 25% dari lebar layar
                      height: h * 0.08, // Menggunakan 10% dari tinggi layar
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            months[index],
                            style: TextStyle(
                              fontSize: 16, // Mengurangi ukuran font
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 0, right: 0),
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bottom_background.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
