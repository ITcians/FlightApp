import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flightfare/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInWithMailScreen extends StatefulWidget {
  const SignInWithMailScreen({Key? key}) : super(key: key);

  @override
  State<SignInWithMailScreen> createState() => _SignInWithMailScreenState();
}

class _SignInWithMailScreenState extends State<SignInWithMailScreen> {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Sign in"),
          backgroundColor: const Color(0xFF0b30bc),
          leading: (const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: 'email',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              obscureText: true,
              controller: _password,
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(350.w, 50.h),
                  primary: const Color(0xFF0b30bc),
                  textStyle: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
              onPressed: () async {
                isLoading.value = true;
                final user = await logIn(_email.text, _password.text);
                isLoading.value = false;

                if (user != null) {
                  Get.to(() => const SplashScreen());
                }
              },
              child: ValueListenableBuilder<bool>(
                valueListenable: isLoading,
                builder: (_, state, widget) {
                  if (state) {
                    return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2),
                    );
                  } else {
                    return const Text("login");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<User?> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }

    return FirebaseAuth.instance.currentUser;
  }
}
