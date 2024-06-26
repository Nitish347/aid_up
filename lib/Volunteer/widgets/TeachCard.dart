import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../Constants.dart';
import '../../Constants.dart';
import 'IconWithText.dart';

Widget TeachCard(double height, double width, String NGO) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: width,
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
              width: width * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  NGO,
                  style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.025),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                IconWithText(height, Icons.location_on_outlined, "Mahagun Puram",width),
                SizedBox(
                  height: height * 0.01,
                ),
                IconWithText(height, Icons.calendar_month, "Every Sunday",width),
                SizedBox(
                  height: height * 0.01,
                ),
                IconWithText(height, Icons.watch_later_outlined, "9 am",width),
                Expanded(
                  child: SizedBox(
                    height: height * 0.02,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.35,
                      height: height * 0.04,
                      alignment: Alignment.center,
                      decoration:
                          BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(32)),
                      child: Text(
                        "Book",
                        style: GoogleFonts.dmSans(fontSize: height * 0.022, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: height * 0.018,
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
                          radius: height * 0.018,
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
