import 'dart:math';

import 'package:aid_up/Constants.dart';
import 'package:aid_up/Volunteer/Screens/TeachDetail.dart';
import 'package:aid_up/model/DonationNGO.dart';
import 'package:aid_up/model/TeachingModel.dart';
// import 'package:aid_up/Screens/CampDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/CampDetail.dart';

Widget DonationCard(double height, double width, DonationNgoModel model, String pic) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.3,
      width: width * 0.45,
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
              width: width * 0.45,
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: AssetImage(pic), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              model.name!,
              maxLines: 1,
              overflow:TextOverflow.ellipsis,
              style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.022,),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  size: height * 0.028,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  width: width*0.3,
                  child: Text(
                    model.address!,
                    style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.02),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Row(
              children: [
                Icon(Icons.watch_later_outlined, color: orangeColor, size: height * 0.022),
                SizedBox(
                  width: 2,
                ),
                Text(
                  model.time!,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.02),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Row(
              children: [
                Icon(CupertinoIcons.book, size: height * 0.024),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "subject",
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.02),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Center(
              child: InkWell(
                onTap: () => Get.to(CampDetailScreen(
                  model: model,
                )),
                child: Container(
                  width: width * 0.45,
                  height: height * 0.04,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(32)),
                  child: Text(
                    "Book",
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

Widget TeachingCard(double height, double width, TeachiingNgoModel model, String pic) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.3,
      width: width * 0.45,
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
              width: width * 0.45,
              decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(image: AssetImage(pic), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              model.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.022),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  size: height * 0.028,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  width: width*0.3,
                  child: Text(
                    model.address!  ,

                    style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.02),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Row(
              children: [
                Icon(Icons.watch_later_outlined, color: orangeColor, size: height * 0.022),
                SizedBox(
                  width: 2,
                ),
                Text(
                  model.time!,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.02),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Row(
              children: [
                Icon(CupertinoIcons.book, size: height * 0.024),
                SizedBox(
                  width: 2,
                ),
                Text(
                  model.subject!,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.02),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Center(
              child: InkWell(
                onTap: () => Get.to(TeachCampDetailScreen(model: model)),
                child: Container(
                  width: width * 0.45,
                  height: height * 0.04,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(32)),
                  child: Text(
                    "Book",
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
