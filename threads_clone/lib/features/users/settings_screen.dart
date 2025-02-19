import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/features/users/privacy_screen.dart';

final settingsMenu = [
  {
    "title": "Follow and invite friends",
    "icon": FontAwesomeIcons.userPlus,
  },
  {
    "title": "Notifications",
    "icon": FontAwesomeIcons.bell,
  },
  {
    "title": "Privacy",
    "icon": FontAwesomeIcons.lock,
  },
  {
    "title": "Account",
    "icon": FontAwesomeIcons.circleUser,
  },
  {
    "title": "Help",
    "icon": FontAwesomeIcons.circleQuestion,
  },
  {
    "title": "About",
    "icon": FontAwesomeIcons.circleInfo,
  },
];

class SettingsScreen extends StatelessWidget {
  static const routeURL = "/settings";
  static const routeName = "settings";
  const SettingsScreen({super.key});

  void _onPrivacyTap(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => PrivacyScreen(),
    //   ),
    // );
    context.pushNamed(PrivacyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        surfaceTintColor: Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.userPlus,
              size: 18.0,
              color: Colors.black,
            ),
            title: Text(
              'Follow and invite friends',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.bell,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
            ),
          ),
          ListTile(
            onTap: () => _onPrivacyTap(context),
            leading: FaIcon(
              FontAwesomeIcons.lock,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Privacy',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.circleUser,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Account',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.circleQuestion,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Help',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.circleInfo,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            title: Text(
              'Log out',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue.shade600,
                letterSpacing: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
