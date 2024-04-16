import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sporemaster/screens/petani_screen.dart';

class FarmerDataAdmin extends StatefulWidget {
  @override
  _FarmerDataAdminState createState() => _FarmerDataAdminState();
}

class _FarmerDataAdminState extends State<FarmerDataAdmin> {
  List<String>? farmers;

  @override
  void initState() {
    super.initState();
    _fetchFarmers();
  }

  Future<void> _fetchFarmers() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('farmers').get();

      List<String> farmerNames =
          querySnapshot.docs.map((doc) => doc['name'] as String).toList();

      setState(() {
        farmers = farmerNames;
      });
    } catch (e) {
      print('Error fetching farmers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Data Petani'),
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
            farmers != null && farmers!.isNotEmpty
                ? Container(
                    padding: EdgeInsets.all(20),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 1,
                      children: List.generate(farmers!.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigasi ke halaman detail petani yang sesuai
                            String farmerName = farmers![index];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    getPetaniScreen(farmerName),
                              ),
                            );
                          },
                          child: Container(
                            width: w * 0.25,
                            height: h * 0.08,
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
                                  farmers![index], // Nama petani
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                : SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 1,
                children: List.generate(12, (index) {
                  List<String> petani = [
                    'Petani 1',
                    'Petani 2',
                    'Petani 3',
                    'Petani 4',
                    'Petani 5',
                    'Petani 6',
                    'Petani 7',
                    'Petani 8',
                    'Petani 9',
                    'Petani 10',
                    'Petani 11',
                    'Petani 12'
                  ];

                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail petani yang sesuai
                      String petaniName = petani[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => getPetaniScreen(petaniName),
                        ),
                      );
                    },
                    child: Container(
                      width: w * 0.25,
                      height: h * 0.08,
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
                            petani[index],
                            style: TextStyle(
                              fontSize: 16,
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

  Widget getPetaniScreen(String farmerName) {
    switch (farmerName) {
      case 'Petani 1':
        return Petani1Screen();
      case 'Petani 2':
        return Petani2Screen();
      case 'Petani 3':
        return Petani3Screen();
      case 'Petani 4':
        return Petani4Screen();
      case 'Petani 5':
        return Petani5Screen();
      case 'Petani 6':
        return Petani6Screen();
      case 'Petani 7':
        return Petani7Screen();
      case 'Petani 8':
        return Petani8Screen();
      case 'Petani 9':
        return Petani9Screen();
      case 'Petani 10':
        return Petani10Screen();
      case 'Petani 11':
        return Petani11Screen();
      case 'Petani 12':
        return Petani12Screen();
      default:
        return Container();
    }
  }
}
