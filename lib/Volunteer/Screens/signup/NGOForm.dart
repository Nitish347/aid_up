import 'package:aid_up/Volunteer/Screens/signup/OTPScreen.dart';
import 'package:aid_up/model/NgoModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants.dart';
import 'OTPScreen2.dart';

// import '../../Constants.dart';

class NGOForm extends StatefulWidget {
  @override
  _NGOFormState createState() => _NGOFormState();
}

class _NGOFormState extends State<NGOForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _NGOName = TextEditingController();
  TextEditingController _NGOAddress = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();
  bool _obscurePassword = false;
  bool _obscureRepeatPassword = false;

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
              children: [
                Text(
                  "NGO Name",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _NGOName,
                  decoration: InputDecoration(
                    // labelText: 'Email',
                    hintText: 'Eg. xyz',
                    hintStyle: GoogleFonts.dmSans(fontSize: height * 0.017),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your NGO name';
                    }
                    // You can add more complex email validation if needed
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "NGO Address",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _NGOAddress,
                  decoration: InputDecoration(
                    // labelText: 'Email',
                    hintText: 'Eg. Ghaziabad',
                    hintStyle: GoogleFonts.dmSans(fontSize: height * 0.017),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    // You can add more complex email validation if needed
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Email",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    // labelText: 'Email',
                    hintText: 'Eg. xyz123@gmail.com',
                    hintStyle: GoogleFonts.dmSans(fontSize: height * 0.017),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add more complex email validation if needed
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
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
                SizedBox(height: height * 0.02),
                Text(
                  "NGO Reg. Number",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Reg. n umber',
                    hintStyle: GoogleFonts.dmSans(fontSize: height * 0.017),
                    // suffixIcon: GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       _obscurePassword = !_obscurePassword;
                    //     });
                    //   },
                    //   child: Icon(
                    //     _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    //     color: Color(0xff1D3050),
                    //   ),
                    // ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                  ),
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your reg. number';
                    }
                    // You can add more password validation if needed
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Repeat NGO Reg. Number",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _repeatPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Reg, number',
                    hintStyle: GoogleFonts.dmSans(fontSize: height * 0.017),
                    // suffixIcon: GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       _obscureRepeatPassword = !_obscureRepeatPassword;
                    //     });
                    //   },
                    //   child: Icon(
                    //     _obscureRepeatPassword ? Icons.visibility : Icons.visibility_off,
                    //     color: Color(0xff1D3050),
                    //   ),
                    // ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                  ),
                  obscureText: _obscureRepeatPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please repeat your reg. number';
                    }
                    if (value != _passwordController.text) {
                      return 'Number do not match';
                    }
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
                        NgoModel ngoModel = NgoModel.fromJson({
                          "name": _NGOName.text,
                          "address": _NGOAddress.text,
                          "email": _emailController.text,
                          "phone": _phoneNumberController.text,
                          "password": _passwordController.text,
                        });
                        Get.to(PinScreen2(userModel: ngoModel));
                        print('Email: ${_emailController.text}');
                        print('Phone Number: ${_phoneNumberController.text}');
                        print('Date of Birth: ${_dobController.text}');
                        print('Password: ${_passwordController.text}');
                        print('Repeat Password: ${_repeatPasswordController.text}');
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
