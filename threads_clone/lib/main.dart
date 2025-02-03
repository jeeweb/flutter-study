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
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MainNavigationScreen(),
    );
  }
}
