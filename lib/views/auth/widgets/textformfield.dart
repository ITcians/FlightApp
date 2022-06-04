import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    @required this.lable,
    @required this.controller,
    @required this.leadingIcon,
    @required this.obsecure,
    this.trailing,
  }) : super(key: key);

  final TextEditingController? controller;
  final IconData? leadingIcon;
  final Widget? trailing;
  final String? lable;
  final bool? obsecure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        obscureText: obsecure!,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            fillColor: Colors.black,
            border: InputBorder.none,
            icon: Icon(
              leadingIcon,
              color: Colors.grey,
            ),
            hintText: lable,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: trailing),
      ),
    );
  }
}