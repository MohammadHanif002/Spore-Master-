import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  late File _image; // Menggunakan File dari dart:io

  @override
  void initState() {
    super.initState();
    _image = File(''); // Menginisialisasi _image dengan nilai kosong
    // Inisialisasi nilai awal untuk setiap TextField jika diperlukan
    emailController.text = ''; // Isi dengan nilai awal
    phoneController.text = ''; // Isi dengan nilai awal
    addressController.text = ''; // Isi dengan nilai awal
    cityController.text = ''; // Isi dengan nilai awal
    postalCodeController.text = ''; // Isi dengan nilai awal
    ageController.text = ''; // Isi dengan nilai awal
    genderController.text = ''; // Isi dengan nilai awal
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      // Upload image to Firebase Storage
      String imageUrl = await uploadImageToFirebaseStorage(_image);

      // Save image URL to Firestore
      await _saveDataToFirestore(); // Perbaikan disini
    } else {
      print('Tidak ada gambar yang dipilih.');
    }
  }

  Future<String> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      // Generate a unique filename for the image
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Upload the image to Firebase Storage
      final Reference ref =
          FirebaseStorage.instance.ref().child('images/$fileName.jpg');
      await ref.putFile(imageFile);

      // Get the download URL for the image
      String imageUrl = await ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return '';
    }
  }

  Future<void> _saveDataToFirestore() async {
    // Mendapatkan nilai input dari pengguna
    String email = emailController.text;
    String phone = phoneController.text;
    String address = addressController.text;
    String city = cityController.text;
    String postalCode = postalCodeController.text;
    int age = int.tryParse(ageController.text) ?? 0;
    String gender = genderController.text;

    try {
      // Mendapatkan ID pengguna saat ini
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        // Memeriksa apakah dokumen pengguna sudah ada
        bool userExists = (await FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .get())
            .exists;

        // Memperbarui data pengguna jika dokumen sudah ada, jika tidak, tambahkan dokumen baru
        if (userExists) {
          // Memperbarui data pengguna yang ada di Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .update({
            'email': email,
            'phone': phone,
            'address': address,
            'city': city,
            'postalCode': postalCode,
            'age': age,
            'gender': gender,
            'profileImage': _image.path, // Simpan path gambar ke Firestore
          });
        } else {
          // Menambahkan dokumen baru ke Firestore
          await FirebaseFirestore.instance.collection('users').doc(userId).set({
            'email': email,
            'phone': phone,
            'address': address,
            'city': city,
            'postalCode': postalCode,
            'age': age,
            'gender': gender,
          });
        }

        // Menampilkan pesan berhasil jika penyimpanan berhasil
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data berhasil disimpan di Firestore')),
        );

        // Kembali ke halaman sebelumnya
        Navigator.pop(context);
      }
    } catch (error) {
      // Menampilkan pesan kesalahan jika penyimpanan gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
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
          // Ubah ukuran icon sesuai kebutuhan
          iconSize: 24,
        ),
        toolbarHeight: 40.0, // Menetapkan tinggi app bar
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
            ),

            // isi widget ada di sini
            Column(
              children: [
                SizedBox(height: h * 0.05),
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: w * 0.15,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        _image.path.isNotEmpty ? FileImage(_image) : null,
                    child: _image.path.isEmpty
                        ? Icon(Icons.camera_alt, size: w * 0.1)
                        : null,
                  ),
                ),
                SizedBox(height: h * 0.02),
                Text(
                  'PETANI',
                  style: TextStyle(
                      fontSize: w * 0.08, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: h * 0.02),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: 'Nomor HP'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(labelText: 'Alamat'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(labelText: 'Kota'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: postalCodeController,
                    decoration: InputDecoration(labelText: 'Kode Pos'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(labelText: 'Usia'),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                  child: TextField(
                    controller: genderController,
                    decoration: InputDecoration(labelText: 'Jenis Kelamin'),
                  ),
                ),

                SizedBox(height: h * 0.03), // Tambahkan jarak di sini

                Container(
                  width: w * 0.4,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 3, 123, 3), // Ganti warna sesuai keinginan
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: _saveDataToFirestore,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 3, 123, 3), // Atur warna latar belakang tombol
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
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
}
