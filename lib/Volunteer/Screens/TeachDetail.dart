import 'package:aid_up/Constants.dart';
import 'package:aid_up/model/DonationNGO.dart';
import 'package:aid_up/model/TeachingModel.dart';
// import 'package:aid_up/widgets/DescriptionText.dart';
// import 'package:aid_up/widgets/HeadingText.dart';
// import 'package:aid_up/widgets/IconWithText.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/DescriptionText.dart';
import '../widgets/HeadingText.dart';
import '../widgets/IconWithText.dart';

class TeachCampDetailScreen extends StatefulWidget {
  TeachiingNgoModel model;
  TeachCampDetailScreen({required this.model});
  @override
  _TeachCampDetailScreenState createState() => _TeachCampDetailScreenState();
}

class _TeachCampDetailScreenState extends State<TeachCampDetailScreen> {
  ScrollController _scrollController = ScrollController();
  bool _isScrolledUp = false;
  List _responsibilty = [
    "Prepare and Deliver",
    "Lessons Evaluate student progress through quizzes, tests, and assignments.",
    "Offer one-on-one or small group support",
    "Classroom Management"
  ];
  bool _clothesChecked = false;
  bool _booksAndStationeryChecked = false;
  bool _foodChecked = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    setState(() {
      _isScrolledUp = _scrollController.position.userScrollDirection == ScrollDirection.reverse;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: height * 0.4,
                backgroundColor: Colors.white,
                elevation: 2,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(bottom: height * 0.3, top: height * 0.05),
                    centerTitle: true,
                    title: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_outlined,
                              color: _isScrolledUp ? Colors.black : Colors.white,
                              size: _isScrolledUp ? height * 0.035 : height * 0.025,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Icon(
                                  Icons.bookmark_border,
                                  color: _isScrolledUp ? Colors.black : Colors.white,
                                  size: _isScrolledUp ? height * 0.035 : height * 0.025,
                                ),
                              ),
                              Icon(
                                Icons.share,
                                color: _isScrolledUp ? Colors.black : Colors.white,
                                size: _isScrolledUp ? height * 0.035 : height * 0.025,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    background: Stack(
                      children: [
                        Container(
                          height: height * 0.4,
                          child: Image(
                            image: AssetImage(
                              'assets/images/children.png',
                            ),
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        Container(
                          height: height * 0.4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.only(top: height * 0.03, left: width * 0.045, right: width * 0.045),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: _isScrolledUp,
                    child: SizedBox(
                      height: height * 0.07,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.model.name!,
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600, fontSize: height * 0.032),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: height * 0.022,
                            backgroundColor: orangeColor,
                            child: Center(
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: height * 0.022,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          CircleAvatar(
                            radius: height * 0.022,
                            backgroundColor: orangeColor,
                            child: Center(
                              child: Icon(
                                Icons.messenger,
                                color: Colors.white,
                                size: height * 0.022,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.12,
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              HeadingText("Subject", widget.model.subject!, height, width),
                              SizedBox(
                                height: height * 0.005,
                              ),
                              HeadingText("Age Group", "10-15 years old", height, width),
                            ],
                          ),
                        ),
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconWithText(height, Icons.location_on_sharp, widget.model.address!),
                              IconWithText(height, Icons.calendar_month, "Every Sunday"),
                              IconWithText(height, Icons.watch_later_outlined, widget.model.time!),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  DescriptionText("Description", widget.model.desc!, height, width),
                  Text(
                    "Responsibility: ",
                    style: GoogleFonts.dmSans(
                        fontSize: height * 0.022, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  BulletedList(
                    listItems: widget.model.rules!,
                    listOrder: ListOrder.ordered,
                    bulletColor: Colors.black,
                    style: GoogleFonts.dmSans(
                        fontSize: height * 0.02, color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width,
                    child: Container(
                      width: width * 0.4,
                      height: height * 0.05,
                      alignment: Alignment.center,
                      decoration:
                          BoxDecoration(color: blueColor, borderRadius: BorderRadius.circular(32)),
                      child: Text(
                        "Book",
                        style: GoogleFonts.dmSans(fontSize: height * 0.022, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
