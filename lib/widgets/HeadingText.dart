import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget HeadingText(String heading, String text, double height, double width) {
  return Row(
    children: [
      Text(
        heading + ": ",
        style: GoogleFonts.dmSans(
            fontSize: height * 0.022, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      SizedBox(
        width: width * 0.02,
      ),
      Expanded(
        child: Text(
          text,
          style: GoogleFonts.dmSans(
              fontSize: height * 0.02, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
    ],
  );
}
