import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

List<Color> colors = [
  Colors.purple,
  Colors.black,
  Colors.blue,
];

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
              for (var index in [0, 1, 2])
                Hero(
                  tag: "$index",
                  child: CreditCard(
                    index: index,
                    isExpanded: _isExpanded,
                  )
                      .animate(
                        target: _isExpanded ? 0 : 1,
                        delay: 1.5.seconds,
                      )
                      .flipV(end: 0.1)
                      .slideY(
                        end: -0.8 * index,
                      ),
                ),
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

class CreditCard extends StatefulWidget {
  final int index;
  final bool isExpanded;

  const CreditCard({super.key, required this.index, required this.isExpanded});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  void _onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardDetailScreen(index: widget.index),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: AbsorbPointer(
        absorbing: !widget.isExpanded,
        child: GestureDetector(
          onTap: _onTap,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors[widget.index],
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
          ),
        ),
      ),
    );
  }
}

class CardDetailScreen extends StatelessWidget {
  final int index;
  const CardDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transactions')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Hero(
              tag: "$index",
              child: CreditCard(
                index: index,
                isExpanded: false,
              ),
            ),
            ...[
              // 아래 항목들에 적용한 애니메이션이 위의 hero에도 영향을 주는 것을 막기위해 Column의 자식 목록 안에 목록을 별도로 만들어줌
              for (var i in [1, 1, 1, 1])
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    tileColor: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "Uniqlo",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "Gangnam Branch",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    trailing: const Text(
                      "\$452,895",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ].animate(interval: 500.ms).fadeIn(begin: 0).flipV(
                  begin: -0.8,
                  end: 0,
                  curve: Curves.bounceOut,
                ),
          ],
        ),
      ),
    );
  }
}
