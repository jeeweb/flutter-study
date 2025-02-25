import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

final routerProvider = Provider((ref) {
  ref.watch(authState); // router에서 authState stream 감지
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      // state 값에 따라 user를 어디로 redirect 시킬 지 정할 수 있음
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        // user가 Login 되었는지 확인 (firebase에게 currentUser가 있는지 확인)
        // user가 로그인되지 않았는데 signup 화면이나 로그인 화면이 아닌 곳으로 가려고 하면 signup 화면으로 보내기
        if (state.subloc != SignUpScreen.routeURL &&
            state.subloc != LoginScreen.routeURL) {
          return SignUpScreen.routeURL;
        }
        return null;
      }
      return null;
    },
    routes: [
      GoRoute(
        name: SignUpScreen.routeName,
        path: SignUpScreen.routeURL,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: InterestsScreen.routeName,
        path: InterestsScreen.routeURL,
        builder: (context, state) => const InterestsScreen(),
      ),
      GoRoute(
        name: MainNavigationScreen.routeName,
        path: "/home",
        builder: (context, state) => MainNavigationScreen(),
      ),
    ],
  );
});
