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
    apiKey: 'AIzaSyAQfMQiHywNTnaZTGL0Y-8pjARrTCymAzw',
    appId: '1:486811440233:web:fb42e65df1aeefd9b4fef8',
    messagingSenderId: '486811440233',
    projectId: 'food-delivery-21b25',
    authDomain: 'food-delivery-21b25.firebaseapp.com',
    storageBucket: 'food-delivery-21b25.appspot.com',
    measurementId: 'G-JR8JCEJFE8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfWMXwSoES111YR8s3PFUq9CpLuYyz0qk',
    appId: '1:486811440233:android:67251686e68735bdb4fef8',
    messagingSenderId: '486811440233',
    projectId: 'food-delivery-21b25',
    storageBucket: 'food-delivery-21b25.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCw4jn2T3aX0p3PWpTmJZO7yK-dwh_X_7Y',
    appId: '1:486811440233:ios:cf55abee79df6579b4fef8',
    messagingSenderId: '486811440233',
    projectId: 'food-delivery-21b25',
    storageBucket: 'food-delivery-21b25.appspot.com',
    androidClientId: '486811440233-1mrl4p8b2phgi7n6eh5r146nctmtuaoq.apps.googleusercontent.com',
    iosClientId: '486811440233-ic42bagntf29rpba7i9m9shs0t2d1qtg.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodyapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCw4jn2T3aX0p3PWpTmJZO7yK-dwh_X_7Y',
    appId: '1:486811440233:ios:2340e6283cdcd932b4fef8',
    messagingSenderId: '486811440233',
    projectId: 'food-delivery-21b25',
    storageBucket: 'food-delivery-21b25.appspot.com',
    androidClientId: '486811440233-1mrl4p8b2phgi7n6eh5r146nctmtuaoq.apps.googleusercontent.com',
    iosClientId: '486811440233-svihbf1ppaedgoqg0ps4c7qk0ab52h3a.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodyapp.RunnerTests',
  );
}
