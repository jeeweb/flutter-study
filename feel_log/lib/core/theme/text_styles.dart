import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FLTextStyles {
  static TextStyle headlineBK = GoogleFonts.afacad(
    fontSize: 44.0,
    fontWeight: FontWeight.w400,
    color: Color(0xFF010101),
  );

  static TextStyle headlineWH = GoogleFonts.afacad(
    fontSize: 44.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle inputLabel = GoogleFonts.afacad(
    color: Color(0xFF010101),
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle inputHint = TextStyle(
    fontSize: 14.0,
    color: Color(0xFFC4C4C4),
  );

  static const TextStyle infoText = TextStyle(
    color: Color(0xFF010101),
    fontSize: 18.0,
  );

  static const TextStyle infoTextBold = TextStyle(
    color: Color(0xFF010101),
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle infoTextEng = GoogleFonts.afacad(
    color: Color(0xFF010101),
    fontSize: 18.0,
  );

  static TextStyle infoTextBoldEng = GoogleFonts.afacad(
    color: Color(0xFF010101),
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
}
