// import 'package:aid_up/widgets/DonateScreenCard.dart';
// import 'package:aid_up/widgets/TeachCard.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../Constants.dart';

class MoneyDinationCamp extends StatefulWidget {
  const MoneyDinationCamp({Key? key}) : super(key: key);

  @override
  State<MoneyDinationCamp> createState() => _MoneyDinationCampState();
}

int ind = 0;

class _MoneyDinationCampState extends State<MoneyDinationCamp> {
  List _responsibilty = [
    "Prepare and Deliver",
    "Lessons Evaluate student progress through quizzes, tests, and assignments.",
    "Offer one-on-one or small group support",
    "Classroom Management"
  ];
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
              "Money donation",
              style: GoogleFonts.dmSans(
                  fontSize: height * 0.035, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            textFieldwithoutIcon(height, width, "Donation cause", "Type cause here"),
            SizedBox(
              height: height * 0.02,
            ),
            textFieldwithoutIcon(height, width, "Receiver", "Type receiver name here"),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(height, width, "Deadline", "DD/MM/YYY", Icons.calendar_month),
                SizedBox(width: width * 0.02),
                textFieldwithoutIcon(height, width, "Target", "Eg. Rs. 10,000"),
              ],
            ),
            SizedBox(
              height: height * 0.025,
            ),
            textFieldDesc(
              height,
              width,
              "Description",
              "Add camp description",
            ),
            Text(
              "Select payment method ",
              style: GoogleFonts.dmSans(
                  fontSize: height * 0.025, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Expanded(
              child: SizedBox(
                height: height * 0.03,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: width,
              child: Container(
                width: width * 0.4,
                height: height * 0.05,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(32)),
                child: Text(
                  "Next",
                  style: GoogleFonts.dmSans(fontSize: height * 0.022, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
          ],
        ),
      ),
    ));
  }

  Widget textField(double height, double width, String title, String hint, IconData icon) {
    return Expanded(
      child: Container(
        height: height * 0.1,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.dmSans(
                  fontSize: height * 0.025, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  hintText: hint,
                  hintStyle: GoogleFonts.poppins(fontSize: height * 0.015),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey)),
                  suffixIcon: Icon(icon),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldwithoutIcon(double height, double width, String title, String hint) {
    return Expanded(
      child: Container(
        height: height * 0.1,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.dmSans(
                  fontSize: height * 0.025, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  hintText: hint,
                  hintStyle: GoogleFonts.poppins(fontSize: height * 0.015),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldDesc(
    double height,
    double width,
    String title,
    String hint,
  ) {
    return Container(
      height: height * 0.2,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.dmSans(
                fontSize: height * 0.025, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
            child: TextField(
              maxLines: 6,
              maxLength: 300,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                hintText: hint,
                hintStyle: GoogleFonts.poppins(fontSize: height * 0.018),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey)),
                focusColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
