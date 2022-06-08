import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flightfare/views/authentication_screen.dart';
import 'package:flightfare/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/AbstractClasses.dart';
import '../res/images/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin
    implements Presenter {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool? isAppOpenedForFirstTime;

  @override
  void initState() {
    // Animation controller for making fade transition of logo
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    moveNext();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void moveNext() async {
    Timer(const Duration(seconds: 3), () async {
      Get.to(() {
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          return const DashboardScreen();
        } else {
          return const LoginScreen();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      backgroundColor: const Color(0xFF005de9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _animation,
            child: Center(child: Image.asset(splashLogo, height: 220.h)),
          ),
          Text("flightFair",
              style: GoogleFonts.poppins(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: Colors.white)),
        ],
      ),
    );
  }

  @override
  void onClick(String action) {
    // ignore: todo
    // TODO: implement onClick
  }
}
