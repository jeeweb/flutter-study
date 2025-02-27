import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  List<VideoModel> _list = [];

  Future<void> uploadVideo() async {
    state = const AsyncValue
        .loading(); // firebase에 연결할 때까지 로딩되도록 하기 (loading state로 설정)
    await Future.delayed(const Duration(seconds: 2));
    _list = [..._list];
    state = AsyncValue.data(_list); // 데이터를 받아오면 state를 데이터 리스트로 변경
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    await Future.delayed(const Duration(seconds: 5)); // 시뮬레이션을 위해 5초 delay 설정
    // throw Exception("OMG can't fetch"); // 고의로 에러 던져보기
    return _list; // build 메서드에서는 화면이 받을 초기 데이터를 반환
  }

  // build 메서드에서 우리가 원하는 API를 호출하고 데이터를 반환하면 그 터는 우리의 Provider에 의해 Expose 됨
  // 그 데이터는 VideoModel의 List 형태
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
