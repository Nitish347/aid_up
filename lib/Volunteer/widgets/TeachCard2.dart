import 'package:aid_up/model/DonationNGO.dart';
import 'package:aid_up/model/TeachingModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants.dart';
// import '../Constants.dart';
import '../Screens/CampDetail.dart';
import '../Screens/TeachDetail.dart';
import 'IconWithText.dart';

Widget TeachCard2(
    double height, double width, TeachiingNgoModel model, String ngo, String address, String time) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.2,
      // width: width * 0.45,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.25), blurRadius: 8)],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: height,
              width: width * 0.3,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage("assets/images/children2.png"), fit: BoxFit.fill)
                  // image: DecorationImage(image: AssetImage(pic))
                  ),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  ngo,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.024),
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                IconWithText1(
                  height,
                  Icons.location_on_outlined,
                  address,
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                IconWithText1(height, Icons.calendar_month, "Every Sunday"),
                SizedBox(
                  height: height * 0.005,
                ),
                IconWithText1(height, Icons.watch_later_outlined, time),
                Expanded(
                  child: SizedBox(
                    height: height * 0.02,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.to(TeachCampDetailScreen(model: model)),
                      child: Container(
                        width: width * 0.25,
                        height: height * 0.035,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: blueColor, borderRadius: BorderRadius.circular(32)),
                        child: Text(
                          "Book",
                          style: GoogleFonts.dmSans(fontSize: height * 0.022, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: height * 0.015,
                          backgroundColor: orangeColor,
                          child: Center(
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: height * 0.02,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        CircleAvatar(
                          radius: height * 0.015,
                          backgroundColor: orangeColor,
                          child: Center(
                            child: Icon(
                              Icons.messenger,
                              color: Colors.white,
                              size: height * 0.02,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget TeachCard3(
    double height, double width, DonationNgoModel model, String ngo, String address, String time) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: height * 0.2,
      // width: width * 0.45,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.25), blurRadius: 8)],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: height,
              width: width * 0.3,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage("assets/images/children2.png"), fit: BoxFit.fill)
                  // image: DecorationImage(image: AssetImage(pic))
                  ),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  ngo,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.024),
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                IconWithText1(
                  height,
                  Icons.location_on_outlined,
                  address,
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                IconWithText1(height, Icons.calendar_month, "Every Sunday"),
                SizedBox(
                  height: height * 0.005,
                ),
                IconWithText1(height, Icons.watch_later_outlined, time),
                Expanded(
                  child: SizedBox(
                    height: height * 0.02,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.to(CampDetailScreen(model: model)),
                      child: Container(
                        width: width * 0.25,
                        height: height * 0.035,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: blueColor, borderRadius: BorderRadius.circular(32)),
                        child: Text(
                          "Book",
                          style: GoogleFonts.dmSans(fontSize: height * 0.022, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: height * 0.015,
                          backgroundColor: orangeColor,
                          child: Center(
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: height * 0.02,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        CircleAvatar(
                          radius: height * 0.015,
                          backgroundColor: orangeColor,
                          child: Center(
                            child: Icon(
                              Icons.messenger,
                              color: Colors.white,
                              size: height * 0.02,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget IconWithText1(double height, IconData icon, String text) {
  return Row(
    children: [
      Icon(
        icon,
        size: height * 0.02,
        color: Colors.black,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        text,
        style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.018),
      ),
    ],
  );
}
