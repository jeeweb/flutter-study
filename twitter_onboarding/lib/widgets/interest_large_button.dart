import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterestLargeButton extends StatefulWidget {
  const InterestLargeButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestLargeButton> createState() => _InterestLargeButtonState();
}

class _InterestLargeButtonState extends State<InterestLargeButton> {
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
        child: FractionallySizedBox(
          widthFactor: 0.43,
          child: SizedBox(
            height: 68.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  FontAwesomeIcons.solidCircleCheck,
                  color: Colors.white,
                  size: 18.0,
                ),
                Text(
                  widget.interest,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
