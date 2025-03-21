import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FLPrimaryButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onTap;

  const FLPrimaryButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
            color: Color(0xFF010101),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            )),
        child: Center(
            child: Text(
          buttonText,
          style: GoogleFonts.afacad(
            color: Color.fromRGBO(255, 255, 255, 0.9),
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
