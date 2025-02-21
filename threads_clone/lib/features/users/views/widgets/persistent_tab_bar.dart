import 'package:flutter/material.dart';
import 'package:threads_clone/utils.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isDark = isDarkMode(context);
    return Align(
      child: Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: TabBar(
          labelColor: isDark ? Colors.white : Colors.black,
          labelPadding: EdgeInsets.symmetric(vertical: 16.0),
          labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1,
          dividerColor: Colors.grey.shade200,
          unselectedLabelColor: Colors.grey.shade500,
          tabs: [
            Text("Threads"),
            Text("Replies"),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 72;

  @override
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
