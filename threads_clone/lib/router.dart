import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/features/activity/activity_screen.dart';
import 'package:threads_clone/features/home/home_screen.dart';
import 'package:threads_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:threads_clone/features/search/search_screen.dart';
import 'package:threads_clone/features/users/views/privacy_screen.dart';
import 'package:threads_clone/features/users/views/profile_screen.dart';
import 'package:threads_clone/features/users/views/settings_screen.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: HomeScreen.routeURL,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) {
        return NoTransitionPage(child: MainNavigationScreen(child: child));
      },
      routes: [
        GoRoute(
          path: HomeScreen.routeURL,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: SearchScreen.routeURL,
          builder: (context, state) => SearchScreen(),
        ),
        GoRoute(
          path: ActivityScreen.routeURL,
          builder: (context, state) => ActivityScreen(),
        ),
        GoRoute(
          path: ProfileScreen.routeURL,
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(
          path: SettingsScreen.routeURL,
          name: SettingsScreen.routeName,
          builder: (context, state) => SettingsScreen(),
          routes: [
            GoRoute(
              path: PrivacyScreen.routeURL,
              name: PrivacyScreen.routeName,
              builder: (context, state) => PrivacyScreen(),
            )
          ],
        ),
      ],
    ),
  ],
);
