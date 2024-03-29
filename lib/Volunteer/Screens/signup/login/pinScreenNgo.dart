// import 'package:aid_up/Screens/HomeScreen.dart';
import 'dart:developer';

import 'package:aid_up/Firestore/FirebaseUser.dart';
import 'package:aid_up/Firestore/FirestoreData.dart';
import 'package:aid_up/Firestore/Volunteer/FirebaseVUser.dart';
import 'package:aid_up/NGO/Screens/NGOHome.dart';
import 'package:aid_up/controller/obsData.dart';
import 'package:aid_up/model/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Constants.dart';
import '../../../../Services/token.dart';
import '../../HomeScreen.dart';

class PinScreenLoginNgo extends StatefulWidget {
  String phone;
  bool ngo;
  PinScreenLoginNgo({required this.phone, required this.ngo});
  @override
  _PinScreenLoginNgoState createState() => _PinScreenLoginNgoState();
}

class _PinScreenLoginNgoState extends State<PinScreenLoginNgo> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String verficationID_received = "";
  TextEditingController _pinController1 = TextEditingController();
  TextEditingController _pinController2 = TextEditingController();
  TextEditingController _pinController3 = TextEditingController();
  TextEditingController _pinController4 = TextEditingController();
  TextEditingController _pinController5 = TextEditingController();
  TextEditingController _pinController6 = TextEditingController();
  FocusNode _pin1FocusNode = FocusNode();
  FocusNode _pin2FocusNode = FocusNode();
  FocusNode _pin3FocusNode = FocusNode();
  FocusNode _pin4FocusNode = FocusNode();
  FocusNode _pin5FocusNode = FocusNode();
  FocusNode _pin6FocusNode = FocusNode();
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verify(widget.phone);
  }

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
              "Enter the 4 digit code sent to\nyou on ${widget.phone}. ",
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
                buildPinTextField(_pinController1, _pin1FocusNode, width),
                buildPinTextField(_pinController2, _pin2FocusNode, width),
                buildPinTextField(_pinController3, _pin3FocusNode, width),
                buildPinTextField(_pinController4, _pin4FocusNode, width),
                buildPinTextField(_pinController5, _pin5FocusNode, width),
                buildPinTextField(_pinController6, _pin6FocusNode, width),
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
                  // Get.to(HomeScreen());
                  verifycode(
                      _pinController1.text +
                          _pinController2.text +
                          _pinController3.text +
                          _pinController4.text +
                          _pinController5.text +
                          _pinController6.text,
                      context);
                },
                child: Container(
                  width: width * 0.4,
                  height: height * 0.05,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(32)),
                  child: _loading
                      ? LoadingAnimationWidget.fourRotatingDots(
                          color: Colors.white, size: height * 0.03)
                      : Text(
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

  Widget buildPinTextField(TextEditingController controller, FocusNode focusNode, double width) {
    return Container(
      width: width * 0.09,
      height: width * 0.09,
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
            } else if (focusNode == _pin4FocusNode) {
              FocusScope.of(context).requestFocus(_pin5FocusNode);
            } else if (focusNode == _pin5FocusNode) {
              FocusScope.of(context).requestFocus(_pin6FocusNode);
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

  void verify(String PhoneNumber) {
    print(PhoneNumber);
    auth.verifyPhoneNumber(
        phoneNumber: "+91${PhoneNumber}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("login successfully");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verficationID, int? resendtoken) {
          verficationID_received = verficationID;
          setState(() {
            // otp_visible = true;
          });
        },
        codeAutoRetrievalTimeout: (String verficationID) {});
    print("code sent");
  }

  void verifycode(String otp, BuildContext context) async {
    print(otp);
    setState(() {
      _loading = true;
    });
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verficationID_received, smsCode: otp);
    await auth.signInWithCredential(credential).then((value) async {
      final User? user = auth.currentUser;
      String uid = user!.uid.toString();
      final controller = Get.put(ObsData());
      controller.uid.value = user!.uid.toString();
      widget.ngo
          ? await FirestoreData.userData(context, uid)
          : FirestoreVData.userData(context, uid);
      setState(() {
        _loading = false;
      });

      log("logged in successfully");

      await TokenStorage.storeToken(widget.ngo ? "ngo" : "volunteer");

      Get.to(widget.ngo ? NGOHomeScreen() : HomeScreen());
    });
  }
}
