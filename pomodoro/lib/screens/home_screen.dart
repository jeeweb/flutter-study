import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const totalRounds = 4;
  static const totalGoals = 12;

  int currentMinutes = 25;
  int totalSeconds = 10;
  int rounds = 0;
  int goals = 0;
  bool isRunning = false;
  late Timer timer;

  bool isSelected = false;

  void onTick(Timer timer) {
    if (totalSeconds == 0 && goals == totalGoals) {
      setState(() {
        isRunning = false;
        goals = 0;
        rounds = 0;
        totalSeconds = currentMinutes * 60;
      });
      timer.cancel();
    } else if (totalSeconds == 0 && rounds != totalGoals) {
      setState(() {
        rounds = rounds + 1;
        isRunning = false;
        totalSeconds = currentMinutes * 60;
      });
      timer.cancel();
    } else if (totalSeconds == 0 && rounds == totalGoals) {
      setState(() {
        rounds = rounds + 1;
        isRunning = false;
        totalSeconds = currentMinutes * 60;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void selectMinuteButton(int min) {
    timer.cancel();
    setState(() {
      rounds = 0;
      goals = 0;
      currentMinutes = min;
      totalSeconds = currentMinutes * 60;
      isRunning = false;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
        Duration(
          seconds: 1,
        ),
        onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      rounds = 0;
      goals = 0;
      totalSeconds = currentMinutes * 60;
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'POMOTIMER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            rounds = 0;
                            goals = 0;
                            currentMinutes = 5;
                            isRunning ? onPausePressed() : '';
                            setState(() {
                              totalSeconds = currentMinutes * 60;
                              isRunning = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              side: BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              )),
                          child: Text(
                            '5',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            rounds = 0;
                            goals = 0;
                            currentMinutes = 15;
                            isRunning ? onPausePressed() : '';
                            setState(() {
                              totalSeconds = currentMinutes * 60;
                              isRunning = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              side: BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              )),
                          child: Text(
                            '15',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            rounds = 0;
                            goals = 0;
                            currentMinutes = 20;
                            isRunning ? onPausePressed() : '';
                            setState(() {
                              totalSeconds = currentMinutes * 60;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              side: BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              )),
                          child: Text(
                            '20',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            rounds = 0;
                            goals = 0;
                            currentMinutes = 25;
                            isRunning ? onPausePressed() : '';
                            setState(() {
                              totalSeconds = currentMinutes * 60;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              side: BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              )),
                          child: Text(
                            '25',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            rounds = 0;
                            goals = 0;
                            currentMinutes = 30;
                            isRunning ? onPausePressed() : '';
                            setState(() {
                              totalSeconds = currentMinutes * 60;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              side: BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              )),
                          child: Text(
                            '30',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            rounds = 0;
                            goals = 0;
                            currentMinutes = 35;
                            isRunning ? onPausePressed() : '';
                            setState(() {
                              totalSeconds = currentMinutes * 60;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              side: BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              )),
                          child: Text(
                            '35',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: OutlinedButton(
                          onPressed: () {
                            rounds = 0;
                            goals = 0;
                            currentMinutes = 40;
                            isRunning ? onPausePressed() : '';
                            setState(() {
                              totalSeconds = currentMinutes * 60;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              side: BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              )),
                          child: Text(
                            '40',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.6),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  IconButton(
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    iconSize: 98,
                    color: Theme.of(context).cardColor,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    onPressed: onResetPressed,
                    style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        )),
                    child: Text(
                      'RESET',
                      style: TextStyle(color: Theme.of(context).cardColor),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$rounds / $totalRounds',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .cardColor
                                        .withOpacity(0.8)),
                              ),
                              const Text(
                                'ROUND',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$goals / $totalGoals',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.8),
                                ),
                              ),
                              const Text(
                                'GOAL',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
