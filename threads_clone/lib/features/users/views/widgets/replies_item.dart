import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/features/home/views/widgets/post_options.dart';

class RepliesItem extends StatefulWidget {
  final String username;
  final String userAvatar;
  final String contentText;
  final String time;
  final List<String> images;
  final String myName;
  final String myAvatar;
  final String myContentText;
  final String myTime;

  const RepliesItem({
    super.key,
    required this.username,
    required this.userAvatar,
    required this.contentText,
    required this.time,
    required this.images,
    required this.myName,
    required this.myAvatar,
    required this.myContentText,
    required this.myTime,
  });

  @override
  State<RepliesItem> createState() => _RepliesItemState();
}

class _RepliesItemState extends State<RepliesItem> {
  @override
  Widget build(BuildContext context) {
    void onOptionsTap(BuildContext context) async {
      await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => PostOptions(),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                foregroundImage: NetworkImage(widget.userAvatar),
              ),
              SizedBox(width: 10.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.username,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.time,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () => onOptionsTap(context),
                              child: FaIcon(
                                FontAwesomeIcons.ellipsis,
                                color: Colors.grey.shade600,
                                size: 18.0,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(widget.contentText),
                    SizedBox(height: 10.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var img in widget.images)
                            Row(
                              children: [
                                SizedBox(height: 8.0),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Image.network(
                                    img,
                                    width: widget.images.length > 1 ? 312 : 328,
                                  ),
                                ),
                                SizedBox(
                                  width: widget.images.length > 1 ? 12.0 : 0,
                                  height: 8.0,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: 20.0,
                          ),
                          SizedBox(width: 20.0),
                          FaIcon(
                            FontAwesomeIcons.comment,
                            size: 20.0,
                          ),
                          SizedBox(width: 20.0),
                          FaIcon(
                            FontAwesomeIcons.retweet,
                            size: 20.0,
                          ),
                          SizedBox(width: 20.0),
                          FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                foregroundImage: NetworkImage(widget.myAvatar),
              ),
              SizedBox(width: 10.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.myName,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.myTime,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () => onOptionsTap(context),
                              child: FaIcon(
                                FontAwesomeIcons.ellipsis,
                                color: Colors.grey.shade600,
                                size: 18.0,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(widget.myContentText),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: 20.0,
                          ),
                          SizedBox(width: 20.0),
                          FaIcon(
                            FontAwesomeIcons.comment,
                            size: 20.0,
                          ),
                          SizedBox(width: 20.0),
                          FaIcon(
                            FontAwesomeIcons.retweet,
                            size: 20.0,
                          ),
                          SizedBox(width: 20.0),
                          FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
