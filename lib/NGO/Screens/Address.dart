// import 'package:aid_up/widgets/DonateScreenCard.dart';
// import 'package:aid_up/widgets/TeachCard.dart';
import 'package:aid_up/Constants.dart';
import 'package:aid_up/NGO/Screens/DonationCamp.dart';
import 'package:aid_up/NGO/Screens/TeachingCamp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Volunteer/widgets/DonateScreenCard.dart';
import 'MoneyDoinationNGO.dart';

class AddressNGO extends StatefulWidget {
  bool camp;
  bool? tech;
  AddressNGO({Key? key, required this.camp, this.tech = false}) : super(key: key);

  @override
  State<AddressNGO> createState() => _AddressNGOState();
}

class _AddressNGOState extends State<AddressNGO> {
  TextEditingController address = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
            Icon(
              Icons.arrow_back_rounded,
              size: height * 0.04,
            ),
            Text(
              "Address",
              style: GoogleFonts.dmSans(
                  fontSize: height * 0.035, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    // You can add more complex email validation if needed
                    return null;
                  },
                  key: _formKey,
                  controller: address,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: 'Search address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.white)),
                      focusColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.black)),
                      suffixIcon: Icon(Icons.cancel_outlined),
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.my_location,
                    color: orangeColor,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "Use my current location",
                    style: GoogleFonts.dmSans(
                        fontSize: height * 0.02, fontWeight: FontWeight.w600, color: orangeColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    addressCard(height, width),
                    addressCard(height, width),
                    addressCard(height, width),
                  ],
                ),
              ),
            ),
            // Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                if (address.text.isNotEmpty) {
                  if (widget.tech!) {
                    Get.to(TeachingCamp(
                      address: address.text,
                    ));
                  } else if (widget.camp) {
                    Get.to(DonationCamp(
                      address: address.text,
                    ));
                  } else {
                    Get.to(MoneyDinationCamp(
                      address: address.text,
                    ));
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
                    "Next",
                    style: GoogleFonts.dmSans(fontSize: height * 0.022, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            )
          ],
        ),
      ),
    ));
  }

  Widget addressCard(double height, double width) {
    return Container(
      height: height * 0.08,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Divider(
            height: 1,
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: width * 0.05,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "1233, wave city, NH-34, Bahmeta",
                    style: GoogleFonts.dmSans(
                        fontSize: height * 0.02, fontWeight: FontWeight.w400, color: Colors.black),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: width * 0.05,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "Green park, Ghaziabad",
                    style: GoogleFonts.dmSans(
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.w400,
                        color: Colors.black45),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
