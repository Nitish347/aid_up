// import 'package:aid_up/widgets/DonateScreenCard.dart';
// import 'package:aid_up/widgets/TeachCard.dart';
import 'package:aid_up/model/MoneyNGO.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../Constants.dart';
import '../../Firestore/FirestoreData.dart';
import '../../controller/obsData.dart';
import '../../model/DonationNGO.dart';

class MoneyDinationCamp extends StatefulWidget {
  String address;
  MoneyDinationCamp({Key? key, required this.address}) : super(key: key);

  @override
  State<MoneyDinationCamp> createState() => _MoneyDinationCampState();
}

int ind = 0;

class _MoneyDinationCampState extends State<MoneyDinationCamp> {
  TextEditingController cause = TextEditingController();
  TextEditingController receiver = TextEditingController();
  TextEditingController deadline = TextEditingController();
  TextEditingController target = TextEditingController();
  TextEditingController desc = TextEditingController();
  bool causeErr = false;
  bool receiverErr = false;
  bool deadlineErr = false;
  bool targetErr = false;
  bool descErr = false;
  List _rules = [
    "Prepare and Deliver",
    "Lessons Evaluate student progress through quizzes, tests, and assignments.",
    "Offer one-on-one or small group support",
    "Classroom Management"
  ];
  // TextEditingController desc = TextEditingController();
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
                "Money donation",
                style: GoogleFonts.dmSans(
                    fontSize: height * 0.035, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textField(height, width, "Donation cause", "Type cause here",
                      Icons.calendar_month, cause, causeErr),
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textField(height, width, "Receiver", "Type receiver name here",
                      Icons.calendar_month, receiver, receiverErr),
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textField(height, width, "Deadline", "DD/MM/YYY", Icons.calendar_month, deadline,
                      deadlineErr),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  textField(height, width, "Target", "Eg. Rs. 10,000", Icons.calendar_month, target,
                      targetErr),
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              textFieldDesc(height, width, "Description", "Add cause description", desc, descErr),
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
                    cause.text.isEmpty ? causeErr = true : causeErr = false;
                    receiver.text.isEmpty ? receiverErr = true : receiverErr = false;
                    deadline.text.isEmpty ? deadlineErr = true : deadlineErr = false;
                    target.text.isEmpty ? targetErr = true : targetErr = false;
                    desc.text.isEmpty ? descErr = true : descErr = false;
                  });
                  if (cause.text.isNotEmpty &&
                      receiver.text.isNotEmpty &&
                      desc.text.isNotEmpty &&
                      deadline.text.isNotEmpty &&
                      target.text.isNotEmpty) {
                    print("camp!!!!!!!!!");
                    MoneyNgoModel model = MoneyNgoModel.fromJson({
                      "name": controller.ngoData['name'],
                      "phone": controller.ngoData['phone'],
                      "receiver": receiver.text,
                      "deadline": deadline.text,
                      "target": target.text,
                      "desc": desc.text,
                      "rules": _rules,
                      "cause": cause.text
                    });
                    bool succ = await FirestoreData.postMoney(context, model, controller.uid.value);
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
