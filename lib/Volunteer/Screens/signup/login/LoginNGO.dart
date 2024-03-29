import 'package:aid_up/Volunteer/Screens/signup/OTPScreen.dart';
import 'package:aid_up/Volunteer/Screens/signup/login/pinScreenNgo.dart';
import 'package:aid_up/model/NgoModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Constants.dart';
import '../OTPScreen2.dart';

// import '../../Constants.dart';

class LoginNgo extends StatefulWidget {
  @override
  _LoginNgoState createState() => _LoginNgoState();
}

class _LoginNgoState extends State<LoginNgo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.2),
                Text(
                  "Phone Number",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    hintText: 'Eg. 9999xxxxxx',
                    hintStyle: GoogleFonts.dmSans(fontSize: height * 0.017),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    // You can add more phone number validation if needed
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Container(
                  width: width,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Form is valid, perform your registration logic here
                        // For example, you can print the values for demonstration

                        Get.to(PinScreenLoginNgo(
                          phone: _phoneNumberController.text,
                          ngo: true,
                        ));
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
