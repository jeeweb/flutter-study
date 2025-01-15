import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF1F1F1F),
        primaryColorLight: Colors.white,
        primaryColorDark: Color(0xFF000100),
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF1F1F1F),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 48,
                    bottom: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Icon(
                          Icons.account_circle_rounded,
                          size: 48,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 40,
                        color: Colors.white,
                        icon: Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'MONDAY 16',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 36,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'TODAY',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '•',
                          style: TextStyle(
                            color: Color(0xFFB32680),
                            fontSize: 48,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                '17',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                '18',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                '19',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                '20',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                '21',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ScheduleCard(
                          startTimeHour: '11',
                          startTimeMin: '30',
                          endTimeHour: '12',
                          endTimeMin: '20',
                          name: 'DESIGN\nMEETING',
                          type: 'yellow',
                          attendee: ['ALEX', 'HELENA', 'NANA'],
                        ),
                        ScheduleCard(
                          startTimeHour: '12',
                          startTimeMin: '35',
                          endTimeHour: '14',
                          endTimeMin: '10',
                          name: 'DAILY\nPROJECT',
                          type: 'purple',
                          attendee: ['ME', 'RICHARD', 'CIRY', '+4'],
                        ),
                        ScheduleCard(
                          startTimeHour: '15',
                          startTimeMin: '00',
                          endTimeHour: '16',
                          endTimeMin: '30',
                          name: 'WEEKLY\nPLANNING',
                          type: 'green',
                          attendee: [
                            'DEN',
                            'NANA',
                            'MARK',
                          ],
                        ),
                        ScheduleCard(
                          startTimeHour: '17',
                          startTimeMin: '00',
                          endTimeHour: '18',
                          endTimeMin: '00',
                          name: 'LET\'S\nGO HOME',
                          type: 'yellow',
                          attendee: [
                            'ME',
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String startTimeHour, startTimeMin, endTimeHour, endTimeMin, name, type;
  final List<String> attendee;

  const ScheduleCard(
      {super.key,
      required this.startTimeHour,
      required this.startTimeMin,
      required this.endTimeHour,
      required this.endTimeMin,
      required this.name,
      required this.type,
      required this.attendee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
        decoration: BoxDecoration(
          color: type == 'yellow'
              ? Color(0xFFFFF754)
              : type == 'purple'
                  ? Color(0xFF9C6BCE)
                  : Color(0xFFBCEF4B),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    startTimeHour,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    startTimeMin,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontSize: 28,
                      height: 1,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text(
                    endTimeHour,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    endTimeMin,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                    height: 0.9,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    for (var i in attendee)
                      Padding(
                        padding: EdgeInsets.only(
                          right: 28,
                        ),
                        child: Text(
                          i,
                          style: TextStyle(
                            color: i == "ME" ? Colors.black : Colors.black54,
                            fontSize: 16,
                            fontWeight:
                                i == "ME" ? FontWeight.w500 : FontWeight.w400,
                          ),
                        ),
                      ),
                    //
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
