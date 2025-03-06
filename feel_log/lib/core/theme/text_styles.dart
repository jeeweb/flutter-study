import 'package:flutter/material.dart';

abstract class FLTextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 44.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle inputLabel = TextStyle(
    color: Color(0xFF010101),
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle inputHint = TextStyle(
    fontSize: 18.0,
    color: Color(0xFFD2D2D2),
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
}
