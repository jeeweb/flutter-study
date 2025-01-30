import 'package:flutter/material.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.teal,
  ];

  void _onPageChanged(int page) {
    // print(page); // 현재 어떤 페이지가 화면에 보이는지 index 번호로 알려줌

    if (page == _itemCount - 1) {
      // 만약 처음에 itemCount가 4일 때 사용자가 index 3인 페이지에 있으면 4개의 항목을 더 불러오고 아래 Color 리스트도 4개도 더 넣어줌
      _itemCount = _itemCount + 4;
      colors.addAll([
        Colors.blue,
        Colors.red,
        Colors.yellow,
        Colors.teal,
      ]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      onPageChanged: _onPageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) => Container(
          color: colors[index],
          child: Center(
            child: Text(
              "Screen $index",
              style: TextStyle(
                fontSize: 68,
              ),
            ),
          )),
    );
  }
}
