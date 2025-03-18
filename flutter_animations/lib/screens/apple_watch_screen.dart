import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({super.key});

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text("Apple Watch"),
      ),
      body: Center(
        child: CustomPaint(
          painter: AppleWatchPainter(),
          size: Size(400, 400), // 그림을 그린 캔버스 사이즈
        ),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );
    const startingAngle = -0.5 * pi;
    final double strokeWidth = 40;

    // red background
    final redCirclePaint = Paint()
      ..color = Color.fromRGBO(243, 17, 73, 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final redCircleRadius = (size.width / 2) * 0.9;

    canvas.drawCircle(
      center,
      redCircleRadius,
      redCirclePaint,
    );

    // green background
    final greenCirclePaint = Paint()
      ..color = Color.fromRGBO(159, 248, 16, 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final greenCircleRadius = (size.width / 2) * 0.68;

    canvas.drawCircle(
      center,
      greenCircleRadius,
      greenCirclePaint,
    );

    // blue background
    final blueCirclePaint = Paint()
      ..color = Color.fromRGBO(68, 222, 245, 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final blueCircleRadius = (size.width / 2) * 0.46;

    canvas.drawCircle(
      center,
      blueCircleRadius,
      blueCirclePaint,
    );

    // red arc
    final redArcRect = Rect.fromCircle(
      center: center,
      radius: redCircleRadius,
    );

    final redArcPaint = Paint()
      ..color = Color(0xFFF31149)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      redArcRect, // rect
      startingAngle, // startAngle
      1.5 * pi, // sweepAngle
      false, // useCenter
      redArcPaint, // paint
    );

    // green arc
    final grenArcRect = Rect.fromCircle(
      center: center,
      radius: greenCircleRadius,
    );

    final greenArcPaint = Paint()
      ..color = Color(0xFF9ff810)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      grenArcRect, // rect
      startingAngle, // startAngle
      1.2 * pi, // sweepAngle
      false, // useCenter
      greenArcPaint, // paint
    );

    // blue arc
    final blueArcRect = Rect.fromCircle(
      center: center,
      radius: blueCircleRadius,
    );

    final blueArcPaint = Paint()
      ..color = Color(0xFF44def5)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      blueArcRect, // rect
      startingAngle, // startAngle
      0.6 * pi, // sweepAngle
      false, // useCenter
      blueArcPaint, // paint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
