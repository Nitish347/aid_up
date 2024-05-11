

import 'package:aid_up/Constants.dart';
import 'package:aid_up/model/DonationNGO.dart';
// import 'package:aid_up/widgets/DescriptionText.dart';
// import 'package:aid_up/widgets/HeadingText.dart';
// import 'package:aid_up/widgets/IconWithText.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Firestore/Volunteer/FirebaseVUser.dart';
import '../../../Volunteer/widgets/DescriptionText.dart';
import '../../../Volunteer/widgets/IconWithText.dart';



class BookedCampDetail extends StatefulWidget {
  DonationNgoModel model;
  BookedCampDetail({required this.model});
  @override
  _BookedCampDetailState createState() => _BookedCampDetailState();
}

class _BookedCampDetailState extends State<BookedCampDetail> {
  ScrollController _scrollController = ScrollController();
  bool _isScrolledUp = false;
  bool _loading = false;
  List _responsibilty = [
    "Prepare and Deliver",
    "Lessons Evaluate student progress through quizzes, tests, and assignments.",
    "Offer one-on-one or small group support",
    "Classroom Management"
  ];
  bool _clothesChecked = false;
  bool _booksAndStationeryChecked = false;
  bool _foodChecked = false;
  bool _money = false;
  bool _medical = false;

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
                            onTap: () => Get.back(),
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
                          InkWell(
                            onTap: (){
                              launch("tel:${widget.model.phone ?? ""}");
                            },
                            child: CircleAvatar(
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
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          InkWell(
                            onTap: (){
                              FocusManager.instance.primaryFocus?.unfocus();

                              var whatsappUrl =
                                  "whatsapp://send?phone=+91${widget.model.phone ?? ""}";
                              try {
                                launchUrl(Uri.parse(whatsappUrl));
                              } catch (e) {
                                print(e.toString());
                                //To handle error and display error message
                                // Helper.errorSnackBar(
                                //     context: context, message: "Unable to open whatsapp");
                              }
                            },
                            child: CircleAvatar(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.4,
                          alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.spa,
                            children: [
                              IconWithText(height, Icons.location_on_sharp, widget.model.address!,width),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              IconWithText(height, Icons.watch_later_outlined, widget.model.time!,width),
                            ],
                          ),
                        ),
                        IconWithText(height, Icons.calendar_month, "Every Sunday",width),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _clothesChecked,
                                  checkColor: Colors.white,
                                  activeColor: orangeColor,
                                  onChanged: (value) {
                                    if (widget.model.donationType![0]["clothes"]) {
                                      setState(() {
                                        _clothesChecked = value!;
                                      });
                                    }
                                  },
                                ),
                                FittedBox(
                                  child: Text(
                                    "Clothes",
                                    style: GoogleFonts.dmSans(
                                      // fontSize: height * 0.015,
                                        fontWeight: FontWeight.w400,
                                        color: widget.model.donationType![0]["clothes"]
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
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
                                      if (widget.model.donationType![0]["books"])
                                        _booksAndStationeryChecked = value!;
                                    });
                                  },
                                ),
                                FittedBox(
                                  child: Text(
                                    "Books & Stationery",
                                    style: GoogleFonts.dmSans(
                                      // fontSize: height * 0.02,
                                        fontWeight: FontWeight.w400,
                                        color: widget.model.donationType![0]["books"]
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _medical,
                                  checkColor: Colors.white,
                                  activeColor: orangeColor,
                                  onChanged: (value) {
                                    if (widget.model.donationType![0]["medical"])
                                      setState(() {
                                        _medical = value!;
                                      });
                                  },
                                ),
                                FittedBox(
                                  child: Text(
                                    "Medical",
                                    style: GoogleFonts.dmSans(
                                      // fontSize: height * 0.015,
                                        fontWeight: FontWeight.w400,
                                        color: widget.model.donationType![0]["medical"]
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: _money,
                                  checkColor: Colors.white,
                                  activeColor: orangeColor,
                                  onChanged: (value) {
                                    setState(() {
                                      if (widget.model.donationType![0]["money"]) _money = value!;
                                    });
                                  },
                                ),
                                FittedBox(
                                  child: Text(
                                    "Money",
                                    style: GoogleFonts.dmSans(
                                      // fontSize: height * 0.02,
                                        fontWeight: FontWeight.w400,
                                        color: widget.model.donationType![0]["money"]
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                          if (widget.model.donationType![0]["food"])
                            setState(() {
                              _foodChecked = value!;
                            });
                        },
                      ),
                      FittedBox(
                        child: Text(
                          "Food",
                          style: GoogleFonts.dmSans(
                            // fontSize: height * 0.02,
                              fontWeight: FontWeight.w400,
                              color: widget.model.donationType![0]["food"]
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: height * 0.1,
                  )
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
