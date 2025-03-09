import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:feel_log/features/post/models/post_model.dart';
import 'package:feel_log/features/post/repos/post_repository.dart';

class HomeViewModel extends StreamNotifier<List<PostModel>> {
  late final PostRepository _postRepo;

  @override
  Stream<List<PostModel>> build() {
    _postRepo = ref.read(postRepo);

    return _postRepo.fetchPosts().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return PostModel.fromJson(data);
      }).toList();
    });
  }
}

final homeProvider = StreamNotifierProvider<HomeViewModel, List<PostModel>>(
  () => HomeViewModel(),
);
