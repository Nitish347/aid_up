import 'package:aid_up/Constants.dart';
import 'package:aid_up/NGO/Screens/booked/booked_screen.dart';
import 'package:aid_up/Volunteer/Screens/signup/CreateAccount.dart';
import 'package:aid_up/Volunteer/Screens/signup/login/login.dart';
import 'package:aid_up/controller/obsData.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:aid_up/widgets/TeachCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Services/token.dart';
import '../widgets/TeachCard2.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final controller = Get.put(ObsData());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.03, left: width * 0.045, right: width * 0.02),
        child: SingleChildScrollView(
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
                "Profile",
                style: GoogleFonts.dmSans(
                    fontSize: height * 0.035, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ListTile(
                leading: Container(
                  height: height * 0.06,
                  width: height * 0.06,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50), color: orangeColor),
                ),
                title: Row(
                  children: [
                    Text(
                controller.ngoData["name"],
                      style:
                          GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.022),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_rounded,
                          color: orangeColor,
                        )),
                    Text(
                      "Edit",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w400,
                        fontSize: height * 0.02,
                        color: orangeColor,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  "${controller.ngoData["phone"]}" + " " + "|" + " " + "${controller.ngoData["email"]}",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400, fontSize: height * 0.022, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "General",
                style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.027),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              InkWell(
                  onTap: (){
                    Get.to(BookedScreen());
                  },
                  child: profileOptions(height, width, "Bookings", "View your past sessions or donations ")),
              profileOptions(height, width, "Privacy", "Change your password"),
              profileOptions(height, width, "Certificates", "Download your volunteer certificates"),
              profileOptions(height, width, "Notifications", "Manage notifications"),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                "Payments",
                style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.027),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              profileOptions(height, width, "Payment methods", "Manage payment methods"),
              profileOptions(height, width, "Payment history", "View history of payments made"),
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                "Support",
                style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.027),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Text(
                "About us",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.022,
                    color: Color(0xff191919)),
              ),
              Divider(
                color: Color(0xff6A6A6A),
              ),
              Text(
                "Privacy policy",
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.022,
                    color: Color(0xff191919)),
              ),
              Divider(
                color: Color(0xff6A6A6A),
              ),
              InkWell(
                onTap: () async {

                  await TokenStorage.removeToken();
                  await FirebaseAuth.instance.signOut();
                  Get.to(() => const Login());

                },
                child: Text(
                  "Log Out",
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w600, fontSize: height * 0.022, color: Colors.red),
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
}

Widget profileOptions(double height, double width, String title, String subtitle) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: height * 0.005),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.022,
                      color: Color(0xff191919)),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400,
                      fontSize: height * 0.02,
                      color: Color(0xff191919)),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
        Divider(
          color: Color(0xff6A6A6A),
        )
      ],
    ),
  );
}
