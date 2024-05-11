import 'dart:math';

import 'package:aid_up/Constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/DonateDetail.dart';

Widget DonateScreenCard(double height, double width, String cause, String receiver, String target,
    String collected, String deadline) {
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
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: AssetImage("assets/images/images.jpg"))
                  ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset("assets/images/images.jpg",fit: BoxFit.cover,)),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Text(
                  cause,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: width * 0.04),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Text(
                  "by ${receiver}",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w300, fontSize: width * 0.025, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Text(
                  "Rs $collected",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w600, fontSize: height * 0.018, color: orangeColor),
                ),
                SizedBox(
                  width: width * 0.005,
                ),
                Text(
                  "raised from Rs.$target",
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
                  child: LinearProgressIndicator(
                    minHeight: height * 0.004,
                    value: (int.parse(collected) / (int.parse(target) / 100)) / 100,
                    // value: 0.5,
                    // valueColor: Colors.green,
                    backgroundColor: Colors.grey,
                    color: orangeColor,
                  ),
                ),
                // Container(
                //   height: height * 0.002,
                //   width: width * 0.1 -
                //       width * ((int.parse(target) / int.parse(collected))) / 100, // max value 0.655
                //   color: Colors.grey,
                // ),
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
