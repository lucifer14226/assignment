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
    apiKey: 'AIzaSyC7WljWZRY9v_xWQToBURzDEBPQHxoi-vA',
    appId: '1:516729246787:web:5be7cdb18c059909f0b0f6',
    messagingSenderId: '516729246787',
    projectId: 'fease-money-68689',
    authDomain: 'fease-money-68689.firebaseapp.com',
    storageBucket: 'fease-money-68689.appspot.com',
    measurementId: 'G-44Y45YS5SS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxhthZfVfmYkMFxKObuBCw-1fkRWP24gE',
    appId: '1:516729246787:android:6fea5e5540103b1df0b0f6',
    messagingSenderId: '516729246787',
    projectId: 'fease-money-68689',
    storageBucket: 'fease-money-68689.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJjRt9ofd2fCro2cID8YbW2TgMsN3kuJo',
    appId: '1:516729246787:ios:c6a03296e40992ecf0b0f6',
    messagingSenderId: '516729246787',
    projectId: 'fease-money-68689',
    storageBucket: 'fease-money-68689.appspot.com',
    iosBundleId: 'com.example.newsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJjRt9ofd2fCro2cID8YbW2TgMsN3kuJo',
    appId: '1:516729246787:ios:37f46af3e02fe66ff0b0f6',
    messagingSenderId: '516729246787',
    projectId: 'fease-money-68689',
    storageBucket: 'fease-money-68689.appspot.com',
    iosBundleId: 'com.example.newsapp.RunnerTests',
  );
}
