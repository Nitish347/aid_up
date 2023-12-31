import 'package:aid_up/Constants.dart';
// import 'package:aid_up/widgets/DescriptionText.dart';
// import 'package:aid_up/widgets/HeadingText.dart';
// import 'package:aid_up/widgets/IconWithText.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/DescriptionText.dart';
import '../widgets/HeadingText.dart';
import '../widgets/IconWithText.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CampDetailScreen(),
    );
  }
}

class CampDetailScreen extends StatefulWidget {
  @override
  _CampDetailScreenState createState() => _CampDetailScreenState();
}

class _CampDetailScreenState extends State<CampDetailScreen> {
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
                          Icon(
                            Icons.arrow_back_outlined,
                            color: _isScrolledUp ? Colors.black : Colors.white,
                            size: _isScrolledUp ? height * 0.035 : height * 0.025,
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
                        "Pankh NGO",
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
                              HeadingText("Subject", "Maths", height, width),
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
                              IconWithText(height, Icons.location_on_sharp, "Mahagun Puram"),
                              IconWithText(height, Icons.calendar_month, "Every Sunday"),
                              IconWithText(height, Icons.watch_later_outlined, "9 am"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  DescriptionText(
                      "Description",
                      "Our NGO, called \"PANKH,\" is dedicated to making a positive impact in our community and beyond. We believe that everyone has the power to create change, regardless of their age. We offer a wide range of volunteering opportunities suitable for people of all age groups.",
                      height,
                      width),
                  Text(
                    "Responsibility: ",
                    style: GoogleFonts.dmSans(
                        fontSize: height * 0.022, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  BulletedList(
                    listItems: _responsibilty,
                    listOrder: ListOrder.ordered,
                    bulletColor: Colors.black,
                    style: GoogleFonts.dmSans(
                        fontSize: height * 0.02, color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Select Donation Type: ",
                    style: GoogleFonts.dmSans(
                        fontSize: height * 0.022, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _clothesChecked,
                            checkColor: Colors.white,
                            activeColor: orangeColor,
                            onChanged: (value) {
                              setState(() {
                                _clothesChecked = value!;
                              });
                            },
                          ),
                          Text(
                            "Clothes",
                            style: GoogleFonts.dmSans(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _booksAndStationeryChecked,
                            checkColor: Colors.white,
                            activeColor: orangeColor,
                            onChanged: (value) {
                              setState(() {
                                _booksAndStationeryChecked = value!;
                              });
                            },
                          ),
                          Text(
                            "Books & Stationery",
                            style: GoogleFonts.dmSans(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _foodChecked,
                            checkColor: Colors.white,
                            activeColor: orangeColor,
                            onChanged: (value) {
                              setState(() {
                                _foodChecked = value!;
                              });
                            },
                          ),
                          Text(
                            "Food",
                            style: GoogleFonts.dmSans(
                                fontSize: height * 0.02,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
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
