import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/data/mock_data.dart';

class ActivityItem extends StatelessWidget {
  final String username;
  final String userAvatar;
  final String message;
  final String stateMessage;
  final ActivityType activityType;
  final int timePast;

  const ActivityItem({
    super.key,
    required this.username,
    required this.userAvatar,
    required this.message,
    required this.stateMessage,
    required this.activityType,
    required this.timePast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(clipBehavior: Clip.none, children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              foregroundImage: NetworkImage(userAvatar),
            ),
            Positioned(
              bottom: 0,
              right: -4.0,
              child: Container(
                  width: 18.0,
                  height: 18.0,
                  decoration: BoxDecoration(
                    color: activityType == ActivityType.followed
                        ? Color(0xFF673FE6)
                        : activityType == ActivityType.replies
                            ? Color(0xFF5DC0F9)
                            : activityType == ActivityType.mentions
                                ? Color(0xFF5EC38A)
                                : Color(0xFFEA337B),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        activityType == ActivityType.followed
                            ? FontAwesomeIcons.solidUser
                            : activityType == ActivityType.replies
                                ? FontAwesomeIcons.reply
                                : activityType == ActivityType.mentions
                                    ? FontAwesomeIcons.at
                                    : FontAwesomeIcons.solidHeart,
                        size: 10.0,
                        color: Colors.white,
                      ),
                    ],
                  )),
            ),
          ]),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: username,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                      fontSize: 16.0,
                    ),
                    children: [
                      TextSpan(
                        text: " ${timePast}h",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          letterSpacing: 0.1,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  activityType == ActivityType.mentions
                      ? "Mentioned you"
                      : activityType == ActivityType.followed
                          ? "Followed you"
                          : stateMessage,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    letterSpacing: 0.1,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4.0),
                if (message.isNotEmpty)
                  Text(
                    message,
                    style: TextStyle(
                      letterSpacing: 0.1,
                      fontSize: 16.0,
                    ),
                  )
              ],
            ),
          ),
          activityType == ActivityType.followed
              ? Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Following",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Colors.grey.shade500,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
    // return ListTile(
    //   isThreeLine: true,
    //   minVerticalPadding: 8.0,
    //   leading: CircleAvatar(
    //     radius: 22,
    //     backgroundColor: Colors.black,
    //     foregroundColor: Colors.white,
    //     foregroundImage: NetworkImage(userAvatar),
    //   ),
    //   title: RichText(
    //     text: TextSpan(
    //         text: username,
    //         style: TextStyle(
    //           fontWeight: FontWeight.w600,
    //           letterSpacing: 0.1,
    //         ),
    //         children: [
    //           TextSpan(
    //             text: " ${timePast}h",
    //             style: TextStyle(
    //               color: Colors.grey.shade500,
    //               letterSpacing: 0.1,
    //             ),
    //           ),
    //         ]),
    //   ),
    //   subtitle: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         activityType == ActivityType.mentions
    //             ? "Mentioned you"
    //             : activityType == ActivityType.followed
    //                 ? "Followed you"
    //                 : stateMessage,
    //         style: TextStyle(
    //           color: Colors.grey.shade500,
    //           letterSpacing: 0.1,
    //         ),
    //       ),
    //       SizedBox(height: 8.0),
    //       if (message.isNotEmpty)
    //         Text(
    //           message,
    //           style: TextStyle(
    //             letterSpacing: 0.1,
    //           ),
    //         )
    //     ],
    //   ),
    //   trailing: activityType == ActivityType.followed
    //       ? Container(
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 20.0,
    //             vertical: 4.0,
    //           ),
    //           decoration: BoxDecoration(
    //             border: Border.all(color: Colors.grey.shade300),
    //             borderRadius: BorderRadius.circular(8.0),
    //           ),
    //           child: Text(
    //             "Follow",
    //             style: TextStyle(
    //               fontWeight: FontWeight.w600,
    //               fontSize: 16.0,
    //             ),
    //           ),
    //         )
    //       : Container(),
    // );
  }
}
