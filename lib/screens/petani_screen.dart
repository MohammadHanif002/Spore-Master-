import 'package:flutter/material.dart';
import 'package:sporemaster/screens/edit_profile_screen.dart';

// Halaman Petani 1

class Petani2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman petani 1

// Halaman petani 2

class Petani1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 2

// Halaman Petani 3

class Petani3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 3

// Halaman Petani 4

class Petani4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 4

// Halaman Petani 5

class Petani5Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 5

// Halaman Petani 6

class Petani6Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 6

// Halaman Petani 7

class Petani7Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 7

// Halaman Petani 8

class Petani8Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 8

// Halaman Petani 9

class Petani9Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 9

// Halaman Petani 10

class Petani10Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 10

// Halaman Petani 11

class Petani11Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 11

//  Halaman Petani 12

class Petani12Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 135, 9, 1),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 24,
            ),
            toolbarHeight: 40.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: w * 0.15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: AssetImage(
                            "assets/images/default_profile_image.jpg"),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'PETANI',
                        style: TextStyle(
                          fontSize: w * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
                  width: 400.0,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileInfoRow('Nama', 'John Doe'),
                      _buildProfileInfoRow('Nomor HP', '+1234567890'),
                      _buildProfileInfoRow('Alamat', 'Jl. Raya No. 123'),
                      _buildProfileInfoRow('Kota', 'Jakarta'),
                      _buildProfileInfoRow('Kode Pos', '12345'),
                      _buildProfileInfoRow('Usia', '30 tahun'),
                      _buildProfileInfoRow('Jenis Kelamin', 'Laki-laki'),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
                Container(
                  width: w * 0.4,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 3, 123, 3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      ).then((result) {
                        if (result != null) {
                          // Gunakan data yang dikembalikan untuk memperbarui tampilan ProfileScreen
                          // Contoh:
                          // setState(() {
                          //   email = result['email'];
                          //   phone = result['phone'];
                          //   address = result['address'];
                          //   // Dan seterusnya untuk setiap data yang ingin diupdate
                          // });
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 123, 3),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ubah Profil',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.05),
                Container(
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
        ),
      ],
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            '$label : $value',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

// Tutup Halaman Petani 12
