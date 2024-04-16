import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

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
