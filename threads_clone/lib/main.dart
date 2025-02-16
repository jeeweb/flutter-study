import 'package:flutter/material.dart';
import 'package:threads_clone/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Threads Clone',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        //useMaterial3: true,
        textTheme: Typography.blackMountainView,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.white,
        ),
      ),
      home: MainNavigationScreen(),
    );
  }
}
