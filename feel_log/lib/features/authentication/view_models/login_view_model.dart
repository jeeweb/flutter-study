import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:feel_log/router/router_constants.dart';
import 'package:feel_log/features/authentication/repos/authentication_repository.dart';
import '../../../core/core.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async => await _authRepo.logIn(email, password),
    );
    if (state.hasError) {
      //print(state.error);
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go(RouteURL.home);
    }
  }
}

final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
