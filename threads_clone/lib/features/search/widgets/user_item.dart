import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserItem extends StatelessWidget {
  final String username;
  final String userAvatar;
  final String stateMessage;
  final String followers;

  const UserItem(
      {super.key,
      required this.username,
      required this.userAvatar,
      required this.stateMessage,
      required this.followers});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      minVerticalPadding: 8.0,
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        foregroundImage: NetworkImage(userAvatar),
      ),
      title: Row(
        children: [
          Text(
            username,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
            ),
          ),
          SizedBox(width: 4.0),
          FaIcon(
            FontAwesomeIcons.solidCircleCheck,
            color: Color(0xFF4294EF),
            size: 14.0,
          )
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stateMessage,
            style: TextStyle(
              color: Colors.grey.shade500,
              letterSpacing: 0.1,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "$followers followers",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
            ),
          )
        ],
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          "Follow",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
