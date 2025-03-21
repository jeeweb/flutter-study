import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/features/camera/camera_screen.dart';
import 'package:threads_clone/utils.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _postText = "";
  bool _isWriting = false;
  bool _isSelectedFile = false;
  XFile? selectedImage;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _postText = _textEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onClosePressed() {
    Navigator.pop(context);
  }

  void onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void onPostImageTap() async {
    final selected = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraScreen(),
      ),
    );
    if (selected != null) {
      selectedImage = selected;
      _isSelectedFile = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);

    return Stack(
      children: [
        Positioned(
          top: 72.0,
          child: Container(
            clipBehavior: Clip.hardEdge,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.92,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            )),
            child: GestureDetector(
              onTap: stopWriting,
              child: Scaffold(
                backgroundColor: isDark ? Color(0xFF222222) : Colors.white,
                appBar: AppBar(
                  backgroundColor: isDark ? Color(0xFF222222) : Colors.white,
                  leadingWidth: 90.0,
                  title: Text(
                    "New thread",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  automaticallyImplyLeading: false,
                  leading: GestureDetector(
                    onTap: _onClosePressed,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.all(16.0),
                    //   child: Row(
                    //     children: [
                    //       GestureDetector(
                    //         onTap: _onClosePressed,
                    //         child: Text(
                    //           "Cancel",
                    //           style: TextStyle(
                    //             fontSize: 18.0,
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 80.0,
                    //       ),
                    //       Text(
                    //         "New thread",
                    //         style: TextStyle(
                    //           fontSize: 20.0,
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Divider(
                      height: 1,
                      thickness: 1.0,
                      color: Color(0xFFE0E0E0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 20.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            foregroundImage: NetworkImage(
                                "https://avatars.githubusercontent.com/u/52396673?v=4"),
                          ),
                          SizedBox(width: 16.0),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "jane_mobbin",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                TextField(
                                  controller: _textEditingController,
                                  maxLines: 2,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Start a thread...",
                                    hintStyle: TextStyle(
                                      color: isDark
                                          ? Colors.white54
                                          : Colors.black38,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                !_isSelectedFile
                                    ? GestureDetector(
                                        onTap: onPostImageTap,
                                        child: FaIcon(
                                          FontAwesomeIcons.paperclip,
                                          color: isDark
                                              ? Colors.white60
                                              : Colors.black26,
                                        ),
                                      )
                                    : Stack(
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 3 / 2,
                                            child: Image.file(
                                                File(selectedImage!.path),
                                                fit: BoxFit.cover),
                                          )
                                        ],
                                      )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                bottomSheet: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  height: 62.0,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black : Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Anyone can reply",
                          style: TextStyle(
                            color: isDark ? Colors.white70 : Colors.black45,
                            fontSize: 18.0,
                          )),
                      Text(
                        "Post",
                        style: TextStyle(
                          color: _postText.isEmpty
                              ? Color.fromRGBO(67, 148, 240, 0.4)
                              : Color.fromRGBO(67, 148, 240, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
