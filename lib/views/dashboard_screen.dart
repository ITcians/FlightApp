import 'dart:convert';

import 'package:flightfare/views/hotels_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:flightfare/constants/colors.dart';
import 'package:flightfare/constants/image.dart';
import 'package:flightfare/constants/textstyle.dart';
import 'package:flightfare/views/drawer.dart';
import 'package:flightfare/views/flight_select_screen.dart';
import 'package:flightfare/views/widgets/Calendar.dart';
import 'package:page_transition/page_transition.dart';

import 'city_select_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List categories = [
    "1 Adult",
    "2 Adult",
    "3 Adult",
  ];
  TextEditingController searchController = TextEditingController();
  final List _categories = ["Economy", "Premium Economy", "Business"];
  String? _categoryValue;
  String? categoryValue;
  bool isClickWay = true;
  bool isClickTrip = false;
  bool isClickMulti = false;
  bool isShuffle = false;
  String? toCity = "LPB";
  String? fromCity = "JFK";
  String? tcity = "LaPaz";
  String? fcity = "New Ny";
  int quantity = 0;
  bool isvisible = true;
  DateTime currentDate = DateTime.now();
  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: primaryColor,
        drawer: const AppDrawer(),
        body: SafeArea(
          child: SizedBox(
            width: deviceWidth,
            height: deviceHeight,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'FlightFair',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(
                              child: Text('FLIGHTS',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                            Tab(
                              child: Text('HOTELS',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                            Tab(
                              child: Text('NOMAD',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: deviceWidth,
                    height: deviceHeight,
                    child: TabBarView(
                      children: [
                        _flighttab(),
                        _hoteltab(),
                        _nomad(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nomad() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text('START TRIP', style: white16MediumTextStyle),
            ],
          ),
        ),
        Container(
          height: 80,
          width: 320,
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('From', style: TextStyle(color: greyColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('La paz', style: TextStyle()),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text('Start Date', style: TextStyle(color: greyColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('12-june 18-june', style: TextStyle()),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 50.h),
        Column(
          children: [
            Container(
              width: Get.width,
              height: 620.h,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('DESTINATION TO VISTS',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(width: 25),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('CLEAR ALL',
                            style: TextStyle(color: greenColor)),
                      ),
                    ],
                  ),
                  Destinationswidgets(
                    img: 'assets/images/nature1.jpg',
                    name: 'Rio de Janeiro',
                    date: '12 june to 16 june',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Destinationswidgets(
                    img: 'assets/images/nature3.jpg',
                    name: 'Rio de Janeiro',
                    date: '12 june to 16 june',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Destinationswidgets(
                    img: 'assets/images/nature4.jpg',
                    name: 'Rio de Janeiro',
                    date: '12 june to 16 june',
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.blueAccent,
                      )),
                      child: Text('ADD DESTINATION',
                          style: TextStyle(color: greenColor)),
                    ),
                  ),
                  // Container(
                  //   height: 100,
                  //   color: greyColor,
                  //   child: Row(
                  //     children: [
                  //       Column(
                  //         children: [
                  //           Text('END TRIP'),
                  //           Checkbox(
                  //             checkColor: Colors.greenAccent,
                  //             activeColor: Colors.red,
                  //             value: this.valuefirst,
                  //             onChanged: (bool? value) {
                  //               setState(() {
                  //                 this.valuefirst = value!;
                  //               });
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      width: 340.w,
      height: 50.h,
      // margin: EdgeInsets.only(top: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TextField(
              onTap: () {
                Get.to(const HotelsSearchScreen());
              },
              readOnly: true,
              controller: searchController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  hintText: "Where?",
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                  border: InputBorder.none),
            ),
            const Icon(
              Icons.search,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Widget _hoteltab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(Images.building, color: Color.fromARGB(255, 23, 92, 148)),
        _searchBar(),
        SizedBox(height: 100.h),
        Container(
          width: Get.width,
          height: 480.h,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 120.h,
                    width: 185.w,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(width: 1.0, color: Colors.grey),
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CHECK-IN",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("23",
                                    style: GoogleFonts.poppins(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 20, 126, 212))),
                                SizedBox(
                                  width: 8.h,
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Apr",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                      Text("Saturday",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                  Container(
                    height: 120.h,
                    width: 185.w,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CHECK-OUT",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("23",
                                    style: GoogleFonts.poppins(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 18, 119, 201))),
                                SizedBox(
                                  width: 8.h,
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Apr",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                      Text("Saturday",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 120.h,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 12.0, top: 12, right: 50),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ROOMS",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                focusColor: Colors.transparent,
                                value: categoryValue,
                                style: const TextStyle(color: Colors.white),
                                iconEnabledColor: const Color(0xffCFD2D8),
                                isExpanded: true,
                                icon: const Icon(
                                    // Add this
                                    Icons.arrow_drop_down, // Add this
                                    color: Color(0xff0D1F3C) // Add this
                                    ),
                                items: categories
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.titilliumWeb(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ))
                                    .toList(),
                                hint: Text(
                                  "1 Adult",
                                  style: GoogleFonts.titilliumWeb(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    categoryValue = value;
                                  });
                                },
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: 350.w,
                height: 50.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(06)),
                  color: Color(0xFF0b30bc),
                ),
                child: Center(
                  child: Text("SEARCH HOTELS",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _flighttab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: 330.w,
              height: 55.h,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(36)),
                  border: Border.all(width: 0, color: Colors.white),
                  color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isClickWay = true;
                        isClickTrip = false;
                        isClickMulti = false;
                        isvisible = true;
                      });
                    },
                    child: Container(
                      width: 93.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: isClickWay == true
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text("One way",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isClickWay == true
                                  ? Colors.black
                                  : Colors.white,
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isClickWay = false;
                        isClickTrip = true;
                        isClickMulti = false;
                        isvisible = true;
                      });
                    },
                    child: Container(
                      width: 93.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          color: isClickTrip == true
                              ? Colors.white
                              : Colors.transparent),
                      child: Center(
                        child: Text("Round trip",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isClickTrip == true
                                    ? Colors.black
                                    : Colors.white)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isClickWay = false;
                        isClickTrip = false;
                        isClickMulti = true;
                        isvisible = false;
                      });
                    },
                    child: Container(
                      width: 93.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          color: isClickMulti == true
                              ? Colors.white
                              : Colors.transparent),
                      child: Center(
                        child: Text("Multi-city",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isClickMulti == true
                                    ? Colors.black
                                    : Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 50.h),
        Visibility(
          visible: isvisible,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => (CitySelectScreen(
                        title: 'Select City',
                      )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("FROM",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    isShuffle == false
                        ? Text(toCity.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))
                        : Text(fromCity.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                    isShuffle == false
                        ? Text(tcity.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))
                        : Text(fcity.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isShuffle = !isShuffle;
                  });
                },
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.green),
                  ),
                  child: const Center(
                      child: Icon(
                    Icons.sync_alt,
                    color: Colors.white,
                    size: 27,
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => (CitySelectScreen(
                        title: 'Select City',
                      )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("TO",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                    isShuffle == true
                        ? Text(toCity.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))
                        : Text(fromCity.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 50,
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                    isShuffle == true
                        ? Text(tcity.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))
                        : Text(fcity.toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50.h),
        Container(
          width: Get.width,
          height: 480.h,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Calendar());
                    },
                    child: Container(
                      height: 130.h,
                      width: 187.w,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 1.0, color: Colors.grey),
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("DEPARTURE",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("23",
                                      style: GoogleFonts.poppins(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue)),
                                  SizedBox(
                                    width: 8.h,
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Apr",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black)),
                                        Text("Saturday",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Calendar());
                    },
                    child: Container(
                      height: 130.h,
                      width: 187.w,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Return",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("23",
                                      style: GoogleFonts.poppins(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue)),
                                  SizedBox(
                                    width: 8.h,
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Apr",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black)),
                                        Text("Saturday",
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (quantity > 0) {
                                            quantity--;
                                          }
                                        });
                                      },
                                      child: const Icon(
                                        Icons.remove_circle_outline_sharp,
                                        color: Colors.grey,
                                        size: 40,
                                      ),
                                    ),
                                    Column(children: [
                                      Text(quantity.toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      Text("Above 12 years",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ]),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      child: const Icon(
                                        Icons.add_circle_outline_sharp,
                                        color: Colors.grey,
                                        size: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                    Column(children: [
                                      Text("2",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      Text("Above 12 years",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ]),
                                    const Icon(
                                      Icons.add_circle_outline_sharp,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                    Column(children: [
                                      Text("2",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      Text("Above 12 years",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ]),
                                    const Icon(
                                      Icons.add_circle_outline_sharp,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 120.h,
                      width: 187.w,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 1.0, color: Colors.grey),
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, top: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("TRAVELER",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    '1 adult',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Icon(Icons.arrow_drop_down,
                                      size: 25, color: Colors.black)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 120.h,
                    width: 187.w,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 12),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CLASS",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                focusColor: Colors.transparent,
                                value: _categoryValue,
                                style: const TextStyle(color: Colors.white),
                                iconEnabledColor: const Color(0xffCFD2D8),
                                isExpanded: true,
                                icon: const Icon(
                                    // Add this
                                    Icons.arrow_drop_down, // Add this
                                    color: Color(0xff0D1F3C) // Add this
                                    ),
                                items: _categories
                                    .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: GoogleFonts.titilliumWeb(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ))
                                    .toList(),
                                hint: Text(
                                  "First Class",
                                  style: GoogleFonts.titilliumWeb(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _categoryValue = value;
                                  });
                                },
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(
                  //   () => const FlightSelectScreen());
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: const FlightSelectScreen(),
                      ));
                },
                child: Container(
                  width: 330.w,
                  height: 45.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(06)),
                    color: Color(0xFF0b30bc),
                  ),
                  child: Center(
                    child: Text("SEARCH FLIGHT",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, String helpText) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      helpText: helpText,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
                primary: Color.fromARGB(255, 34, 69, 86),
                onPrimary: Colors.white,
                surface: Colors.orange,
                onSurface: Colors.white),
            dialogBackgroundColor: Colors.black,
          ),
          child: child ?? Container(),
        );
      },
    );
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }
}

class Destinationswidgets extends StatelessWidget {
  String name;
  String date;
  String img;
  Destinationswidgets({
    Key? key,
    required this.name,
    required this.date,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(children: [
                Icon(Icons.pin_drop, color: whiteColor),
                SizedBox(
                  width: 10,
                ),
                Text(name, style: white16SemiBoldTextStyle),
              ]),
              SizedBox(
                width: 40,
              ),
              Icon(Icons.delete, color: whiteColor),
            ],
          ),
          Text(date, style: white16SemiBoldTextStyle),
          SizedBox(
            width: 30,
          ),
          Container(
            height: 35,
            color: Colors.black.withOpacity(0.4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Customize', style: white12SemiBoldTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class JsonDecodeException implements Exception {}

class HttpException implements Exception {}

/// This is a implementation of the Country State City Picker.
