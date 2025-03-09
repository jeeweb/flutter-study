import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:feel_log/core/core.dart';

class PostItem extends StatelessWidget {
  final double moodTheme;
  final String postTitle;
  final String postContent;
  final DateTime createdAt;
  const PostItem({
    super.key,
    required this.moodTheme,
    required this.postTitle,
    required this.postContent,
    required this.createdAt,
  });

  String formatDate(date) {
    return DateFormat("yyyy.MM.dd").format(date);
  }

  void _onDelete() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              spacing: 8.0,
              children: [
                Icon(
                  getMoodIcon(moodTheme),
                  size: 24.0,
                ),
                Text(
                  formatDate(createdAt),
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ],
            ),
            //IconButton(icon: Icon(MdiIcons.pencil), onPressed: _onModifyTap, )
            IconButton(
              icon: Icon(
                MdiIcons.trashCanOutline,
                size: 18.0,
                color: Colors.grey,
              ),
              onPressed: _onDelete,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            postTitle,
            style: TextStyle(
                //color: cardTitleColor(moodTheme),
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          postContent,
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}
