import 'package:aid_up/Constants.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'NGOForm.dart';
import 'VolunteerForm.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> with SingleTickerProviderStateMixin {
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
    return MaterialApp(
        home: Scaffold(
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
              "Create account",
              style: GoogleFonts.dmSans(
                  color: orangeColor, fontSize: height * 0.04, fontWeight: FontWeight.w500),
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
                  VoulnteerForm(),
                  // Content for NGO tab
                  NGOForm()
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
