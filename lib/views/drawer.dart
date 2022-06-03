import 'package:flightfare/views/auth/signin.dart';
import 'package:flightfare/views/historyview.dart';
import 'package:flightfare/views/setting_screen.dart';
import 'package:flightfare/views/trackflightview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.flight,
            text: 'Flight Booking',
          ),
          _createDrawerItem(
            icon: Icons.hotel,
            text: 'Hotel Booking',
          ),
          _createDrawerItem(
            icon: Icons.shuffle_outlined,
            text: 'Nomad',
          ),
          _createDrawerItem(
              icon: Icons.av_timer,
              text: 'Track A Flight',
              onTap: () {
                Get.to(TrackFlight());
              }),
          _createDrawerItem(
              icon: Icons.history,
              text: 'History',
              onTap: () {
                Get.to(HistoryVew());
              }),
          const Divider(color: Colors.grey),
          _createDrawerItem(
            icon: Icons.settings,
            text: 'Setting',
            onTap: () {
              Get.to(() => (const SettingScreen()));
            },
          ),
          _createDrawerItem(icon: Icons.stars, text: 'Submit Feedback'),
          _createDrawerItem(icon: Icons.bug_report, text: 'About us'),
          ListTile(
            title: const Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          color: Color(0xFF0b30bc),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 16.0,
              left: 33.0,
              child: InkWell(
                onTap: () {
                  Get.to(SignIn());
                },
                child: Container(
                  width: 200.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(06)),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Center(
                    child: Text("LOGIN",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
              )),
        ]));
  }

  Widget _createDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Colors.grey, size: 30),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(text ?? "",
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey)),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
