import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/utils.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  });

  final bool isSelected;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedOpacity(
          duration: Duration(
            milliseconds: 300,
          ),
          opacity: !isSelected
              ? isDark
                  ? 0.4
                  : 0.2
              : 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                color: Theme.of(context).iconTheme.color,
                size: 26.00,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
