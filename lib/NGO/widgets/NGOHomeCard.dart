import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants.dart';
import '../../Volunteer/widgets/IconWithText.dart';
// import '../Constants.dart';
// import 'IconWithText.dart';

Widget NGOHomeCard(double height, double width, String pic) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      // height: height * 0.25,
      // width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.25), blurRadius: 8)],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Donation Camp",
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.024),
                ),
                Container(
                  width: width * 0.5,
                  child: Expanded(
                    child: Text(
                      "Organize donation camp for Books, clothes and money",
                      style:
                          GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.02),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
            Image(image: AssetImage(pic))
          ],
        ),
      ),
    ),
  );
}
