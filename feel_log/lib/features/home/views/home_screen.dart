import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:feel_log/features/home/view_model/home_view_model.dart';
import 'package:feel_log/features/home/views/widgets/post_item.dart';
import 'package:feel_log/core/core.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List _getEventsForDay(DateTime day) {
    DateTime normalizedDay = DateTime(day.year, day.month, day.day);
    return ref.read(homeProvider.notifier).events[normalizedDay] ?? [];
  }

  Widget _buildEventMarker() {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ref.watch(homeProvider).when(
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
              child: Text(
            "$error",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
          data: (posts) => Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 48.0,
                    decoration: BoxDecoration(),
                    child: FLLogo(
                      isAuth: false,
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: -20.0,
                        right: 0,
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: size.width - 20.0,
                          //height: 240.0,
                          padding: EdgeInsetsDirectional.only(
                              end: 12.0, bottom: 12.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF010101),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40.0),
                            ),
                          ),
                          child: TableCalendar(
                            eventLoader: _getEventsForDay,
                            focusedDay: _focusedDay,
                            firstDay: DateTime(2000),
                            lastDay: DateTime(2100),
                            calendarFormat: _calendarFormat,
                            onFormatChanged: (format) {
                              setState(() {
                                _calendarFormat = format;
                              });
                            },
                            availableCalendarFormats: {
                              CalendarFormat.month: 'Month',
                              CalendarFormat.week: 'Week',
                            },
                            selectedDayPredicate: (day) =>
                                isSameDay(_selectedDay, day),
                            onDaySelected: (selectedDay, focusedDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            },
                            headerStyle: HeaderStyle(
                              titleTextStyle: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                              formatButtonTextStyle: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(255, 255, 255, 0.8),
                              ),
                              formatButtonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color.fromRGBO(255, 255, 255, 0.6),
                                ),
                              ),
                              leftChevronIcon: Icon(MdiIcons.chevronLeft),
                              rightChevronIcon: Icon(MdiIcons.chevronRight),
                            ),
                            daysOfWeekStyle: DaysOfWeekStyle(
                              weekdayStyle: TextStyle(color: Colors.white),
                              weekendStyle: TextStyle(color: Colors.white),
                            ),
                            calendarStyle: CalendarStyle(
                              cellMargin: EdgeInsets.all(8.0),
                              defaultTextStyle: TextStyle(color: Colors.white),
                              weekendTextStyle: TextStyle(color: Colors.white),
                              holidayTextStyle: TextStyle(color: Colors.white),
                              todayTextStyle:
                                  TextStyle(color: Color(0xFF010101)),
                              todayDecoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              outsideTextStyle: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.5),
                              ),
                              markersAnchor: -0.8,
                              markerMargin:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              markersMaxCount: 4,
                            ),
                            calendarBuilders: CalendarBuilders(
                              markerBuilder: (context, date, events) {
                                if (events.isNotEmpty) {
                                  return Positioned(
                                    bottom: 0,
                                    child: _buildEventMarker(),
                                  );
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(56.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 36.0,
                          horizontal: 28.0,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemCount: posts.length,
                                itemBuilder: (context, index) => PostItem(
                                  postId: posts[index].postId,
                                  moodTheme: posts[index].moodTheme,
                                  postTitle: posts[index].postTitle,
                                  postContent: posts[index].postContent,
                                  createdAt: posts[index].createdAt,
                                ),
                                separatorBuilder: (context, index) => Divider(
                                  height: 0.4,
                                  color: Color.fromRGBO(164, 164, 164, 0.4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
