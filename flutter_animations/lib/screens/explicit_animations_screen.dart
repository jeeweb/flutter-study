import 'dart:async';

import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatefulWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  State<ExplicitAnimationsScreen> createState() =>
      _ExplicitAnimationsScreenState();
}

class _ExplicitAnimationsScreenState extends State<ExplicitAnimationsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 10),
  );

  void _play() {
    _animationController.forward();
  }

  void _pause() {
    _animationController.stop();
  }

  void _rewind() {
    _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      // _animationController.value 를 출력해서 애니메이션이 실제로 실행되고 있음을 확인하기
      print(_animationController.value);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "build"); // build가 몇 번 호출되는지 확인 가능 -> 한번만 호출됨. AnimatedBuilder의 builder 부분만 rebuild 됨
    return Scaffold(
      appBar: AppBar(
        title: Text("Explicit Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                /*
                return Text(
                  "${_animationController.value}",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                );
                */
                return Opacity(
                  opacity: _animationController.value,
                  child: Container(
                    color: Colors.amber,
                    width: 400,
                    height: 400,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _play,
                  child: Text("Play"),
                ),
                ElevatedButton(
                  onPressed: _pause,
                  child: Text("Pause"),
                ),
                ElevatedButton(
                  onPressed: _rewind,
                  child: Text("Rewind"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
