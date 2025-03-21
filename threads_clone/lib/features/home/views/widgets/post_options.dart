import 'package:flutter/material.dart';
import 'package:threads_clone/features/home/views/widgets/post_report.dart';
import 'package:threads_clone/utils.dart';

class PostOptions extends StatelessWidget {
  const PostOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    void onReportTap(BuildContext context) async {
      Navigator.of(context).pop();
      await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => PostReport(),
      );
    }

    return Container(
      color: isDark ? Colors.black87 : Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.36,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: isDark ? Color(0xFF2E2E2E) : Color(0xFFF5F5F5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      "Unfollow",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(
                    color: isDark ? const Color(0xFF444444) : Color(0xFFE9E9E9),
                    thickness: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 8.0,
                      bottom: 16.0,
                    ),
                    child: Text(
                      "Mute",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: isDark ? const Color(0xFF2E2E2E) : Color(0xFFF5F5F5),
                //color: Colors.red,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                      bottom: 8.0,
                    ),
                    child: Text(
                      "Hide",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(
                    color: isDark ? const Color(0xFF444444) : Color(0xFFE9E9E9),
                    thickness: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 8.0,
                      bottom: 16.0,
                    ),
                    child: GestureDetector(
                      onTap: () => onReportTap(context),
                      child: Text(
                        "Report",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFfe374a)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
