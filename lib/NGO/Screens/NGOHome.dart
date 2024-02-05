import 'package:aid_up/Constants.dart';
import 'package:aid_up/NGO/Screens/Address.dart';
import 'package:aid_up/NGO/widgets/NGOHomeCard.dart';
import 'package:aid_up/controller/obsData.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:aid_up/Screens/DonationScreen.dart';
// import 'package:aid_up/Screens/TeachScreen.dart';
// import 'package:aid_up/widgets/HomeSquareCard.dart';
// import 'package:aid_up/widgets/TeachingCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Firestore/FirestoreData.dart';

class NGOHomeScreen extends StatefulWidget {
  const NGOHomeScreen({Key? key}) : super(key: key);

  @override
  State<NGOHomeScreen> createState() => _NGOHomeScreenState();
}

class _NGOHomeScreenState extends State<NGOHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    loading();
  }

  bool _loading = false;
  String name = "";
  void loading() async {
    setState(() {
      _loading = true;
    });
    await FirestoreData.userData(context, FirebaseAuth.instance.currentUser!.uid.toString());
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final controller = Get.put(ObsData());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _loading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    EdgeInsets.only(top: height * 0.05, left: width * 0.045, right: width * 0.045),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello ${controller.ngoData["name"]},",
                                style: GoogleFonts.dmSans(
                                    color: orangeColor,
                                    fontSize: height * 0.03,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "What do you want to do today?",
                                style: GoogleFonts.dmSans(
                                    fontSize: height * 0.02, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              await FirebaseAuth.instance.signOut();
                            },
                            child: CircleAvatar(
                              backgroundColor: blueColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      InkWell(
                          onTap: () {
                            Get.to(AddressNGO(
                              camp: true,
                            ));
                          },
                          child: NGOHomeCard(
                              height,
                              width,
                              "assets/images/FoodDOnation.png",
                              "Donation camp",
                              "Organize donation camp for Books, clothes and money")),
                      InkWell(
                          onTap: () {
                            Get.to(AddressNGO(
                              camp: false,
                              tech: true,
                            ));
                          },
                          child: NGOHomeCard(height, width, "assets/images/Teach.png",
                              "Teaching camp ", "Organize teaching camp for underprivileged kids")),
                      InkWell(
                          onTap: () {
                            Get.to(AddressNGO(
                              camp: false,
                            ));
                          },
                          child: NGOHomeCard(height, width, "assets/images/FoodDOnation.png",
                              "Money Donation", "Organize donation for money")),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
