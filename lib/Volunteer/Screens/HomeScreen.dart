import 'dart:developer';

import 'package:aid_up/Constants.dart';
import 'package:aid_up/Volunteer/Screens/Profile.dart';
import 'package:aid_up/controller/obsData.dart';
import 'package:aid_up/model/DonationNGO.dart';
import 'package:aid_up/model/TeachingModel.dart';
import 'package:aid_up/model/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Firestore/FirestoreData.dart';
import '../../Firestore/Volunteer/FirebaseVUser.dart';
import '../../Services/token.dart';
import '../widgets/HomeSquareCard.dart';
import '../widgets/TeachingCard.dart';
import 'DonationScreen.dart';
import 'TeachScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    loading();
  }

  final controller = Get.put(ObsData());
  bool _loading = false;
  String name = "";
  late UserModel userModel;
  void loading() async {
    setState(() {
      _loading = true;
    });
    await FirestoreVData.userData(context, FirebaseAuth.instance.currentUser!.uid.toString());
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: height * 0.03, left: width * 0.045, right: width * 0.045),
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
                        Row(
                          children: [
                            Icon(CupertinoIcons.paperplane_fill),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              "Address",
                              style: GoogleFonts.dmSans(
                                  fontSize: height * 0.025, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Text(
                          "Sarjapur Marathahalli road,…",
                          style: GoogleFonts.dmSans(
                              fontSize: height * 0.02, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ProfileScreen());
                      },
                      child: CircleAvatar(
                        backgroundColor: blueColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Hello ${controller.userData["name"]},",
                  style: GoogleFonts.dmSans(
                      color: orangeColor, fontSize: height * 0.03, fontWeight: FontWeight.w500),
                ),
                Text(
                  "What do you want to do today?",
                  style: GoogleFonts.dmSans(fontSize: height * 0.02, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Get.to(DonationScreen()),
                        child: HomeCard(height, width, "Donate Books, clothes and money", "Donate",
                            "assets/images/FoodDOnation.png"),
                      ),
                      InkWell(
                        onTap: () => Get.to(TeachScreen()),
                        child: HomeCard(height, width, "Donate Books, clothes and money", "Teach",
                            "assets/images/Teach.png"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  "Teaching camps near you",
                  style: GoogleFonts.dmSans(fontSize: height * 0.024, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                    height: height * 0.42,
                    child: FutureBuilder(
                      future: FirebaseFirestore.instance.collection("TeachingCamp").get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: LoadingAnimationWidget.waveDots(color: orangeColor, size: 50),
                          );
                        } else {
                          controller.teachingList.clear();
                          for (int i = 0; i < snapshot.data!.docs.length; i++) {
                            String name = snapshot.data!.docs[i]["name"];
                            String phone = snapshot.data!.docs[i]["phone"];
                            String address = snapshot.data!.docs[i]["address"];
                            // String donationType = snapshot.data!.docs[index]["donation_type"];
                            String time = snapshot.data!.docs[i]["time"];
                            String date = snapshot.data!.docs[i]["date"];
                            String desc = snapshot.data!.docs[i]["desc"];
                            List rules = snapshot.data!.docs[i]["rules"];
                            String subject = snapshot.data!.docs[i]["subject"];
                            TeachiingNgoModel model = TeachiingNgoModel.fromJson({
                              "name": name,
                              "phone": phone,
                              "subject": subject,
                              "address": address,
                              "date": date,
                              "time": time,
                              "desc": desc,
                              "rules": rules,
                            });
                            controller.teachingList.add(model);
                          }
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(snapshot.data!.docs.length, (index) {
                              String name = snapshot.data!.docs[index]["name"];
                              String phone = snapshot.data!.docs[index]["phone"];
                              String address = snapshot.data!.docs[index]["address"];
                              // String donationType = snapshot.data!.docs[index]["donation_type"];
                              String time = snapshot.data!.docs[index]["time"];
                              String date = snapshot.data!.docs[index]["date"];
                              String desc = snapshot.data!.docs[index]["desc"];
                              List rules = snapshot.data!.docs[index]["rules"];
                              String subject = snapshot.data!.docs[index]["subject"];
                              String uid = snapshot.data!.docs[index]["uid"];

                              TeachiingNgoModel model = TeachiingNgoModel.fromJson({
                                "name": name,
                                "phone": phone,
                                "subject": subject,
                                "address": address,
                                "date": date,
                                "time": time,
                                "desc": desc,
                                "rules": rules,
                                "uid": uid
                              });

                              return TeachingCard(
                                  height, width, model, "assets/images/children.png");
                            }),
                          );
                        }
                      },
                    )),
                Text(
                  "Donation camps near you",
                  style: GoogleFonts.dmSans(fontSize: height * 0.024, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                    height: height * 0.42,
                    child: FutureBuilder(
                      future: FirebaseFirestore.instance.collection("DonationCamp").get(),
                      builder: (context, snapshot) {
                        // log(snapshot.data!.docs[0]["name"].toString());
                        if (!snapshot.hasData) {
                          return Center(
                            child: LoadingAnimationWidget.waveDots(color: orangeColor, size: 50),
                          );
                        } else {
                          controller.donationList.clear();
                          for (int index = 0; index < snapshot.data!.docs.length; index++) {
                            String name = snapshot.data!.docs[index]["name"];
                            String phone = snapshot.data!.docs[index]["phone"];
                            String address = snapshot.data!.docs[index]["address"];
                            List donationType = snapshot.data!.docs[index]["donation_type"];
                            String time = snapshot.data!.docs[index]["time"];
                            String date = snapshot.data!.docs[index]["date"];
                            String desc = snapshot.data!.docs[index]["desc"];
                            List rules = snapshot.data!.docs[index]["rules"];
                            DonationNgoModel model = DonationNgoModel.fromJson({
                              "name": name,
                              "phone": phone,
                              "address": address,
                              "donation_type": donationType,
                              "date": date,
                              "time": time,
                              "desc": desc,
                              "rules": rules
                            });
                            controller.donationList.add(model);
                          }
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(snapshot.data!.docs.length, (index) {
                              String name = snapshot.data!.docs[index]["name"];
                              String phone = snapshot.data!.docs[index]["phone"];
                              String address = snapshot.data!.docs[index]["address"];
                              List donationType = snapshot.data!.docs[index]["donation_type"];
                              String time = snapshot.data!.docs[index]["time"];
                              String date = snapshot.data!.docs[index]["date"];
                              String desc = snapshot.data!.docs[index]["desc"];
                              List rules = snapshot.data!.docs[index]["rules"];
                              String uid = snapshot.data!.docs[index]["uid"] ?? "";

                              // String subject = snapshot.data!.docs[index]["subject"];
                              DonationNgoModel model = DonationNgoModel.fromJson({
                                "name": name,
                                "phone": phone,
                                "address": address,
                                "donation_type": donationType,
                                "date": date,
                                "time": time,
                                "desc": desc,
                                "rules": rules,
                                "uid": uid
                              });

                              return DonationCard(
                                  height, width, model, "assets/images/children.png");
                            }),
                          );
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
