import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle titleBigger = GoogleFonts.workSans(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title = GoogleFonts.workSans(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500
  );

  static TextStyle questionTitle = GoogleFonts.workSans(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500
  );

  static TextStyle questionAlternative = GoogleFonts.workSans(
    color: Colors.black,
    fontSize: 14,
  );

  static Widget appBarTitle = Row(
    children: [
      Image.asset(
        'assets/logo.png',
        width: 40,
        height: 40,
      ),
      const SizedBox(width: 8),
      Text(
        'Fast',
        style: GoogleFonts.workSans(),
      ),
      const SizedBox(width: 4),
      Text(
        'Trivia',
        style: GoogleFonts.workSans(
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
