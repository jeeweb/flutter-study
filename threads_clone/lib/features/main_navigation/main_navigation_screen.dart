import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/features/home/home_screen.dart';
import 'package:threads_clone/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: FaIcon(
          FontAwesomeIcons.threads,
          size: 48.0,
        ),
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(children: [
          NavTab(
            isSelected: _selectedIndex == 0,
            icon: FontAwesomeIcons.house,
            onTap: () => _onTap(0),
          ),
          NavTab(
            isSelected: _selectedIndex == 1,
            icon: FontAwesomeIcons.magnifyingGlass,
            onTap: () => _onTap(1),
          ),
          NavTab(
            isSelected: _selectedIndex == 2,
            icon: FontAwesomeIcons.penToSquare,
            onTap: () => _onTap(2),
          ),
          NavTab(
            isSelected: _selectedIndex == 3,
            icon: FontAwesomeIcons.heart,
            onTap: () => _onTap(3),
          ),
          NavTab(
            isSelected: _selectedIndex == 4,
            icon: FontAwesomeIcons.user,
            onTap: () => _onTap(4),
          ),
        ]),
      ),
    );
  }
}
