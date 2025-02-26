import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      // action: SnackBarAction( // 커스텀 버튼
      //   label: "OK",
      //   onPressed: () {},
      // ),
      showCloseIcon: true, // 닫기버튼
      content: Text(
        (error as FirebaseException).message ?? "Something wen't wrong.",
      ),
    ),
  );
}
