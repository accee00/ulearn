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
    apiKey: 'AIzaSyDF0N-wZvVMGFvJaCxxEBljxJ1tqUnLv7A',
    appId: '1:636456299763:web:5721d556deff905fd55b86',
    messagingSenderId: '636456299763',
    projectId: 'u-learning-app-fcc05',
    authDomain: 'u-learning-app-fcc05.firebaseapp.com',
    storageBucket: 'u-learning-app-fcc05.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPhVhycPbw5dXdjYJUB7ToryUNmEQJ10I',
    appId: '1:636456299763:android:7d51aaccdaf707a4d55b86',
    messagingSenderId: '636456299763',
    projectId: 'u-learning-app-fcc05',
    storageBucket: 'u-learning-app-fcc05.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFyqynFT1F0h-6pRa2SNuqgmoMJlJCHiA',
    appId: '1:636456299763:ios:5b1a49819d58eb49d55b86',
    messagingSenderId: '636456299763',
    projectId: 'u-learning-app-fcc05',
    storageBucket: 'u-learning-app-fcc05.firebasestorage.app',
    iosBundleId: 'com.example.appBloc',
  );
}
