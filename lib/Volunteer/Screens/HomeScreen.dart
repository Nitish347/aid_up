import 'package:aid_up/Constants.dart';
// import 'package:aid_up/Screens/DonationScreen.dart';
// import 'package:aid_up/Screens/TeachScreen.dart';
// import 'package:aid_up/widgets/HomeSquareCard.dart';
// import 'package:aid_up/widgets/TeachingCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/HomeSquareCard.dart';
import '../widgets/TeachingCard.dart';
import 'DonationScreen.dart';
import 'TeachScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: height * 0.03, left: width * 0.045, right: width * 0.045),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.paperplane_fill),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              "Address",
                              style: GoogleFonts.dmSans(
                                  fontSize: height * 0.025, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Text(
                          "Sarjapur Marathahalli road, kaikondrahalli,…",
                          style: GoogleFonts.dmSans(
                              fontSize: height * 0.02, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: blueColor,
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Hello Nitish Chaurasiya,",
                  style: GoogleFonts.dmSans(
                      color: orangeColor, fontSize: height * 0.03, fontWeight: FontWeight.w500),
                ),
                Text(
                  "What do you want to do today?",
                  style: GoogleFonts.dmSans(fontSize: height * 0.02, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.to(DonationScreen()),
                        child: HomeCard(height, width, "Donate Books, clothes and money", "Donate",
                            "assets/images/FoodDOnation.png"),
                      ),
                      InkWell(
                        onTap: () => Get.to(TeachScreen()),
                        child: HomeCard(height, width, "Donate Books, clothes and money", "Teach",
                            "assets/images/Teach.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "Teaching camps near you",
                  style: GoogleFonts.dmSans(fontSize: height * 0.024, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.42,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(10, (index) {
                      return TeachingCard(
                          height, width, "text", "title", "assets/images/Teach.png");
                    }),
                  ),
                ),
                Text(
                  "Donation camps near you",
                  style: GoogleFonts.dmSans(fontSize: height * 0.024, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.42,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(10, (index) {
                      return TeachingCard(
                          height, width, "text", "title", "assets/images/Teach.png");
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
