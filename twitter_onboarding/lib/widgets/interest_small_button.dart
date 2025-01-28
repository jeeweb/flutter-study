import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterestSmallButton extends StatefulWidget {
  const InterestSmallButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestSmallButton> createState() => _InterestSmallButtonState();
}

class _InterestSmallButtonState extends State<InterestSmallButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          border: Border.all(
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
          borderRadius: BorderRadius.circular(
            16.0,
          ),
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
