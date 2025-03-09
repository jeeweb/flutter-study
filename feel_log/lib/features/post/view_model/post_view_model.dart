import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:feel_log/features/post/models/post_model.dart';
import 'package:feel_log/features/post/repos/post_repository.dart';
import 'package:feel_log/features/authentication/repos/authentication_repository.dart';

class PostViewModel extends AsyncNotifier<void> {
  late final PostRepository _postRepo;
  // List<PostModel> _list = [];

  @override
  FutureOr<void> build() async {
    _postRepo = ref.read(postRepo);
  }

  Future<void> postLog(double moodTheme, String postTitle, String postContent,
      DateTime date) async {
    final user = ref.read(authRepo).user;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final newLog = PostModel(
          postId: date.millisecondsSinceEpoch,
          moodTheme: moodTheme,
          postTitle: postTitle,
          postContent: postContent,
          createdAt: date,
          userId: user!.uid,
        );

        await _postRepo.addPost(newLog);
      },
    );
    if (state.hasError) {
      print(state.error);
    }
  }
}

final postProvider = AsyncNotifierProvider<PostViewModel, void>(
  () => PostViewModel(),
);
