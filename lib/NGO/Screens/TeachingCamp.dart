// import 'package:aid_up/widgets/DonateScreenCard.dart';
// import 'package:aid_up/widgets/TeachCard.dart';
import 'package:aid_up/controller/obsData.dart';
import 'package:aid_up/model/TeachingModel.dart';
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
import '../../model/DonationNGO.dart';

class TeachingCamp extends StatefulWidget {
  String address;
  TeachingCamp({Key? key, required this.address}) : super(key: key);

  @override
  State<TeachingCamp> createState() => _TeachingCampState();
}

int ind = 0;

class _TeachingCampState extends State<TeachingCamp> {
  List _rules = [
    "Prepare and Deliver",
    "Lessons Evaluate student progress through quizzes, tests, and assignments.",
    "Offer one-on-one or small group support",
    "Classroom Management"
  ];
  bool dateErr = false;
  bool timeErr = false;
  bool descErr = false;
  String subject = "";
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController desc = TextEditingController();
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
                "Teaching Camp",
                style: GoogleFonts.dmSans(
                    fontSize: height * 0.035, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Subject",
                style: GoogleFonts.dmSans(
                    fontSize: height * 0.025, fontWeight: FontWeight.w500, color: Colors.black),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.055,
                child: DropDownTextField(
                  clearOption: false,
                  // textFieldFocusNode: textFieldFocusNode,
                  // searchFocusNode: searchFocusNode,
                  searchAutofocus: true,
                  dropDownItemCount: 8,
                  dropdownColor: Colors.white,
                  textFieldDecoration: InputDecoration(
                    label: Text(
                      "--Select Subject--",
                      style: GoogleFonts.poppins(fontSize: height * 0.015),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        )),
                  ),
                  dropdownRadius: 10,

                  searchShowCursor: true,
                  enableSearch: true,
                  searchKeyboardType: TextInputType.number,
                  dropDownList: const [
                    DropDownValueModel(name: 'name1', value: "value1"),
                    DropDownValueModel(
                        name: 'name2',
                        value: "value2",
                        toolTipMsg:
                            "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                    DropDownValueModel(name: 'name3', value: "value3"),
                    DropDownValueModel(
                        name: 'name4',
                        value: "value4",
                        toolTipMsg:
                            "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                    DropDownValueModel(name: 'name5', value: "value5"),
                    DropDownValueModel(name: 'name6', value: "value6"),
                    DropDownValueModel(name: 'name7', value: "value7"),
                    DropDownValueModel(name: 'name8', value: "value8"),
                  ],
                  onChanged: (val) {
                    setState(() {
                      subject = val.name.toString();
                    });
                  },
                ),
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
                "Responsibility: ",
                style: GoogleFonts.dmSans(
                    fontSize: height * 0.022, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              BulletedList(
                listItems: _rules,
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
                  child: InkWell(
                    onTap: () async {
                      final controller = Get.put(ObsData());
                      setState(() {
                        date.text.isEmpty ? dateErr = true : dateErr = false;
                        time.text.isEmpty ? timeErr = true : timeErr = false;
                        desc.text.isEmpty ? descErr = true : descErr = false;
                      });
                      if (date.text.isNotEmpty && time.text.isNotEmpty && desc.text.isNotEmpty) {
                        print("camp!!!!!!!!!");
                        TeachiingNgoModel model = TeachiingNgoModel.fromJson({
                          "name": controller.ngoData["name"],
                          "phone": controller.ngoData["phone"],
                          "subject": subject,
                          "address": widget.address,
                          "date": date.text,
                          "time": time.text,
                          "desc": desc.text,
                          "rules": _rules
                        });
                        bool succ = await FirestoreData.postTeach(
                          context,
                          model,
                          controller.uid.value,
                        );
                        if (succ) {
                          Get.back();
                          QuickAlert.show(context: context, type: QuickAlertType.success);
                        } else {
                          QuickAlert.show(context: context, type: QuickAlertType.error);
                        }
                      }
                    },
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
                  )),
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
      height: err ? height * 0.3 : height * 0.3,
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
