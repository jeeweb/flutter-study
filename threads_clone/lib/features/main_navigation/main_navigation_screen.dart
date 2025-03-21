import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/features/activity/activity_screen.dart';
import 'package:threads_clone/features/home/views/home_screen.dart';
import 'package:threads_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:threads_clone/features/search/search_screen.dart';
import 'package:threads_clone/features/users/views/profile_screen.dart';
import 'package:threads_clone/features/write/views/write_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final Widget child;
  const MainNavigationScreen({super.key, required this.child});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

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

    switch (index) {
      case 0:
        context.go(HomeScreen.routeURL);
        break;
      case 1:
        context.go(SearchScreen.routeURL);
        break;
      case 3:
        context.go(ActivityScreen.routeURL);
        break;
      case 4:
        context.go(ProfileScreen.routeURL);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: ProfileScreen(),
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
