import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyD6629aMsg-GPimXFqkNPGDnCK0Np-RaOA',
    appId: '1:894416249276:web:35fa07f639df21e740cbb9',
    messagingSenderId: '894416249276',
    projectId: 'prortfolio-e0868',
    authDomain: 'prortfolio-e0868.firebaseapp.com',
    databaseURL: 'https://prortfolio-e0868-default-rtdb.firebaseio.com',
    storageBucket: 'prortfolio-e0868.firebasestorage.app',
    measurementId: 'G-LVQLVGBB01',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6629aMsg-GPimXFqkNPGDnCK0Np-RaOA',
    appId: '1:894416249276:web:35fa07f639df21e740cbb9',
    messagingSenderId: '894416249276',
    projectId: 'prortfolio-e0868',
    storageBucket: 'prortfolio-e0868.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6629aMsg-GPimXFqkNPGDnCK0Np-RaOA',
    appId: '1:894416249276:web:35fa07f639df21e740cbb9',
    messagingSenderId: '894416249276',
    projectId: 'prortfolio-e0868',
    storageBucket: 'prortfolio-e0868.firebasestorage.app',
    iosBundleId: 'com.example.portfolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6629aMsg-GPimXFqkNPGDnCK0Np-RaOA',
    appId: '1:894416249276:web:35fa07f639df21e740cbb9',
    messagingSenderId: '894416249276',
    projectId: 'prortfolio-e0868',
    storageBucket: 'prortfolio-e0868.firebasestorage.app',
    iosBundleId: 'com.example.portfolio',
  );
}
