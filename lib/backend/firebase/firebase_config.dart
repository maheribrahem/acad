import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCV_CpMeezth2YDD5a1gjTMAJ2jNWzGZmw",
            authDomain: "islamicacad-114.firebaseapp.com",
            projectId: "islamicacad-114",
            storageBucket: "islamicacad-114.appspot.com",
            messagingSenderId: "744569389483",
            appId: "1:744569389483:web:907e47f7e6ad12aaddd2ee",
            measurementId: "G-E5DTSLJZ97"));
  } else {
    await Firebase.initializeApp();
  }
}
