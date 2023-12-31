import 'package:aid_up/Constants.dart';
import 'package:aid_up/NGO/widgets/NGOHomeCard.dart';
// import 'package:aid_up/Screens/DonationScreen.dart';
// import 'package:aid_up/Screens/TeachScreen.dart';
// import 'package:aid_up/widgets/HomeSquareCard.dart';
// import 'package:aid_up/widgets/TeachingCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class NGOHomeScreen extends StatelessWidget {
  const NGOHomeScreen({Key? key}) : super(key: key);

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
                        Text(
                          "Hello Nitish Chaurasiya,",
                          style: GoogleFonts.dmSans(
                              color: orangeColor,
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "What do you want to do today?",
                          style: GoogleFonts.dmSans(
                              fontSize: height * 0.02, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: blueColor,
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                NGOHomeCard(height, width, "assets/images/FoodDOnation.png"),
                NGOHomeCard(height, width, "assets/images/Teach.png")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
