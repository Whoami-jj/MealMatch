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
    apiKey: 'AIzaSyDeJkjzS3Lfv2JCLqAiqEBQZaYpThqqS1c',
    appId: '1:807135358655:web:f37ffd4ab8513e3436e00a',
    messagingSenderId: '807135358655',
    projectId: 'signinloginflutter',
    authDomain: 'signinloginflutter.firebaseapp.com',
    storageBucket: 'signinloginflutter.appspot.com',
    measurementId: 'G-H32PYNX7JZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPQgfleLzLFcutEJjae4-hWqlWN8XMnjA',
    appId: '1:807135358655:android:536a3af699e4cf8e36e00a',
    messagingSenderId: '807135358655',
    projectId: 'signinloginflutter',
    storageBucket: 'signinloginflutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTEYMVBjUKm_OdW6O4SPJ7o8W-y31fhtc',
    appId: '1:807135358655:ios:a8bb478ff3023f6b36e00a',
    messagingSenderId: '807135358655',
    projectId: 'signinloginflutter',
    storageBucket: 'signinloginflutter.appspot.com',
    iosBundleId: 'com.example.mealMatch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTEYMVBjUKm_OdW6O4SPJ7o8W-y31fhtc',
    appId: '1:807135358655:ios:f28bdf1592a083dc36e00a',
    messagingSenderId: '807135358655',
    projectId: 'signinloginflutter',
    storageBucket: 'signinloginflutter.appspot.com',
    iosBundleId: 'com.example.mealMatch.RunnerTests',
  );
}
