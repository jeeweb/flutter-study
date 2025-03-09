import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:feel_log/features/post/models/post_model.dart';
import 'package:feel_log/features/post/repos/post_repository.dart';

class HomeViewModel extends StreamNotifier<List<PostModel>> {
  late final PostRepository _postRepo;
  final Map<DateTime, List<PostModel>> events = {};

  @override
  Stream<List<PostModel>> build() {
    _postRepo = ref.read(postRepo);

    return _postRepo.fetchPosts().map((snapshot) {
      final posts = snapshot.docs.map((doc) {
        final data = doc.data();
        return PostModel.fromJson(data);
      }).toList();

      _updateEvents(posts);

      return posts;
    });
  }

  void _updateEvents(List<PostModel> posts) {
    events.clear(); // 기존 데이터 초기화

    for (var post in posts) {
      DateTime eventDate = DateTime(
          post.createdAt.year, post.createdAt.month, post.createdAt.day);

      if (events[eventDate] == null) {
        events[eventDate] = [];
      }
      events[eventDate]!.add(post);
    }
  }
}

final homeProvider = StreamNotifierProvider<HomeViewModel, List<PostModel>>(
  () => HomeViewModel(),
);
