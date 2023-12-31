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

class DonationCamp extends StatefulWidget {
  const DonationCamp({Key? key}) : super(key: key);

  @override
  State<DonationCamp> createState() => _DonationCampState();
}

int ind = 0;

class _DonationCampState extends State<DonationCamp> {
  List _responsibilty = [
    "Prepare and Deliver",
    "Lessons Evaluate student progress through quizzes, tests, and assignments.",
    "Offer one-on-one or small group support",
    "Classroom Management"
  ];
  bool _clothesChecked = false;
  bool _booksAndStationeryChecked = false;
  bool _foodChecked = false;
  bool _money = false;
  bool _medical = false;
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
              "Donation Camp",
              style: GoogleFonts.dmSans(
                  fontSize: height * 0.035, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _clothesChecked,
                      checkColor: Colors.white,
                      activeColor: orangeColor,
                      onChanged: (value) {
                        setState(() {
                          _clothesChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "Clothes",
                      style: GoogleFonts.dmSans(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _booksAndStationeryChecked,
                      checkColor: Colors.white,
                      activeColor: orangeColor,
                      onChanged: (value) {
                        setState(() {
                          _booksAndStationeryChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "Books & Stationery",
                      style: GoogleFonts.dmSans(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _foodChecked,
                      checkColor: Colors.white,
                      activeColor: orangeColor,
                      onChanged: (value) {
                        setState(() {
                          _foodChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "Food",
                      style: GoogleFonts.dmSans(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _booksAndStationeryChecked,
                      checkColor: Colors.white,
                      activeColor: orangeColor,
                      onChanged: (value) {
                        setState(() {
                          _booksAndStationeryChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "Money",
                      style: GoogleFonts.dmSans(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _foodChecked,
                      checkColor: Colors.white,
                      activeColor: orangeColor,
                      onChanged: (value) {
                        setState(() {
                          _foodChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "Medical aid",
                      style: GoogleFonts.dmSans(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(height, width, "Date", "DD/MM/YYY", Icons.calendar_month),
                SizedBox(width: width * 0.02),
                textField(height, width, "Time", "00:00 AM", Icons.watch_later_outlined),
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
              "Rules: ",
              style: GoogleFonts.dmSans(
                  fontSize: height * 0.022, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            BulletedList(
              listItems: _responsibilty,
              listOrder: ListOrder.ordered,
              bulletColor: Colors.black,
              style: GoogleFonts.dmSans(
                  fontSize: height * 0.02, color: Colors.black, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: height * 0.03,
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

  Widget textFieldDesc(
    double height,
    double width,
    String title,
    String hint,
  ) {
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
      ),
    );
  }
}
