import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/users/view_models/users_view_model.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';
import 'package:tiktok_clone/features/videos/repos/videos_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;

  @override
  FutureOr<void> build() {
    // video repository 초기화
    _repository = ref.read(videosRepo);
  }

  Future<void> uploadVideo(File video, BuildContext context) async {
    final user = ref.read(authRepo).user;

    final userProfile = ref.read(usersProvider).value;
    if (userProfile != null) {
      // 사용자 프로필이 없으면 아래 코드가 모두 실행되지 않음
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        final task = await _repository.uploadVideoFile(
          video,
          user!.uid,
        );
        // video를 업로드하고 데이터베이스에 저장
        if (task.metadata != null) {
          // 파일이 정상적으로 업로드되었다면 database에 document 만들기
          await _repository.saveVideo(
            VideoModel(
              title: "From Flutter!", // 코드챌린지로 제목과 설명은 사용자가 직접 입력할 수 있도록 하기
              description: "this is description",
              fileUrl: await task.ref.getDownloadURL(),
              thumbnailUrl: "",
              creatorUid: user.uid,
              likes: 0,
              comments: 0,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              creator: userProfile.name,
            ),
          );
          context.pushReplacement("/home"); // 업로드 성공하면 home 화면으로 이동
        }
      });
    }
  }
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
