import 'package:flutter/cupertino.dart';
import 'package:tiktok_clone/features/%08main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'TickTok Clone',
      home: MainNavigationScreen(),
    );
  }
}
