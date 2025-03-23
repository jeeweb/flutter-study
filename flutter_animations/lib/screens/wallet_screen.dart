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
        child: Text(
          'Hello!',
          style: TextStyle(
            fontSize: 66,
          ),
        )
            .animate()
            .fadeIn(
              begin: 0,
              duration: 1.seconds,
            )
            .scale(
              alignment: Alignment.center,
              begin: Offset.zero,
              duration: 1.seconds,
              end: Offset(1, 1),
            )
            .then(delay: 2.seconds)
            .slideX(
              begin: 0,
              end: -10,
              duration: 1.seconds,
            ),
      ),
    );
  }
}
