import 'dart:math';

import 'package:flutter/material.dart';

class SwipingCardsScreen extends StatefulWidget {
  const SwipingCardsScreen({super.key});

  @override
  State<SwipingCardsScreen> createState() => _SwipingCardsScreenState();
}

class _SwipingCardsScreenState extends State<SwipingCardsScreen>
    with SingleTickerProviderStateMixin {
  late final size = MediaQuery.of(context).size;

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 2000),
    lowerBound: (size.width + 100) * -1,
    upperBound: (size.width + 100),
    value: 0.0,
  );

  late final Tween<double> _rotation = Tween(
    begin: -15,
    end: 15,
  );

  late final Tween<double> _scale = Tween(
    begin: 0.8,
    end: 1,
  );

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _animationController.value += details.delta.dx;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    // print(_animationController.value.abs());  // 카드가 움직인 값
    // print(size.width - 100);  // 카드를 사라지게 할 기준점. 해당 기준점보다 카드가 더 움직이면 사라지도록 하기

    final bound = size.width - 200;
    final dropZone = size.width + 200;

    if (_animationController.value.abs() >= bound) {
      if (_animationController.value.isNegative) {
        _animationController.animateTo(dropZone * -1);
      } else {
        _animationController.animateTo(dropZone);
      }
    } else {
      _animationController.animateTo(0, curve: Curves.bounceOut);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swiping Cards'),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          final angle = _rotation.transform(
              (_animationController.value + size.width / 2) / size.width);
          //print(angle);
          final scale =
              _scale.transform(_animationController.value.abs() / size.width);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 100,
                child: Transform.scale(
                  scale: scale,
                  child: Material(
                    elevation: 10,
                    color: Colors.blue.shade100,
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                child: GestureDetector(
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  onHorizontalDragEnd:
                      _onHorizontalDragEnd, // 사용자가 카드를 가로로 드래그 할 때 호출
                  child: Transform.translate(
                    offset: Offset(_animationController.value, 0),
                    child: Transform.rotate(
                      angle: angle * pi / 180,
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
