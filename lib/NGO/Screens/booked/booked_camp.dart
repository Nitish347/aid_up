// import 'package:aid_up/widgets/TeachCard.dart';
import 'dart:developer';

import 'package:aid_up/Constants.dart';
import 'package:aid_up/Firestore/FirestoreData.dart';
import 'package:aid_up/NGO/Screens/DonationCamp.dart';
import 'package:aid_up/controller/obsData.dart';
import 'package:aid_up/model/DonationNGO.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Volunteer/Screens/CampDetail.dart';
import '../../../Volunteer/widgets/TeachCard2.dart';
import 'bookedCampDetail.dart';


class BookedCamp extends StatefulWidget {
  const BookedCamp({Key? key}) : super(key: key);

  @override
  State<BookedCamp> createState() => _BookedCampState();
}

class _BookedCampState extends State<BookedCamp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookedCamp();

  }
  getBookedCamp()async{
    setState(() {
      _loading = true;
    });
    await   FirestoreData.getBookedCamp(context,);
  setState(() {

    _loading = false;
  });

  }
  bool _loading = false;
  final controller = Get.put(ObsData());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final controller = Get.put(ObsData());
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body :_loading ?  Center(child: LoadingAnimationWidget.fourRotatingDots(color: orangeColor, size: 50))  :       Padding(
            padding: EdgeInsets.only(top: height * 0.03, left: width * 0.045, right: width * 0.045),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Booked Camp",style: GoogleFonts.poppins(
                  fontSize: height*0.035,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                  child: Container(
                      child: ListView(
                        children: List.generate(controller.bookedCamp.length, (index) {
                          Map<String, dynamic> mp = controller.bookedCamp[index]['book'];
                          DonationNgoModel model =DonationNgoModel.fromJson(mp);
                          log(model.name.toString() +  "-->");
                          return InkWell(
                            onTap: (){
                              Get.to(()=>BookedCampDetail(
                                model: model,
                              ));
                            },
                            child: Card(
                              surfaceTintColor: orangeColor.withOpacity(0.8),
                              child: ListTile(
                                leading: CircleAvatar(),
                                title: Text(controller.bookedCamp[index]['user']['name'],style: GoogleFonts.poppins(
                                  fontSize: height*0.03,
                                ),),
                                subtitle: Text(controller.bookedCamp[index]['user']['email'],style: GoogleFonts.poppins(
                                  fontSize: height*0.02,
                                  color: Colors.black26
                                ),),
                              ),
                            ),
                          );
                        }),
                      )),
                ),
                SizedBox(
                  height: height * 0.02,
                )
              ],
            ),
          ),
        ));
  }
}
