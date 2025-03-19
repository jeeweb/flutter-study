import 'dart:math';

import 'package:flutter/material.dart';

class AppleWatchScreen extends StatefulWidget {
  const AppleWatchScreen({super.key});

  @override
  State<AppleWatchScreen> createState() => _AppleWatchScreenState();
}

class _AppleWatchScreenState extends State<AppleWatchScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..forward();

  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _animationController,
    curve: Curves.bounceOut,
  );

/* 세가지 색 모두 같은 값으로 시작
  late Animation<double> _progress = Tween(
    begin: 0.005,
    end: 2.0,
  ).animate(_curve);
*/

  late Animation<double> _redProgress = Tween(
    begin: 0.005,
    end: Random().nextDouble() * 2.0,
  ).animate(_curve);

  late Animation<double> _blueProgress = Tween(
    begin: 0.005,
    end: Random().nextDouble() * 2.0,
  ).animate(_curve);

  late Animation<double> _greenProgress = Tween(
    begin: 0.005,
    end: Random().nextDouble() * 2.0,
  ).animate(_curve);

  void _animateValues() {
    //_animationController.forward(); // 화면에 접속하자마자 애니메이션이 실행되기 때문에 해당 코드는 필요 없음

    /*
    // 새로고침 버튼 누를 때마다 새로운 시작을 하도록 하기
    final newBegin = _progress.value;
    final random = Random();
    final newEnd = random.nextDouble() * 2.0; // 0에서 2 사이의 수를 받음
    setState(() {
      
      _progress = Tween(
        begin: newBegin,
        end: newEnd,
        
      ).animate(_curve);
    });
*/
    setState(() {
      _redProgress = Tween(
        begin: _redProgress.value,
        end: Random().nextDouble() * 2.0,
      ).animate(_curve);
      _blueProgress = Tween(
        begin: _blueProgress.value,
        end: Random().nextDouble() * 2.0,
      ).animate(_curve);
      _greenProgress = Tween(
        begin: _greenProgress.value,
        end: Random().nextDouble() * 2.0,
      ).animate(_curve);
    });
    _animationController.forward(from: 0); // 애니메이션 컨트롤러 재설정
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
        child: AnimatedBuilder(
          animation: _redProgress,
          builder: (context, child) {
            return CustomPaint(
              painter: AppleWatchPainter(
                  redValue: _redProgress.value,
                  greenValue: _blueProgress.value,
                  blueValue: _greenProgress.value),
              size: Size(400, 400), // 그림을 그린 캔버스 사이즈
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateValues,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class AppleWatchPainter extends CustomPainter {
  late double? redValue;
  late double? greenValue;
  late double? blueValue;

  AppleWatchPainter({
    super.repaint,
    this.redValue,
    this.greenValue,
    this.blueValue,
  });

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
      redValue! * pi, // 1.5 * pi, // sweepAngle
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
      greenValue! * pi, //1.2 * pi, // sweepAngle
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
      blueValue! * pi, //0.6 * pi, // sweepAngle
      false, // useCenter
      blueArcPaint, // paint
    );
  }

  /*
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  */

  // 새로운 값이 이전 값과 다른 경우에만 다시 그리기 -> progress 값이 바뀔 때만 다시 그리기
  @override
  bool shouldRepaint(covariant AppleWatchPainter oldDelegate) {
    return true;
  }
}
