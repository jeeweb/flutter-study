import 'package:flutter/material.dart';
import 'package:twitter_onboarding/screens/initial_screen.dart';

void main() {
  runApp(const TwitterOnboarding());
}

class TwitterOnboarding extends StatelessWidget {
  const TwitterOnboarding({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFF4E98E9),
        indicatorColor: Color(0xFF111319),
        disabledColor: Color(0xFF87898B),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: false,
      ),
      home: InitialScreen(),
    );
  }
}
