import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget IconWithText(double height, IconData icon, String text,double width) {
  return Row(
    children: [
      Icon(
        icon,
        size: height * 0.028,
        color: Colors.black,
      ),
      SizedBox(
        width: 2,
      ),
      Container(
        width: width*0.3,
        child: Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: GoogleFonts.dmSans(fontWeight: FontWeight.w400, fontSize: height * 0.02),
          ),
        ),
      ),
    ],
  );
}
