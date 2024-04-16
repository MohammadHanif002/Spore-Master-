import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  Future<void> saveDataToFirestore(String imageUrl) async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        bool userExists = (await FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .get())
            .exists;

        if (userExists) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .update({
            'profileImage': imageUrl,
          });
        } else {
          await FirebaseFirestore.instance.collection('users').doc(userId).set({
            'profileImage': imageUrl,
          });
        }
      }
    } catch (error) {
      print('Error saving data to Firestore: $error');
    }
  }
}
