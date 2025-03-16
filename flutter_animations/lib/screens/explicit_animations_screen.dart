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
  )..addListener(() {
      setState(() {});
    });

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
    /*
    // ticker가 실행되는걸 확인할 수 있음
    Ticker(
      (elapsed) => print(elapsed),
    ).start();
    */
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Explicit Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_animationController.value}",
              style: TextStyle(
                fontSize: 28,
              ),
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
