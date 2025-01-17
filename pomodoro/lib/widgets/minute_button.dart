import 'package:flutter/material.dart';

class MinuteButton extends StatefulWidget {
  final int min;

  const MinuteButton({
    super.key,
    required this.min,
  });

  @override
  State<MinuteButton> createState() => _MinuteButtonState();
}

class _MinuteButtonState extends State<MinuteButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isSelected ? Colors.white : Color.fromRGBO(255, 255, 255, 0.2),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      width: 72,
      height: 50,
      child: Text(
        '${widget.min}',
        style: TextStyle(
          color: isSelected
              ? Theme.of(context).scaffoldBackgroundColor
              : Color.fromRGBO(255, 255, 255, 0.6),
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
