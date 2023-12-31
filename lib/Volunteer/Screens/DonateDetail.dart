import 'package:aid_up/Constants.dart';
// import 'package:aid_up/widgets/DescriptionText.dart';
// import 'package:aid_up/widgets/HeadingText.dart';
// import 'package:aid_up/widgets/IconWithText.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/DescriptionText.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DonateDetailScreen(),
    );
  }
}

class DonateDetailScreen extends StatefulWidget {
  @override
  _DonateDetailScreenState createState() => _DonateDetailScreenState();
}

class _DonateDetailScreenState extends State<DonateDetailScreen> {
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
                expandedHeight: height * 0.4,
                backgroundColor: Colors.white,
                elevation: 2,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(bottom: height * 0.3, top: height * 0.02),
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
                  Text(
                    "by Awaaz NGO",
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w300, fontSize: height * 0.018, color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Rs 28000",
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w600,
                            fontSize: height * 0.02,
                            color: orangeColor),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        "raised from Rs.40,000",
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w300,
                            fontSize: height * 0.018,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: height * 0.004,
                          // width: width * 0.6,
                          color: Colors.orange,
                        ),
                      ),
                      Container(
                        height: height * 0.002,
                        width: width * 0.4, // max value 0.91
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.groups_outlined,
                            color: orangeColor,
                            size: height * 0.028,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            "300 Donars",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w300,
                                fontSize: height * 0.018,
                                color: orangeColor),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: Colors.grey,
                            size: height * 0.025,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            "8 days left!",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w300,
                                fontSize: height * 0.017,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  DescriptionText(
                      "About NGO",
                      "Our NGO, called \"Awaaz,\" is dedicated to making a positive impact in our community and beyond. We believe that everyone has the power to create change, regardless of their age. We offer a wide range of volunteering opportunities suitable for people of all age groups.",
                      height,
                      width),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  DescriptionText(
                      "About cause:",
                      "Our NGO, called \"Awaaz,\" is dedicated to making a positive impact in our community and beyond. We believe that everyone has the power to create change.",
                      height,
                      width),
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
                        "Donate Now",
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
