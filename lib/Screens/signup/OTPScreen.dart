import 'package:aid_up/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PinScreen(),
    );
  }
}

class PinScreen extends StatefulWidget {
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController _pinController1 = TextEditingController();
  TextEditingController _pinController2 = TextEditingController();
  TextEditingController _pinController3 = TextEditingController();
  TextEditingController _pinController4 = TextEditingController();
  FocusNode _pin1FocusNode = FocusNode();
  FocusNode _pin2FocusNode = FocusNode();
  FocusNode _pin3FocusNode = FocusNode();
  FocusNode _pin4FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.03, left: width * 0.03, right: width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "OTP Sent!",
              style: GoogleFonts.dmSans(
                  color: orangeColor, fontSize: height * 0.04, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: height * 0.030,
            ),
            Text(
              "Enter the 4 digit code sent to\nyou on 9999xxxxxx. ",
              style: GoogleFonts.dmSans(
                  color: Colors.black, fontSize: height * 0.02, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Change Number",
              style: GoogleFonts.dmSans(
                  color: Colors.red,
                  fontSize: height * 0.018,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildPinTextField(_pinController1, _pin1FocusNode),
                buildPinTextField(_pinController2, _pin2FocusNode),
                buildPinTextField(_pinController3, _pin3FocusNode),
                buildPinTextField(_pinController4, _pin4FocusNode),
              ],
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Get.to(HomeScreen());
                },
                child: Container(
                  width: width * 0.4,
                  height: height * 0.05,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(32)),
                  child: Text(
                    "Verify OTP",
                    style: GoogleFonts.dmSans(fontSize: height * 0.022, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              child: Text(
                "Didn’t receive OTP?",
                style: GoogleFonts.dmSans(
                    color: Colors.red,
                    fontSize: height * 0.018,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // Validate and process the entered OTP
            //     // if (_pinController.text.length == 4) {
            //     //   // You can perform actions like verifying the OTP here
            //     //   print('Entered OTP: ${_pinController.text}');
            //     // } else {
            //     //   // Handle invalid OTP length
            //     //   print('Invalid OTP length');
            //     // }
            //   },
            //   child: Text('Submit'),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildPinTextField(TextEditingController controller, FocusNode focusNode) {
    return Container(
      width: 50.0,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        // obscureText: true,
        onChanged: (value) {
          // Move focus to the next TextField when a digit is entered
          if (value.length == 1) {
            if (focusNode == _pin1FocusNode) {
              FocusScope.of(context).requestFocus(_pin2FocusNode);
            } else if (focusNode == _pin2FocusNode) {
              FocusScope.of(context).requestFocus(_pin3FocusNode);
            } else if (focusNode == _pin3FocusNode) {
              FocusScope.of(context).requestFocus(_pin4FocusNode);
            }
          }
        },
        decoration: InputDecoration(
          counterText: '', // Hide the character counter
          border: OutlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
