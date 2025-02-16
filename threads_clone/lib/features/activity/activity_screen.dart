import 'package:flutter/material.dart';
import 'package:threads_clone/data/mock_data.dart';
import 'package:threads_clone/features/activity/widgets/activity_item.dart';
import 'package:threads_clone/utils.dart';

final tabs = [
  "All",
  "Replies",
  "Mentions",
  "Follows",
];

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      _selectedIndex = _tabController.index;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          //toolbarHeight: 80.0,
          surfaceTintColor: Colors.white,
          centerTitle: false,
          title: Text(
            "Activity",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          bottom: TabBar(
              controller: _tabController,
              splashFactory: NoSplash.splashFactory,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
              labelColor: Theme.of(context).tabBarTheme.labelColor,
              unselectedLabelColor:
                  Theme.of(context).tabBarTheme.unselectedLabelColor,
              indicatorColor: const Color.fromARGB(0, 183, 172, 172),
              dividerColor: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              tabs: List.generate(
                tabs.length,
                (index) => Container(
                  height: 40.0,
                  width: 112.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: _selectedIndex == index
                        ? isDark
                            ? Colors.white
                            : Colors.black
                        : Colors.transparent,
                  ),
                  child: Text(tabs[index]),
                ),
              )),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              //controller: _scrollController,
              itemCount: mockDataActivities.length,
              separatorBuilder: (context, index) => Divider(
                indent: 74.0,
                color: isDark ? Color(0xFF666666) : Colors.grey.shade200,
              ),
              itemBuilder: (context, index) => ActivityItem(
                username: mockDataActivities[index].username,
                userAvatar: mockDataActivities[index].userAvatar,
                message: mockDataActivities[index].message,
                stateMessage: mockDataActivities[index].stateMessage,
                activityType: mockDataActivities[index].activityType,
                timePast: mockDataActivities[index].timePast,
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              //controller: _scrollController,
              itemCount: 1,
              separatorBuilder: (context, index) => Divider(
                indent: 74.0,
                color: Colors.grey.shade200,
              ),
              itemBuilder: (context, index) => ActivityItem(
                username: mockDataActivities[1].username,
                userAvatar: mockDataActivities[1].userAvatar,
                message: mockDataActivities[1].message,
                stateMessage: mockDataActivities[1].stateMessage,
                activityType: mockDataActivities[1].activityType,
                timePast: mockDataActivities[1].timePast,
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              //controller: _scrollController,
              itemCount: 1,
              separatorBuilder: (context, index) => Divider(
                indent: 74.0,
                color: Colors.grey.shade200,
              ),
              itemBuilder: (context, index) => ActivityItem(
                username: mockDataActivities[0].username,
                userAvatar: mockDataActivities[0].userAvatar,
                message: mockDataActivities[0].message,
                stateMessage: mockDataActivities[0].stateMessage,
                activityType: mockDataActivities[0].activityType,
                timePast: mockDataActivities[0].timePast,
              ),
            ),
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              //controller: _scrollController,
              itemCount: 1,
              separatorBuilder: (context, index) => Divider(
                indent: 74.0,
                color: Colors.grey.shade200,
              ),
              itemBuilder: (context, index) => ActivityItem(
                username: mockDataActivities[2].username,
                userAvatar: mockDataActivities[2].userAvatar,
                message: mockDataActivities[2].message,
                stateMessage: mockDataActivities[2].stateMessage,
                activityType: mockDataActivities[2].activityType,
                timePast: mockDataActivities[2].timePast,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
