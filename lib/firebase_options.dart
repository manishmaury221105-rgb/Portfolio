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
    apiKey: 'AIzaSyBedvmLj7UW0bI83CixXq38A38wxFX5grA',
    appId: '1:237047753852:web:ddda5f49a0431542b16df9',
    messagingSenderId: '237047753852',
    projectId: 'qr-maker-cf84a',
    authDomain: 'qr-maker-cf84a.firebaseapp.com',
    databaseURL: 'https://qr-maker-cf84a-default-rtdb.firebaseio.com',
    storageBucket: 'qr-maker-cf84a.firebasestorage.app',
    measurementId: 'G-8RECEMC61V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBedvmLj7UW0bI83CixXq38A38wxFX5grA',
    appId: '1:237047753852:android:1da5dbadd4934bffb16df9',
    messagingSenderId: '237047753852',
    projectId: 'qr-maker-cf84a',
    storageBucket: 'qr-maker-cf84a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBedvmLj7UW0bI83CixXq38A38wxFX5grA',
    appId: '1:237047753852:ios:1da5dbadd4934bffb16df9',
    messagingSenderId: '237047753852',
    projectId: 'qr-maker-cf84a',
    storageBucket: 'qr-maker-cf84a.firebasestorage.app',
    iosBundleId: 'com.example.portfolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBedvmLj7UW0bI83CixXq38A38wxFX5grA',
    appId: '1:237047753852:ios:1da5dbadd4934bffb16df9',
    messagingSenderId: '237047753852',
    projectId: 'qr-maker-cf84a',
    storageBucket: 'qr-maker-cf84a.firebasestorage.app',
    iosBundleId: 'com.example.portfolio',
  );
}
