import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:tiktok_clone/utils.dart';

// 이 viewmodel은 계정을 만들 때 로딩화면을 보여주고 계정 생성을 트리거하는 역할
class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    state = await AsyncValue.guard(
      () async => await _authRepo.emailSignUp(
        form["email"],
        form["password"],
      ),
    );
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      // error가 없다면 Interests 화면으로 이동
      context.goNamed(InterestsScreen.routeName);
    }
  }
}

// 바깥에서 수정할 수 있는 value를 expose 하게 해줌. value를 expose 하고 바깥에서 수정 가능한
final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
