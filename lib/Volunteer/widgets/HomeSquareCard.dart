import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget HomeCard(double height, double width, String text, String title, String pic) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.all(5),
        // height: width * 0.26,
        width: width * 0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.25), blurRadius: 8)],
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.dmSans(fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.1,
                // width: width * 0.3,
                child: Image(
                  image: AssetImage(
                    pic,
                  ),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: height * 0.01,
      ),
      Text(
        title,
        style: GoogleFonts.dmSans(fontWeight: FontWeight.w600, fontSize: height * 0.022),
      ),
    ],
  );
}
