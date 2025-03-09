import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SizedBox(
        width: 200.0,
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => _onTap(context, index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.thoughtBubbleOutline),
              activeIcon: Icon(MdiIcons.thoughtBubble),
              label: "Feed",
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.pencilOutline),
              activeIcon: Icon(MdiIcons.pencil),
              label: "Log",
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.cogOutline),
              activeIcon: Icon(MdiIcons.cog),
              label: "Settings",
            )
            // BottomNavigationBarItem(
            //   icon: Icon(MdiIcons.accountOutline),
            //  activeIcon: Icon(MdiIcons.account),
            //   label: "Profile",
            // )
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(index, initialLocation: index == 0);
  }
}
