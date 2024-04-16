import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // Memeriksa apakah email sudah terdaftar sebelumnya
      final isEmailRegistered = await checkIfEmailRegistered(email);
      if (isEmailRegistered) {
        print('Email sudah terdaftar');
        throw 'Alamat email sudah digunakan oleh akun lain.';
      }

      // Melakukan registrasi jika email belum terdaftar
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Registrasi berhasil');
    } catch (e) {
      print('Registrasi gagal: $e');
      throw e; // Re-throw error untuk menangani di sisi UI
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Validasi alamat email
      if (!isValidEmail(email)) {
        throw 'Alamat email tidak valid.';
      }

      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Login berhasil');
    } catch (e) {
      print('Login gagal: $e');
      throw e;
    }
  }

// Fungsi untuk memeriksa apakah alamat email valid
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<bool> checkIfEmailRegistered(String email) async {
    try {
      final result = await _firebaseAuth.fetchSignInMethodsForEmail(email);
      return result.isNotEmpty;
    } catch (e) {
      print('Error saat memeriksa email: $e');
      return false;
    }
  }
}
