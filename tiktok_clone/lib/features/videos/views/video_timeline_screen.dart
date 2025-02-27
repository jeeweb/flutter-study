import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/view_models/timeline_view_model.dart';
import 'package:tiktok_clone/features/videos/views/widgets/video_post.dart';

class VideoTimelineScreen extends ConsumerStatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  VideoTimelineScreenState createState() => VideoTimelineScreenState();
}

class VideoTimelineScreenState extends ConsumerState<VideoTimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();
  final Duration _scrollDuration = Duration(milliseconds: 200);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    // print(page); // 현재 어떤 페이지가 화면에 보이는지 index 번호로 알려줌

    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    return; // 실제 틱톡에서는 영상이 끝나면 다음 영상으로 넘어가지 않고 반복재생이 되므로 넘어가지 않게 해줌
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      Duration(
        seconds: 5, // 화면을 잡아당기고 새로고침이 나타나는 시간으로 future가 5초간 있는 것처럼 할 수 있음
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TimelineViewModel의 build 메서드가 끝나서 데이터가 오기까지 기다려야함
    return ref.watch(timelineProvider).when(
          // when은 Provider의 각기 다른 state를 위한 callback을 제공
          loading: () => Center(
              child:
                  CircularProgressIndicator()), // Provider가 로딩 중일 때 (API를 기다릴 때) return 하는 값
          error: (error, stackTrace) => Center(
              child: Text(
            'Could not load videos: $error',
            style: TextStyle(
              color: Colors.white,
            ),
          )), // error가 있을 때
          data: (videos) => RefreshIndicator(
            onRefresh: _onRefresh,
            displacement: 50,
            edgeOffset: 20,
            color: Theme.of(context).primaryColor,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: _onPageChanged,
              itemCount: videos.length,
              itemBuilder: (context, index) =>
                  VideoPost(onVideoFinished: _onVideoFinished, index: index),
            ),
          ), // 데이터가 있을 때 RefreshIndicator 값 반환
        );
  }
}
