import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTabButton extends StatelessWidget {
  const NavTabButton(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.icon,
      required this.selectedIcon,
      required this.onTap,
      required this.selectedIndex});

  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedOpacity(
          duration: Duration(
            milliseconds: 300,
          ),
          opacity: isSelected ? 1 : 0.6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                isSelected ? selectedIcon : icon,
                color: Colors.black,
              ),
              SizedBox(height: 5.0),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
