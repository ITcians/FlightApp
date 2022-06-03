import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_list_pick/country_selection_theme.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flightfare/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: (const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        )),
        titleSpacing: 1,
        title: Text("Settings",
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Region / Currencies",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600)),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: Get.width,
              height: 170.h,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 35.w,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  color: Color(0xFF0b30bc),
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.flag,
                                  color: Colors.white,
                                  size: 30,
                                ))),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text("Country",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        CountryListPick(

                            // if you need custome picker use this
                            // pickerBuilder: (context, CountryCode countryCode){
                            //   return Row(
                            //     children: [
                            //       Image.asset(
                            //         countryCode.flagUri,
                            //         package: 'country_list_pick',
                            //       ),
                            //       Text(countryCode.code),
                            //       Text(countryCode.dialCode),
                            //     ],
                            //   );
                            // },

                            // To disable option set to false
                            theme: CountryTheme(
                              isShowFlag: true,
                              isShowTitle: false,
                              isShowCode: true,
                              isDownIcon: true,
                              showEnglishName: true,
                            ),
                            // Set default value
                            initialSelection: '+92',
                            // or
                            // initialSelection: 'US'
                            onChanged: (CountryCode? code) {
                              debugPrint(code!.name);
                              debugPrint(code.code);
                              debugPrint(code.dialCode);
                              debugPrint(code.flagUri);
                            },
                            // Whether to allow the widget to set a custom UI overlay
                            useUiOverlay: true,
                            // Whether the country list should be wrapped in a SafeArea
                            useSafeArea: false),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 30.w,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6)),
                                  color: Colors.red.shade400,
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                  size: 30,
                                ))),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text("Currency",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showCurrencyPicker(
                              context: context,
                              showFlag: true,
                              showCurrencyName: true,
                              showCurrencyCode: true,
                              onSelect: (Currency currency) {
                                debugPrint('Select currency: ${currency.name}');
                              },
                              favorite: ['SEK'],
                            );
                          },
                          child: Text('KIndly PIck Currency',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0b30bc),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("General",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600)),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: Get.width,
              height: 450.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 35.w,
                            height: 35.w,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              color: lightgreenColor,
                            ),
                            child: Center(
                                child: Image.asset(
                              'assets/images/notification.png',
                              color: whiteColor,
                              width: 25,
                              height: 25,
                            ))),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text("Notifications",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
