import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CustomPainterPomodoro extends StatefulWidget {
  const CustomPainterPomodoro({super.key});

  @override
  State<CustomPainterPomodoro> createState() => _CustomPainterPomodoroState();
}

class _CustomPainterPomodoroState extends State<CustomPainterPomodoro>
    with SingleTickerProviderStateMixin {
  Timer? timer;
  static const int initSec = 15 * 60;
  int sec = initSec;

  bool isRunning = false;
  bool isStop = false;

  void onTick(Timer? timer) {
    sec -= 1;
    if (sec == 0) {
      timer?.cancel();
      _onStop();
    }
    setState(() {});
  }

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: sec),
  );

  late Animation<double> _progress = Tween(
    begin: 0.0,
    end: 2.0,
  ).animate(_animationController);

  void _onPlay() {
    if (isStop) {
      sec = initSec;
    }
    timer = Timer.periodic(Duration(seconds: 1), onTick);
    _progress = Tween(
      begin: isStop ? 0.0 : _progress.value,
      end: 2.0,
    ).animate(_animationController);
    _animationController.duration = Duration(seconds: sec);
    _animationController.forward(from: 0);
    isRunning = true;
    isStop = false;
    setState(() {});
  }

  void _onPause() {
    timer?.cancel();
    isRunning = false;
    isStop = false;
    _animationController.stop();
    setState(() {});
  }

  void _onStop() {
    timer?.cancel();
    isRunning = false;
    isStop = true;
    _animationController.stop();
    setState(() {});
  }

  void _onReset() {
    timer?.cancel();
    sec = initSec;
    isRunning = false;
    isStop = false;
    _progress = Tween(begin: 0.0, end: 2.0).animate(_animationController);
    _animationController.value = 0;
    _animationController.stop();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  child: AnimatedBuilder(
                    animation: _progress,
                    builder: (context, child) {
                      return CustomPaint(
                        painter: TimerPainter(progress: _progress.value),
                        size: Size(size.width, size.width),
                      );
                    },
                  ),
                ),
                Positioned(
                  child: SizedBox(
                    width: size.width,
                    height: size.width,
                    child: Center(
                      child: Text(
                        "${(sec ~/ 60).toString().padLeft(2, '0')}:${(sec % 60).toString().padLeft(2, '0')}",
                        style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      iconSize: 24,
                      onPressed: _onReset,
                      color: Colors.grey.shade500,
                      icon: Icon(Icons.replay),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFF7666C),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    iconSize: 48,
                    onPressed: !isRunning ? _onPlay : _onPause,
                    color: Colors.white,
                    icon: Icon(
                      !isRunning
                          ? Icons.play_arrow_rounded
                          : Icons.pause_rounded,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    iconSize: 32,
                    onPressed: _onStop,
                    color: Colors.grey.shade500,
                    icon: Icon(Icons.stop_rounded),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  late final double progress;
  TimerPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width / 2) * 0.8;

    Paint backgroundCircle = Paint()
      ..color = Color(0xFFEEEEEE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 27;
    canvas.drawCircle(center, radius, backgroundCircle);

    Paint progressArc = Paint()
      ..color = Color(0xFFF7666C)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 27;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -0.5 * pi,
      progress * pi,
      false,
      progressArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
