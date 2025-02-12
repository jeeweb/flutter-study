import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        surfaceTintColor: Colors.white,
        title: Text(
          "Privacy",
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
              FontAwesomeIcons.lock,
              size: 18.0,
              color: Colors.black,
            ),
            title: Text(
              'Private profile',
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
              FontAwesomeIcons.at,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Mentions',
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
              FontAwesomeIcons.bellSlash,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Muted',
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
              FontAwesomeIcons.eyeSlash,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Hidden Words',
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
              FontAwesomeIcons.users,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Profiles you follow',
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
            onTap: () {},
            title: Text(
              'Other privacy settings',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
              ),
            ),
            subtitle: Text(
                "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram."),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.circleXmark,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Blocked profiles',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 0.1,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.heartCircleMinus,
              size: 24.0,
              color: Colors.black,
            ),
            title: Text(
              'Hide likes',
              style: TextStyle(
                fontSize: 18.0,
                letterSpacing: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
