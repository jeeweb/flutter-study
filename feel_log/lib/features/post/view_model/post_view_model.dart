import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:feel_log/features/post/models/post_model.dart';
import 'package:feel_log/features/post/repos/post_repository.dart';
import 'package:feel_log/features/authentication/repos/authentication_repository.dart';

class PostViewModel extends AsyncNotifier<void> {
  late final PostRepository _postRepo;

  @override
  FutureOr<void> build() async {
    _postRepo = ref.read(postRepo);
  }

  Future<void> postLog(double moodTheme, String postTitle, String postContent,
      DateTime createdAt, DateTime logDate) async {
    final user = ref.read(authRepo).user;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final newLog = PostModel(
          postId: (logDate.millisecondsSinceEpoch).toString(),
          moodTheme: moodTheme,
          postTitle: postTitle,
          postContent: postContent,
          logDate: logDate,
          createdAt: createdAt,
          userId: user!.uid,
        );

        await _postRepo.addPost(newLog);
      },
    );
    if (state.hasError) {
      print(state.error);
    }
  }

  Future<void> deleteLog(postId) async {
    await _postRepo.deletePost(postId);
  }
}

final postProvider = AsyncNotifierProvider<PostViewModel, void>(
  () => PostViewModel(),
);
