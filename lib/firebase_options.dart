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
    apiKey: 'AIzaSyD80eROH-QaiihePA3OPTq_gnJwXshZ76w',
    appId: '1:194655888993:web:3da89a6ea8d9578833ac20',
    messagingSenderId: '194655888993',
    projectId: 'flutterproject-e7355',
    authDomain: 'flutterproject-e7355.firebaseapp.com',
    databaseURL: 'https://flutterproject-e7355-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutterproject-e7355.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzG7sfAlqYdLVFkotnRLuHhNjY0_anaVs',
    appId: '1:194655888993:android:7fe287255ed16bef33ac20',
    messagingSenderId: '194655888993',
    projectId: 'flutterproject-e7355',
    databaseURL: 'https://flutterproject-e7355-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutterproject-e7355.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqAtUENHsfQQEA3JWiZqM5scjm0Vy8rhg',
    appId: '1:194655888993:ios:f40da4b324eef42233ac20',
    messagingSenderId: '194655888993',
    projectId: 'flutterproject-e7355',
    databaseURL: 'https://flutterproject-e7355-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutterproject-e7355.appspot.com',
    iosBundleId: 'com.example.gamestore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqAtUENHsfQQEA3JWiZqM5scjm0Vy8rhg',
    appId: '1:194655888993:ios:9b72129b27ee750e33ac20',
    messagingSenderId: '194655888993',
    projectId: 'flutterproject-e7355',
    databaseURL: 'https://flutterproject-e7355-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutterproject-e7355.appspot.com',
    iosBundleId: 'com.example.gamestore.RunnerTests',
  );
}