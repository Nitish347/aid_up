import 'package:aid_up/Constants.dart';
import 'package:aid_up/Volunteer/Screens/signup/CreateAccount.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../NGOForm.dart';
import '../VolunteerForm.dart';
import 'LoginNGO.dart';
import 'LoginVolunteer.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Log in account",
                    style: GoogleFonts.dmSans(
                        color: orangeColor,
                        fontSize: height * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(() => CreateAccount());
                    },
                    child: Container(
                      width: width * 0.2,
                      height: height * 0.04,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(32)),
                      child: Text(
                        "Log In",
                        style: GoogleFonts.dmSans(
                            fontSize: height * 0.022, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: 'Volunteer',
                    ),
                    Tab(text: 'NGO'),
                  ],
                  labelStyle:
                      GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.02),
                  labelColor: blueColor,
                  indicator: BoxDecoration(
                    border: Border(bottom: BorderSide(color: blueColor, width: 2.0)),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Content for Volunteer tab
                    LoginVolunteer(),
                    LoginNgo(),
                    // Content for NGO tab
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
