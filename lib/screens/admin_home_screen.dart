import 'package:flutter/material.dart';
import 'package:sporemaster/screens/farmer_data_admin.dart';
import 'package:sporemaster/screens/sprinkling_data_admin.dart';
import 'package:sporemaster/screens/farmer_login_screen.dart';
import 'package:sporemaster/screens/profile_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SporeMaster',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            actions: [
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  // Tambahkan aksi ketika ikon profil ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.orange[200],
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('22°C'),
                        Text('Suhu Rata-rata'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('60°F'),
                        Text('Suhu Luar'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('60 %'),
                        Text('Kelembaban'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('3'),
                        Text('Perangkat'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      // child: Text(
                      //   'Ruangan',
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ),
                    GridView.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20.0,
                      shrinkWrap: true,
                      primary: false,
                      childAspectRatio: 2.0,
                      children: [
                        roomButton("Data Petani", 'assets/images/hot.png',
                            FarmerDataAdmin(),
                            color: Color.fromRGBO(255, 135, 9, 1),
                            textColor: Colors.white),
                        roomButton("Data Penyiraman",
                            'assets/images/sprinkle.png', SprinklingDataAdmin(),
                            color: Color.fromRGBO(1, 128, 220, 1),
                            textColor: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
              ),
              // Tambahkan bagian perangkat yang digunakan di sini
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 8, // Atur ketinggian bottom navigation bar di sini
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Exit',
            ),
          ],
          selectedItemColor: Color.fromRGBO(255, 135, 9, 1),
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            switch (index) {
              case 0:
                // Handle home button tap
                break;
              case 1:
                // Handle search button tap
                break;
              case 2:
                // Navigate to profile screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
                break;
              case 3:
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(
                        child: Text(
                          "Konfirmasi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      content: Text("Apakah Anda ingin keluar Aplikasi?"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text(
                                  "Tidak",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20), // Jarak antara tombol
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FarmerLoginScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 8),
                                child: Text(
                                  "Ya",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
                break;
            }
          },
        ),
      ),
    );
  }

  Widget roomButton(String name, String imagePath, Widget destination,
      {Color? color, Color? textColor}) {
    return GestureDetector(
      onTap: () {
        // Tambahkan aksi ketika tombol ruangan ditekan
        // Contoh: Navigasi ke tampilan selanjutnya berdasarkan tombol yang ditekan
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        color: color,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 60,
                height: 60,
              ),
              SizedBox(height: 20),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
