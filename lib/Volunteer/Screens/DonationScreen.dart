// import 'package:aid_up/widgets/DonateScreenCard.dart';
// import 'package:aid_up/widgets/TeachCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../widgets/DonateScreenCard.dart';
import '../widgets/TeachCard.dart';
import 'DonateMoneyScreen.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

int ind = 0;

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.03, left: width * 0.045, right: width * 0.045),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_rounded,
                size: height * 0.04,
              ),
            ),
            Text(
              "Donation",
              style: GoogleFonts.dmSans(
                  fontSize: height * 0.035, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  hintText: 'Search by NGO, subject, area and more',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(color: Colors.white)),
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(color: Colors.white)),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: Container(
                  child: ListView(children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: height * 0.25,
                      enableInfiniteScroll: true,
                      onScrolled: (index) {
                        setState(() {
                          // print(index);
                        });
                      },
                      onPageChanged: (index, reason) {
                        print(index);
                        print(reason);
                        setState(() {
                          ind = index;
                        });
                      }),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return TeachCard(height * 0.8, width * 0.7);
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Container(
                      width: width * 0.2,
                      child: PageViewDotIndicator(
                        currentItem: ind,
                        count: 5,
                        unselectedColor: Colors.black26,
                        selectedColor: Colors.black,
                        size: Size(width * 0.015, width * 0.015),
                        unselectedSize: Size(width * 0.01, width * 0.01),
                        duration: const Duration(milliseconds: 200),
                      ),
                    ),
                    Text(
                      "View All",
                      style: GoogleFonts.dmSans(decoration: TextDecoration.underline),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "Donation camps near you",
                  style: GoogleFonts.dmSans(fontSize: height * 0.024, fontWeight: FontWeight.w500),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: height * 0.38,
                      enableInfiniteScroll: true,
                      onScrolled: (index) {
                        setState(() {
                          // print(index);
                        });
                      },
                      onPageChanged: (index, reason) {
                        print(index);
                        print(reason);
                        setState(() {
                          ind = index;
                        });
                      }),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return DonateScreenCard(height, width, "text", "title", "pic");
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Container(
                      width: width * 0.2,
                      child: PageViewDotIndicator(
                        currentItem: ind,
                        count: 5,
                        unselectedColor: Colors.black26,
                        selectedColor: Colors.black,
                        size: Size(width * 0.015, width * 0.015),
                        unselectedSize: Size(width * 0.01, width * 0.01),
                        duration: const Duration(milliseconds: 200),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(DonateMoneyScreen()),
                      child: Text(
                        "View All",
                        style: GoogleFonts.dmSans(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ])),
            ),
            SizedBox(
              height: height * 0.02,
            )
          ],
        ),
      ),
    ));
  }
}
