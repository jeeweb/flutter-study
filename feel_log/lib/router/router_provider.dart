import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:feel_log/router/router_constants.dart';
import 'package:feel_log/features/authentication/views/login_screen.dart';
import 'package:feel_log/features/authentication/views/signup_screen.dart';
import 'package:feel_log/features/main_navigation/main_navigation_screen.dart';
import 'package:feel_log/features/home/views/home_screen.dart';
import 'package:feel_log/features/post/views/post_screen.dart';
import 'package:feel_log/features/settings/settings_screen.dart';
import 'package:feel_log/features/user/views/user_profile_screen.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter route(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteURL.login,
    routes: [
      GoRoute(
        name: RouteNames.signUp,
        path: RouteURL.signUp,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        name: RouteNames.login,
        path: RouteURL.login,
        builder: (context, state) => LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainNavigationScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.home,
                path: RouteURL.home,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.post,
                path: RouteURL.post,
                builder: (context, state) => PostScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.settings,
                path: RouteURL.settings,
                builder: (context, state) => SettingsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.profile,
                path: RouteURL.profile,
                builder: (context, state) => UserProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
