import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget DescriptionText(String heading, String text, double height, double width) {
  return Container(
    width: width,
    height: text.length > 300 ? height * 0.3 : height * 0.2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading + ": ",
          style: GoogleFonts.dmSans(
              fontSize: height * 0.022, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.dmSans(
                fontSize: height * 0.02, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
