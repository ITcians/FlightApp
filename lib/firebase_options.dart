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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBq_CDuG_QvN2XtLkepZz2y_HV0jvwfwcs',
    appId: '1:256489545026:web:8de09ad06cc6818b55bcdb',
    messagingSenderId: '256489545026',
    projectId: 'todos-1f195',
    authDomain: 'todos-1f195.firebaseapp.com',
    storageBucket: 'todos-1f195.appspot.com',
    measurementId: 'G-PWG1YMN15D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEwEMWA_YBUiI4WL1oQCOYOstYGXMZPyw',
    appId: '1:256489545026:android:4cf1a4ee0529a42255bcdb',
    messagingSenderId: '256489545026',
    projectId: 'todos-1f195',
    storageBucket: 'todos-1f195.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAF4S3siE6K4oDKqfdA9X-gjItiQpUoBTg',
    appId: '1:256489545026:ios:d9a74522ed719c9b55bcdb',
    messagingSenderId: '256489545026',
    projectId: 'todos-1f195',
    storageBucket: 'todos-1f195.appspot.com',
    iosClientId: '256489545026-j61pomgfu3cha7faku5p33n2eo69pgg3.apps.googleusercontent.com',
    iosBundleId: 'com.example.flightfare',
  );
}