import 'package:flightfare/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FlightSelectScreen extends StatefulWidget {
  const FlightSelectScreen({Key? key}) : super(key: key);

  @override
  State<FlightSelectScreen> createState() => _FlightSelectScreenState();
}

class _FlightSelectScreenState extends State<FlightSelectScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  bool isVisible = false;
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xFF0b30bc),
                  width: Get.width,
                  height: 60.h,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Text("ISB - JFK",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            InkWell(
                              onTap: () =>
                                  setState(() => isVisible = !isVisible),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Container(
                    color: const Color(0xFF0b30bc),
                    width: Get.width,
                    // height: 60.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            // height: 50,
                            width: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              border: Border.all(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: TabBar(
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicatorColor: primaryColor,
                                    controller: tabController,
                                    isScrollable: true,
                                    tabs: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Tab(
                                          // text: 'tab1',
                                          child: Text(
                                            'tab1',
                                            style: TextStyle(color: blackColor),
                                          ),
                                        ),
                                      ),
                                      Tab(
                                        text: 'tab 2',
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  height: 60.h,
                  child: Row(
                    children: [
                      Container(
                        width: 160.w,
                        height: 60.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(width: 1.0, color: Colors.grey),
                            bottom: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: Colors.grey,
                              size: 15,
                            ),
                            SizedBox(width: 10.w),
                            Text("12 Apr - 20 Apr",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                      Container(
                        width: 80.w,
                        height: 60.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(width: 1.0, color: Colors.grey),
                            bottom: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: Colors.grey,
                              size: 15,
                            ),
                            SizedBox(width: 10.w),
                            Text("2",
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                      Container(
                        width: 135.w,
                        height: 60.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(width: 1.0, color: Colors.grey),
                            bottom: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: Colors.grey,
                              size: 15,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Economy",
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height,
                  width: Get.width,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 360.w,
                          height: 350.h,
                          child: Card(
                              child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("PKR356,656",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                  Text("via Travelgenio",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey)),
                                ],
                              )
                            ],
                          )),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
