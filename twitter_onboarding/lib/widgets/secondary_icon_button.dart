import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondaryIconButton extends StatelessWidget {
  final String text;
  final FaIcon icon;

  const SecondaryIconButton(
      {super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade400,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(
              36.0,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 18.0,
              ),
              child: icon,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
