import 'package:flutter/material.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Align(
      child: Container(
        color: Colors.white,
        child: TabBar(
          labelColor: Colors.black,
          labelPadding: EdgeInsets.symmetric(vertical: 16.0),
          labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          indicatorColor: Colors.black,
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
