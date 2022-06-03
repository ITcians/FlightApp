import 'package:flightfare/constants/colors.dart';
import 'package:flightfare/views/auth/register.dart';
import 'package:flightfare/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/textstyle.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  // final authController = Get.find<AuthController>();

  // final rembermeController = Get.find<RembermeController>();
  final isObsecure = false.obs;

  final isLoading = false.obs;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/vectors.png"),
          //     fit: BoxFit.fitWidth,
          //     alignment: Alignment(1, 0.85),
          //   ),
          // ),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Image.asset(
                            'assets/images/splashLogo.png',
                            height: 110,
                            width: 110,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'farefirst',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                        ],
                      ),
                    )),

                    SizedBox(height: 30.0),
                    Text(
                      'Sign in'.toUpperCase(),
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                    height20Space,
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: TextField(
                            controller: email,
                            style: black14MediumTextStyle,
                            keyboardType: TextInputType.emailAddress,
                            // obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.email,
                                  color: greyColor.withOpacity(0.4)),
                              contentPadding: EdgeInsets.only(left: 10.0),
                              hintText: 'Email '.toUpperCase(),
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
                    ),
                    height20Space,
                    Obx(() => Padding(
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
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: TextField(
                                controller: password,
                                style: black14MediumTextStyle,
                                keyboardType: TextInputType.text,
                                obscureText: isObsecure.value,
                                decoration: InputDecoration(
                                  suffixIcon: isObsecure.value
                                      ? IconButton(
                                          onPressed: () {
                                            print('pressednon');
                                            isObsecure.value = false;
                                          },
                                          icon: Icon(
                                            Icons.visibility_off,
                                            color: greyColor.withOpacity(0.4),
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            print('pressed');
                                            isObsecure.value = true;
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: greyColor.withOpacity(0.4),
                                          ),
                                        ),
                                  icon: Icon(Icons.lock,
                                      color: greyColor.withOpacity(0.4)),
                                  contentPadding: EdgeInsets.only(left: 10.0),
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
                        )),

                    height5Space,
                    heightSpace,

                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 3.5),
                        child: Obx(() => InkWell(
                            onTap: () async {
                              Get.to(DashboardScreen());
                              // // await authController.login(
                              // //     email.text, password.text);

                              // isLoading.value = true;
                              // if (GetUtils.isEmail(email.text)) {
                              //   authController.login(email.text, password.text);
                              // } else {
                              //   Get.snackbar("Input Error", 'Enter Valid Data',
                              //       snackPosition: SnackPosition.BOTTOM,
                              //       backgroundColor: Colors.red);
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
                                    : Text('LOG IN',
                                        style: white14BoldTextStyle))))),
                    height5Space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              // Container(
                              //   child: Transform.scale(
                              //     scale: 0.8,
                              //     child: Checkbox(
                              //       splashRadius: 20,
                              //       checkColor: Colors.white,
                              //       fillColor:
                              //           MaterialStateProperty.resolveWith(
                              //               getColor),
                              //       value: isChecked,
                              //       onChanged: (bool value) {
                              //         // setState(() {
                              //         //   isChecked = value;
                              //         // });
                              //       },
                              //     ),
                              //   ),
                              // ),
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              Text(
                                'Remember Me',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ForwardPassword()),
                          //   );
                          // },
                          child: Text(
                            'Forgat Password?',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => BottomBar()),
                    //     );
                    //   },
                    //   child: Container(
                    //     child: Text(
                    //       'skip for now',
                    //       style: TextStyle(color: Colors.black),
                    //     ),
                    //   ),
                    // ),

                    height20Space,
                    height20Space,
                    height20Space,
                    height20Space,
                    height20Space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t Have An Account?',
                          style: TextStyle(fontSize: 11),
                        ),
                        width5Space,
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 11, color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'Already Have An Account?',
                    //       style: TextStyle(
                    //         fontSize: 12.0,
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 5,
                    //     ),
                    //     Text(
                    //       'Sign In',
                    //       style: TextStyle(
                    //         fontSize: 12.0,
                    //         color: kredcolor,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
