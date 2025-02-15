import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/features/home/home_screen.dart';
import 'package:threads_clone/features/images/image_taking_screen.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _postText = "";
  bool _isWriting = false;

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
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => HomeScreen(),
    //   ),
    // );
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onPostImageTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImageTakingScreen(),
        fullscreenDialog: true, // 전체화면으로 열리도록
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              onTap: _stopWriting,
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
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
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                GestureDetector(
                                  onTap: _onPostImageTap,
                                  child: FaIcon(
                                    FontAwesomeIcons.paperclip,
                                    color: Colors.black26,
                                  ),
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
                  height: 52.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Anyone can reply",
                          style: TextStyle(
                            color: Colors.black45,
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
