import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FLLogo extends StatelessWidget {
  final bool isAuth;

  const FLLogo({super.key, required this.isAuth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Feel",
          style: GoogleFonts.borel(
            fontSize: isAuth ? 60.0 : 36.0,
            height: 2.2,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Text(
          "Log",
          style: GoogleFonts.afacad(
            fontSize: isAuth ? 64.0 : 40.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            height: 1.3,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
