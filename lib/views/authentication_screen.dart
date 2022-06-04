import 'package:flightfare/constants/constants.dart';
import 'package:flightfare/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../res/images/images.dart';
import 'auth/signin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF005de9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const DashboardScreen());
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Text("FlightFair",
                style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.0.w, right: 50.w),
              child: Text(
                "Sign in or sign up to unlock personalized deals and sync across all your devices",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 340.h,
            ),
            InkWell(
              onTap: () {
                authController.signInWithGoogle();
              },
              child: Card(
                color: Colors.white,
                child: SizedBox(
                  width: 240.w,
                  height: 44.h,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, left: 20.0, top: 8.0, right: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          google,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text("Sign in with Google",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF7b7b7b),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: SizedBox(
                width: 240.w,
                height: 44.h,
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, left: 20.0, top: 8.0, right: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        facebook,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text("Sign in with Facebook",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF7b7b7b),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const SignIn());
              },
              child: Card(
                color: Colors.white,
                child: SizedBox(
                  width: 240.w,
                  height: 44.h,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, left: 20.0, top: 8.0, right: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          email,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text("Sign in with Email",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF7b7b7b),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "By Continuing, you are indicating that you accept out Terms of services and Privacy policy",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
