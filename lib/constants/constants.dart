

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../controller/auth_controller.dart';
import '../firebase_options.dart';

AuthController authController = AuthController.instance;
final Future<FirebaseApp> firebaseInitialization =
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
FirebaseAuth auth = FirebaseAuth.instance;
GoogleSignIn googleSign = GoogleSignIn(
  scopes: ['email'],
);
