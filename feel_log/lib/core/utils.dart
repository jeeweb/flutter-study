import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

bool isDarkMode(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true, // 닫기버튼
      content: Text(
        (error as FirebaseException).message ?? "Something went wrong.",
      ),
    ),
  );
}

IconData? getMoodIcon(theme) {
  switch (theme) {
    case 1:
      return MdiIcons.circle;
    case 2:
      return MdiIcons.square;
    case 3:
      return MdiIcons.hexagon;
    case 4:
      return MdiIcons.octagram;
    case 5:
      return MdiIcons.decagram;
  }
  return null;
}
