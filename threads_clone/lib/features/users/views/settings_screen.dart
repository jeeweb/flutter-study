import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/features/users/view_models/theme_config_vm.dart';
import 'package:threads_clone/features/users/views/privacy_screen.dart';

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

class SettingsScreen extends ConsumerWidget {
  static const routeURL = "/settings";
  static const routeName = "settings";
  const SettingsScreen({super.key});

  void _onPrivacyTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PrivacyScreen(),
      ),
    );
    //context.pushNamed(PrivacyScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final isDark = isDarkMode(context);
    final isDark = ref.watch(ThemeConfigProvider).darkTheme;
    print(isDark);

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: isDark ? Colors.black : Colors.white,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : Colors.black,
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
              color: isDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'Follow and invite friends',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.bell,
              size: 24.0,
              color: isDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          ListTile(
            onTap: () => _onPrivacyTap(context),
            leading: FaIcon(
              FontAwesomeIcons.lock,
              size: 24.0,
              color: isDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'Privacy',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.circleUser,
              size: 24.0,
              color: isDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'Account',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.circleQuestion,
              size: 24.0,
              color: isDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'Help',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: FaIcon(
              FontAwesomeIcons.circleInfo,
              size: 24.0,
              color: isDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          SwitchListTile.adaptive(
            value: ref.watch(ThemeConfigProvider).darkTheme,
            onChanged: (value) =>
                ref.read(ThemeConfigProvider.notifier).setDarkTheme(value),
            title: Text(
              "Change Theme",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            subtitle: Text(
              isDark ? "Change to Light Theme" : "Change to Dark Theme",
              style: TextStyle(
                color: isDark
                    ? Color.fromRGBO(255, 255, 255, 0.5)
                    : Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
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
