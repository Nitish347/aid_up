import 'package:aid_up/Constants.dart';
import 'package:aid_up/NGO/Screens/booked/booked_teach.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'booked_camp.dart';
class BookedScreen extends StatefulWidget {
  const BookedScreen({super.key});

  @override
  State<BookedScreen> createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body:  Expanded(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
              bottom: TabBar(
                unselectedLabelStyle: GoogleFonts.poppins(
                    fontSize:height*0.022,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
                labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500,color: orangeColor),
                indicatorColor: orangeColor,
                tabs: const [
                  Tab(
                    text: "Booked Camp",
                  ),
                  Tab(text: 'Booked Teach'),

                ],
              ),
            ),


            body: TabBarView(
              children: [
                BookedCamp(),
                BookedTeach()
              ],
            ),
          ),
        ),
      )
    );
  }
}
