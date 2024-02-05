// import 'package:aid_up/widgets/DonateScreenCard.dart';
// import 'package:aid_up/widgets/TeachCard.dart';
import 'package:aid_up/Firestore/FirestoreData.dart';
import 'package:aid_up/controller/obsData.dart';
import 'package:aid_up/model/DonationNGO.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:quickalert/quickalert.dart';

import '../../Constants.dart';

class DonationCamp extends StatefulWidget {
  String address;
  DonationCamp({Key? key, required this.address}) : super(key: key);

  @override
  State<DonationCamp> createState() => _DonationCampState();
}

int ind = 0;

class _DonationCampState extends State<DonationCamp> {
  List _rules = [
    "Prepare and Deliver",
    "Lessons Evaluate student progress through quizzes, tests, and assignments.",
    "Offer one-on-one or small group support",
    "Classroom Management"
  ];
  bool _clothes = false;
  bool _books = false;
  bool _food = false;
  bool _money = false;
  bool _medical = false;
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController desc = TextEditingController();
  bool dateErr = false;
  bool timeErr = false;
  bool descErr = false;
  final controller = Get.put(ObsData());
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
                        value: _clothes,
                        checkColor: Colors.white,
                        activeColor: orangeColor,
                        onChanged: (value) {
                          setState(() {
                            _clothes = value!;
                          });
                        },
                      ),
                      Text(
                        "Clothes",
                        style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _books,
                        checkColor: Colors.white,
                        activeColor: orangeColor,
                        onChanged: (value) {
                          setState(() {
                            _books = value!;
                          });
                        },
                      ),
                      Text(
                        "Books & Stationery",
                        style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _food,
                        checkColor: Colors.white,
                        activeColor: orangeColor,
                        onChanged: (value) {
                          setState(() {
                            _food = value!;
                          });
                        },
                      ),
                      Text(
                        "Food",
                        style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, color: Colors.black),
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
                        value: _books,
                        checkColor: Colors.white,
                        activeColor: orangeColor,
                        onChanged: (value) {
                          setState(() {
                            _money = value!;
                          });
                        },
                      ),
                      FittedBox(
                        child: Text(
                          "Money",
                          style:
                              GoogleFonts.dmSans(fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _food,
                        checkColor: Colors.white,
                        activeColor: orangeColor,
                        onChanged: (value) {
                          setState(() {
                            _medical = value!;
                          });
                        },
                      ),
                      Text(
                        "Medical aid",
                        style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, color: Colors.black),
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
                  textField(
                      height, width, "Date", "DD/MM/YYY", Icons.calendar_month, date, dateErr),
                  SizedBox(width: width * 0.02),
                  textField(
                      height, width, "Time", "00:00 AM", Icons.watch_later_outlined, time, timeErr),
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              textFieldDesc(height, width, "Description", "Add camp description", desc, descErr),
              Text(
                "Rules: ",
                style: GoogleFonts.dmSans(
                    fontSize: height * 0.022, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                child: BulletedList(
                  listItems: _rules,
                  listOrder: ListOrder.ordered,
                  bulletColor: Colors.black,
                  style: GoogleFonts.dmSans(
                      fontSize: height * 0.02, color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    date.text.isEmpty ? dateErr = true : dateErr = false;
                    time.text.isEmpty ? timeErr = true : timeErr = false;
                    desc.text.isEmpty ? descErr = true : descErr = false;
                  });
                  if (date.text.isNotEmpty && time.text.isNotEmpty && desc.text.isNotEmpty) {
                    print("camp!!!!!!!!!");
                    DonationNgoModel model = DonationNgoModel.fromJson({
                      "name": controller.ngoData["name"],
                      "phone": controller.ngoData["phone"],
                      "address": widget.address,
                      "donation_type": [
                        {
                          "clothes": _clothes,
                          "books": _books,
                          "food": _food,
                          "money": _money,
                          "medical": _medical
                        }
                      ],
                      "date": date.text,
                      "time": time.text,
                      "desc": desc.text,
                      "rules": _rules
                    });
                    bool succ = await FirestoreData.post(
                        context, model, controller.uid.value, "DnationCamp");
                    if (succ) {
                      Get.back();
                      QuickAlert.show(context: context, type: QuickAlertType.success);
                    } else {
                      QuickAlert.show(context: context, type: QuickAlertType.error);
                    }
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width,
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.05,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(32)),
                    child: Text(
                      "Post",
                      style: GoogleFonts.dmSans(fontSize: height * 0.022, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget textField(double height, double width, String title, String hint, IconData icon,
      TextEditingController controller, bool err) {
    return Expanded(
      child: Container(
        height: err ? height * 0.15 : height * 0.1,
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
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  hintText: hint,
                  errorText: err ? "*required" : null,
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

  Widget textFieldDesc(double height, double width, String title, String hint,
      TextEditingController controller, bool err) {
    return Container(
      height: err ? height * 0.3 : height * 0.25,
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
          SizedBox(
            child: TextField(
              controller: controller,
              maxLines: 6,
              maxLength: 300,
              decoration: InputDecoration(
                errorText: err ? "*required" : null,
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
