import 'dart:developer';

import 'package:flightfare/views/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/textstyle.dart';

class Register extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  final isObsecure = true.obs;
  final isLoading = false.obs;
  // final authController = Get.find<AuthController>();
  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage("assets/vectors.png"),
              //   fit: BoxFit.fitWidth,
              //   alignment: Alignment(1, 0.85),
              // ),
              ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8), // Border radius
                      child: ClipOval(
                          child: Image.asset('assets/images/splashLogo.png')),
                    ),
                  ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(25.0),
                  //   child: Image.asset(
                  //     'assets/user/user_14.jpg',
                  //     height: 150.0,
                  //     width: 100.0,
                  //   ),
                  // ),
                  // Image.asset(
                  //   'assets/main_log.png',
                  //   width: 140.0,
                  //   height: 110.0,
                  //   fit: BoxFit.cover,
                  // ),
                  SizedBox(height: 30.0),
                  Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  height20Space,
                  Padding(
                    padding: EdgeInsets.only(right: 35.0, left: 35.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            color: blackColor.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: name,
                        style: black14MediumTextStyle,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Username'.toUpperCase(),
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  height20Space,
                  Padding(
                    padding: EdgeInsets.only(right: 35.0, left: 35.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            color: blackColor.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: email,
                        style: black14MediumTextStyle,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Email'.toUpperCase(),
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  height20Space,
                  Padding(
                    padding: EdgeInsets.only(right: 35.0, left: 35.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            color: blackColor.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: phone,
                        style: black14MediumTextStyle,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Phone'.toUpperCase(),
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  height20Space,
                  Padding(
                    padding: EdgeInsets.only(right: 35.0, left: 35.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            color: blackColor.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: password,
                        style: black14MediumTextStyle,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Password'.toUpperCase(),
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  height20Space,
                  Padding(
                    padding: EdgeInsets.only(right: 35.0, left: 35.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            color: blackColor.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child: TextField(
                        style: black14MediumTextStyle,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20.0),
                          hintText: 'Confirm Password'.toUpperCase(),
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  height20Space,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 3.5),
                    child: Obx(() => InkWell(
                          onTap: () {
                            log("start");
                            authController.register(
                                email.text.trim(), password.text.trim());
                            // Navigator.push(
                            //   context,
                            //   PageTransition(
                            //     type: PageTransitionType.rightToLeft,
                            //     child: BottomBar(),
                            //   ),
                            // );

                            // isLoading.value = true;
                            // if (GetUtils.isEmail(email.text) &&
                            //     name.text != '' &&
                            //     password.text != '') {
                            //   await authController.createUser(name.text,
                            //       email.text, password.text, phone.text);
                            //   name.clear();
                            //   email.clear();
                            //   password.clear();
                            // } else {
                            //   Get.snackbar(
                            //       "Input Error", 'Enter Valid Information',
                            //       backgroundColor: Colors.white60);
                            // }
                            // isLoading.value = false;
                          },
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: primaryColor,
                            ),
                            child: isLoading.value
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'SIGN UP',
                                    style: white14BoldTextStyle,
                                  ),
                          ),
                        )),
                  ),
                  height20Space,
                  height20Space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have An Account?',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
