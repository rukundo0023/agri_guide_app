import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCNGXnWPPuAFFZu0TfSXoMpu928olFBnY',
    appId: '1:161171749060:android:b11a59eaeaa3b660e5b191',
    messagingSenderId: '161171749060',
    projectId: 'agriguide-4e8fe',
    storageBucket: 'agriguide-4e8fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCNGXnWPPuAFFZu0TfSXoMpu928olFBnY',
    appId: '1:161171749060:ios:b11a59eaeaa3b660e5b191',
    messagingSenderId: '161171749060',
    projectId: 'agriguide-4e8fe',
    storageBucket: 'agriguide-4e8fe.appspot.com',
    iosBundleId: 'com.example.agriGuideApp',
  );
}
