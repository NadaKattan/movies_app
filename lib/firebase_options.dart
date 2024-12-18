// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCVKLoQ0VmFspQiXTK_0xeYhwI_6aTtHOM',
    appId: '1:895535257043:web:f06a36331e5bb9f3d8cb26',
    messagingSenderId: '895535257043',
    projectId: 'movies-app-9bff2',
    authDomain: 'movies-app-9bff2.firebaseapp.com',
    storageBucket: 'movies-app-9bff2.firebasestorage.app',
    measurementId: 'G-V3WZ4SPC79',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_2s2P8Xq8LRX63sAst0fpYaxusC5eYGg',
    appId: '1:895535257043:android:8a689705b2147ef4d8cb26',
    messagingSenderId: '895535257043',
    projectId: 'movies-app-9bff2',
    storageBucket: 'movies-app-9bff2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjW0SiR7RPfizTxmKnarf_VLlMvkaD228',
    appId: '1:895535257043:ios:e61b0aacf1242bf9d8cb26',
    messagingSenderId: '895535257043',
    projectId: 'movies-app-9bff2',
    storageBucket: 'movies-app-9bff2.firebasestorage.app',
    iosBundleId: 'com.example.moviesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjW0SiR7RPfizTxmKnarf_VLlMvkaD228',
    appId: '1:895535257043:ios:e61b0aacf1242bf9d8cb26',
    messagingSenderId: '895535257043',
    projectId: 'movies-app-9bff2',
    storageBucket: 'movies-app-9bff2.firebasestorage.app',
    iosBundleId: 'com.example.moviesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCVKLoQ0VmFspQiXTK_0xeYhwI_6aTtHOM',
    appId: '1:895535257043:web:1e97db859a69cac1d8cb26',
    messagingSenderId: '895535257043',
    projectId: 'movies-app-9bff2',
    authDomain: 'movies-app-9bff2.firebaseapp.com',
    storageBucket: 'movies-app-9bff2.firebasestorage.app',
    measurementId: 'G-7CLH1ZE1TT',
  );
}
