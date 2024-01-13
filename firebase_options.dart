// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart'
    show FirebaseOptions;
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
    apiKey: 'AIzaSyAHFvJ705c8ttQdZ3kPSRRij2rYsFLTyXI',
    appId: '1:333710136321:web:2161109ecbcfbfee3f9c00',
    messagingSenderId: '333710136321',
    projectId: 'login-6414b',
    authDomain: 'login-6414b.firebaseapp.com',
    storageBucket: 'login-6414b.appspot.com',
    measurementId: 'G-EZPFPFKTSR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDF2YnA_sYswBDJ_SYyow4IQPCSUkCmwpo',
    appId: '1:333710136321:android:d00c8326f669abfa3f9c00',
    messagingSenderId: '333710136321',
    projectId: 'login-6414b',
    storageBucket: 'login-6414b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTN0QbOQzhGCQqlW4FILl4axlogNQ1LQk',
    appId: '1:333710136321:ios:c90ddc3be50222ee3f9c00',
    messagingSenderId: '333710136321',
    projectId: 'login-6414b',
    storageBucket: 'login-6414b.appspot.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTN0QbOQzhGCQqlW4FILl4axlogNQ1LQk',
    appId: '1:333710136321:ios:70a1506a4d9bbee13f9c00',
    messagingSenderId: '333710136321',
    projectId: 'login-6414b',
    storageBucket: 'login-6414b.appspot.com',
    iosBundleId: 'com.example.login.RunnerTests',
  );
}
