import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAiUphifWZQ54ITDrm3CDEeIaT2dGFGRLE",
            authDomain: "design-live-5bwpey.firebaseapp.com",
            projectId: "design-live-5bwpey",
            storageBucket: "design-live-5bwpey.appspot.com",
            messagingSenderId: "729693964384",
            appId: "1:729693964384:web:c8918fe2aa401459639b05"));
  } else {
    await Firebase.initializeApp();
  }
}
