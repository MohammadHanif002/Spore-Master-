// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: 'AIzaSyBhL5RnU_VjRiBAKkndPzR9ZAp3vBBDpQM',
      appId: '1:302661394551:web:bda578e7a5092782012672',
      messagingSenderId: '302661394551',
      projectId: 'sporebase-4a15a',
      authDomain: 'sporebase-4a15a.firebaseapp.com',
      storageBucket: 'sporebase-4a15a.appspot.com',
      measurementId: 'G-X3LX7DC6W2',
      databaseURL:
          'https://sporebase-4a15a-default-rtdb.asia-southeast1.firebasedatabase.app/');

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyAVFLG6dpTkzjhVH-LXaBt_gJXBYHyqiEs',
      appId: '1:302661394551:android:7d0b61a9e352bda3012672',
      messagingSenderId: '302661394551',
      projectId: 'sporebase-4a15a',
      storageBucket: 'sporebase-4a15a.appspot.com',
      databaseURL:
          'https://sporebase-4a15a-default-rtdb.asia-southeast1.firebasedatabase.app/');

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFfZAfvIU0Osn7yx-OWCtZHomR5W5m-s8',
    appId: '1:302661394551:ios:419ec78d278d25f3012672',
    messagingSenderId: '302661394551',
    projectId: 'sporebase-4a15a',
    storageBucket: 'sporebase-4a15a.appspot.com',
    iosBundleId: 'com.example.sporemaster',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFfZAfvIU0Osn7yx-OWCtZHomR5W5m-s8',
    appId: '1:302661394551:ios:7ae4544aec7c5b09012672',
    messagingSenderId: '302661394551',
    projectId: 'sporebase-4a15a',
    storageBucket: 'sporebase-4a15a.appspot.com',
    iosBundleId: 'com.example.sporemaster.RunnerTests',
  );
}
