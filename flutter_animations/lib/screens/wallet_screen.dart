import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Center(
        // 처음 등장할때 애니메이션 실행
        child: Animate(
          effects: [
            FadeEffect(
              begin: 0,
              end: 1,
              //duration: Duration(milliseconds: 500),
              duration: 1.seconds,
              curve: Curves.easeInCubic,
            ),
            ScaleEffect(
              alignment: Alignment.center,
              begin: Offset.zero,
              end: Offset(1, 1),
              duration: 500.ms,
            ),
          ],
          child: Text(
            'Hello!',
            style: TextStyle(
              fontSize: 66,
            ),
          ),
        ),
      ),
    );
  }
}
