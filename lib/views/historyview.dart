import 'package:flightfare/constants/colors.dart';
import 'package:flightfare/constants/image.dart';
import 'package:flightfare/constants/textstyle.dart';
import 'package:flutter/material.dart';

class HistoryVew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'History',
          style: white16MediumTextStyle,
        ),
      ),
      body: Center(
        child: Image.asset(Images.search),
      ),
    );
  }
}
