import 'package:flutter/material.dart';

class SwipingCardsScreen extends StatefulWidget {
  const SwipingCardsScreen({super.key});

  @override
  State<SwipingCardsScreen> createState() => _SwipingCardsScreenState();
}

class _SwipingCardsScreenState extends State<SwipingCardsScreen> {
  double posX = 0;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    //print(details); // 카드를 드래그하면 Offset 정보가 콘솔에 표시됨
    //print(details.delta.dx);  // 포인터가 움직인 양을 콘솔에 표기
    setState(() {
      posX += details.delta.dx; // 사용자가 드래그할 때 얻은 모든 변화량 누적
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      posX = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Swiping Cards'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onHorizontalDragUpdate: _onHorizontalDragUpdate,
              onHorizontalDragEnd:
                  _onHorizontalDragEnd, // 사용자가 카드를 가로로 드래그 할 때 호출
              child: Transform.translate(
                offset: Offset(posX, 0),
                child: Material(
                  elevation: 10,
                  color: Colors.red.shade100,
                  child: SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.5,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
