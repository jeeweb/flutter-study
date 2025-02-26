import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/utils.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  // SnacksBar 위젯을 사용하기 위해 로그인할 때 context도 넘겨줌
  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      // guard는 에러가 없으면 결과 값을 반환하고 에러가 있으면 state에 에러를 넣어줌
      () async => await _repository.signIn(email, password),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
      // final snack = const SnackBar(
      //  content:Text((state.error as FirebaseException).message ?? "Something wen't wrong."),
      //  // content:Text(state.error.toString()), // 어떤 에러인지 코드형식으로 화면 하단에 보여줌
      // );
      // ScaffoldMessenger.of(context).showSnackBar(snack);
    } else {
      // error가 없다면 Home 화면으로 이동
      context.go("/home");
    }
  }
}

final LoginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
