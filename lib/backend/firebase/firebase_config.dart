import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBuGPqKCCX7r9i7EHxKUMaKA38KFHxhTkE",
            authDomain: "cofounder-40112.firebaseapp.com",
            projectId: "cofounder-40112",
            storageBucket: "cofounder-40112.appspot.com",
            messagingSenderId: "1069430708836",
            appId: "1:1069430708836:web:1bb2894529df2ee24ddd71",
            measurementId: "G-9TC84YRM04"));
  } else {
    await Firebase.initializeApp();
  }
}
