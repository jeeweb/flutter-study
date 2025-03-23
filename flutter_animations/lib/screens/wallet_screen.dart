import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _isExpanded = false;

  void _onExpanded() {
    setState(() {
      _isExpanded = true;
    });
  }

  void _onShrink() {
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: GestureDetector(
          onVerticalDragEnd: (_) => _onShrink(),
          onTap: _onExpanded,
          child: Column(
            /* AnimateList widget으로 인터벌 애니메이션 구현하기
            children: AnimateList(
              interval: 500.ms,
              effects: [
                SlideEffect(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ),
                FadeEffect(
                  begin: 0,
                  end: 1,
                ),
              ],
              children: [
                CreditCard(bgColor: Colors.purple),
                CreditCard(bgColor: Colors.black),
                CreditCard(bgColor: Colors.blue),
              ],
            ),
            */
            // chaining으로 애니메이션 구현하기
            children: [
              CreditCard(bgColor: Colors.purple)
                  .animate(
                    target: _isExpanded ? 0 : 1,
                    delay: 1.5.seconds,
                  )
                  .flipV(end: 0.1),
              CreditCard(bgColor: Colors.black)
                  .animate(
                    target: _isExpanded ? 0 : 1,
                    delay: 1.5.seconds,
                  )
                  .flipV(end: 0.1)
                  .slideY(end: -0.8),
              CreditCard(bgColor: Colors.blue)
                  .animate(
                    target: _isExpanded ? 0 : 1,
                    delay: 1.5.seconds,
                  )
                  .flipV(end: 0.1)
                  .slideY(end: -0.8 * 2),
            ].animate(interval: 500.ms).fadeIn(begin: 0).slideX(
                  begin: -1,
                  end: 0,
                ),
          ),
        ),
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  final Color bgColor;

  const CreditCard({super.key, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 40,
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nomad Coders',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '**** **** **75',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
