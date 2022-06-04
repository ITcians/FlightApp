import 'package:flightfare/constants/colors.dart';
import 'package:flightfare/constants/image.dart';
import 'package:flightfare/constants/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackFlight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          'Track a Flight',
          style: white18SemiBoldTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              Images.arrowplane,
              color: secondryColor,
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 400,
              color: whiteColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Airline',
                          style: grey16MediumTextStyle,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: greyColor,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Flight Number",
                          hintStyle: TextStyle(color: greyColor)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Depart",
                          hintStyle: TextStyle(color: greyColor)),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 330,
                      height: 45,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(06)),
                        color: Color(0xFF0b30bc),
                      ),
                      child: Center(
                        child: Text("FIND FLIGHT",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
