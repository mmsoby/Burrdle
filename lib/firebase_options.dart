// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC-vJ94670Jj3BHqc0OsG9r0vwyl7D-MRQ',
    appId: '1:137802598215:web:476ebbd7aab40ebfdfae62',
    messagingSenderId: '137802598215',
    projectId: 'burrdle',
    authDomain: 'burrdle.firebaseapp.com',
    storageBucket: 'burrdle.appspot.com',
    measurementId: 'G-PBQPQSXWFW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBH1FgTD9lJcJYTdWEKTVkG3rokkWwZWdw',
    appId: '1:137802598215:android:596cf393e016107fdfae62',
    messagingSenderId: '137802598215',
    projectId: 'burrdle',
    storageBucket: 'burrdle.appspot.com',
  );
}
