import 'package:flutter/material.dart';
import 'package:threads_clone/features/users/models/theme_config_model.dart';
import 'package:threads_clone/features/users/repos/theme_config_repo.dart';

class ThemeConfigViewModel extends ChangeNotifier {
  final ThemeConfigRepository _repository;

  late final ThemeConfigModel _model = ThemeConfigModel(
    darkTheme: _repository.isDarkTheme(),
  );

  ThemeConfigViewModel(this._repository);

  bool get darkTheme => _model.darkTheme;

  void setDarkTheme(bool value) {
    _repository.setDarkTheme(value);
    _model.darkTheme = value;
    notifyListeners();
  }
}
