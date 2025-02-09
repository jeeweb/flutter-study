import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/features/home/home_screen.dart';
import 'package:threads_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:threads_clone/features/search/search_screen.dart';
import 'package:threads_clone/features/write/write_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onWriteNavTap(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => WriteScreen(),
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        //_onWriteNavTap(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WriteScreen(),
            fullscreenDialog: true,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: HomeScreen(),
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
            isSelected: _selectedIndex == 0 || _selectedIndex == 2,
            icon: FontAwesomeIcons.house,
            onTap: () => _onTap(0),
          ),
          NavTab(
            isSelected: _selectedIndex == 1,
            icon: FontAwesomeIcons.magnifyingGlass,
            onTap: () => _onTap(1),
          ),
          NavTab(
            //isSelected: _selectedIndex == 2,
            isSelected: false,
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
