import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads_clone/features/authentication/repos/authentication_repo.dart';

// 이 viewmodel은 계정을 만들 때 로딩화면을 보여주고 계정 생성을 트리거하는 역할
class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    state = await AsyncValue.guard(
      () async => await _authRepo.emailSignUp(
        form["email"],
        form["password"],
      ),
    );
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
