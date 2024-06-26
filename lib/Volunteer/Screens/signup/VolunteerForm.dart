// import 'package:aid_up/Screens/signup/OTPScreen.dart';
import 'package:aid_up/Volunteer/Screens/HomeScreen.dart';
import 'package:aid_up/controller/obsData.dart';
import 'package:aid_up/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants.dart';
import 'OTPScreen.dart';

// import '../../Constants.dart';

class VoulnteerForm extends StatefulWidget {
  @override
  _VoulnteerFormState createState() => _VoulnteerFormState();
}

class _VoulnteerFormState extends State<VoulnteerForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();
  TextEditingController _name = TextEditingController();
  bool _obscurePassword = false;
  bool _obscureRepeatPassword = false;
  final controller = Get.put(ObsData());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.03, left: width * 0.03, right: width * 0.03),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    // labelText: 'Email',
                    hintText: 'Eg. Nitish..',
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
                      return 'Please enter your name';
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
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Date of Birth",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(
                    hintText: 'MM / DD / YYYY',
                    hintStyle: GoogleFonts.dmSans(fontSize: height * 0.017),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff1D3050)),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
                    }
                    // You can add more date of birth validation if needed
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Aadhar Number",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Number',
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
                      return 'required*';
                    }
                    // You can add more password validation if needed
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Repeat Aadhar Number",
                  style: GoogleFonts.dmSans(fontSize: height * 0.021, fontWeight: FontWeight.w600),
                ),
                TextFormField(
                  controller: _repeatPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Number',
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
                      return 'required*';
                    }
                    if (value != _passwordController.text) {
                      return 'number do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.08,
                ),
                Container(
                  width: width,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Get.to(HomeScreen());
                      // if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, perform your registration logic here
                      // For example, you can print the values for demonstration
                      UserModel userModel = UserModel.fromJson({
                        "name": _name.text,
                        "email": _emailController.text,
                        "phone": _phoneNumberController.text,
                        "dob": _dobController.text,
                        "password": _passwordController.text,
                      });
                      print('Email: ${_emailController.text}');
                      print('Phone Number: ${_phoneNumberController.text}');
                      print('Date of Birth: ${_dobController.text}');
                      print('Password: ${_passwordController.text}');
                      print('Repeat Password: ${_repeatPasswordController.text}');

                      Get.to(PinScreen(
                        userModel: userModel,
                      ));
                      // }
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
