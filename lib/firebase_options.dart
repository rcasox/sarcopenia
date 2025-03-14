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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDP7Tgy4TPN1NlagV0pxM00i8H1YWjNMVo',
    appId: '1:1062676113278:web:0ad1338f4107fc7eda352f',
    messagingSenderId: '1062676113278',
    projectId: 'untitled3-424fd',
    authDomain: 'untitled3-424fd.firebaseapp.com',
    databaseURL: 'https://untitled3-424fd-default-rtdb.firebaseio.com',
    storageBucket: 'untitled3-424fd.firebasestorage.app',
    measurementId: 'G-L3MQW451PS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyOa-Lc5xdMh62AgKmVKoiOv21qieniuU',
    appId: '1:1062676113278:android:973f7aab76ebfab0da352f',
    messagingSenderId: '1062676113278',
    projectId: 'untitled3-424fd',
    databaseURL: 'https://untitled3-424fd-default-rtdb.firebaseio.com',
    storageBucket: 'untitled3-424fd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5TU8-GOUjYC9N_T-yphCudNmFDnk1kLo',
    appId: '1:1062676113278:ios:535b54b95ff67c3dda352f',
    messagingSenderId: '1062676113278',
    projectId: 'untitled3-424fd',
    databaseURL: 'https://untitled3-424fd-default-rtdb.firebaseio.com',
    storageBucket: 'untitled3-424fd.firebasestorage.app',
    iosBundleId: 'com.example.sarcopenia',
  );
}
