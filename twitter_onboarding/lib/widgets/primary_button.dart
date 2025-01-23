import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final bool isDiabled;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.isPrimary,
    required this.isDiabled,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 600,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          decoration: BoxDecoration(
              color: isPrimary && !isDiabled
                  ? Theme.of(context).primaryColor
                  : !isPrimary && !isDiabled
                      ? Theme.of(context).indicatorColor
                      : Theme.of(context).disabledColor,
              borderRadius: BorderRadius.circular(
                36.0,
              )),
          child: AnimatedDefaultTextStyle(
            duration: Duration(
              milliseconds: 500,
            ),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w800,
              color: isDiabled ? Color(0xFFBFC3C6) : Colors.white,
              letterSpacing: 0.1,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
