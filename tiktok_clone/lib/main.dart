import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/features/videos/repos/playback_config_repo.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/router.dart';
import 'package:tiktok_clone/constants/sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = PlaybackConfigRepository(preferences);

  runApp(ProviderScope(overrides: [
    PlaybackConfigProvider.overrideWith(
        () => PlaybackConfigViewModel(repository))
  ], child: TikTokApp()));
}

class TikTokApp extends ConsumerWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'TickTok Clone',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        textTheme: Typography.blackMountainView,
        brightness: Brightness.light, // 컬러를 별도로 지정하지 않은 텍스트들에 적용되는 기본 텍스트 컬러
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFFE9435A),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A), // 커서 색상
          //selectionColor: Color(0xFFE9435A) // 드래그 블록 색상
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade50,
        ),
        splashColor: Colors.transparent, // tab 할때 splash 효과 컬러
        highlightColor: Colors.transparent, // long press 할 때 효과 컬러
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black, // 활성화된 탭의 label 폰트컬러
          unselectedLabelColor: Colors.grey.shade500, // 비활성화된 탭의 label 폰트 컬러
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.black,
        ),
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Color(0xFFE9435A),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A), // 커서 색상
          //selectionColor: Color(0xFFE9435A) // 드래그 블록 색상
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        tabBarTheme: TabBarTheme(
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white,
        ),
        useMaterial3: false,
      ),
    );
  }
}
