import 'dart:math';

import 'package:aid_up/Constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/DonateDetail.dart';

Widget DonateScreenCard(double height, double width, String text, String title, String pic) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      // height: height * 0.3,
      // width: width * 0.45,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.25), blurRadius: 8)],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.14,
              width: width,
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)
                  // image: DecorationImage(image: AssetImage(pic))
                  ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Text(
                  "Help a child get surgery",
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.02),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Text(
                  "by Awaaz NGO",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w300, fontSize: height * 0.018, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Text(
                  "Rs 28000",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w600, fontSize: height * 0.018, color: orangeColor),
                ),
                SizedBox(
                  width: width * 0.005,
                ),
                Text(
                  "raised from Rs.40,000",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w300, fontSize: height * 0.017, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: height * 0.004,
                    // width: width * 0.6,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  height: height * 0.002,
                  width: width * 0.2, // max value 0.655
                  color: Colors.grey,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.groups_outlined,
                      color: orangeColor,
                      size: height * 0.025,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      "300 Donars",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w300,
                          fontSize: height * 0.014,
                          color: orangeColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: Colors.grey,
                      size: height * 0.02,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
                      "8 days left!",
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w300,
                          fontSize: height * 0.014,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Center(
              child: InkWell(
                onTap: () => Get.to(DonateDetailScreen()),
                child: Container(
                  width: width * 0.4,
                  height: height * 0.04,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(32)),
                  child: Text(
                    "Donate",
                    style: GoogleFonts.dmSans(fontSize: height * 0.022, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
