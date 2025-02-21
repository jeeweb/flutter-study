import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads_clone/features/users/models/theme_config_model.dart';
import 'package:threads_clone/features/users/repos/theme_config_repo.dart';

class ThemeConfigViewModel extends Notifier<ThemeConfigModel> {
  final ThemeConfigRepository _repository;

  ThemeConfigViewModel(this._repository);

  void setDarkTheme(bool value) {
    _repository.setDarkTheme(value);
    state = ThemeConfigModel(
      darkTheme: value,
    );
  }

  @override
  ThemeConfigModel build() {
    return ThemeConfigModel(
      darkTheme: _repository.isDarkTheme(),
    );
  }
}

final ThemeConfigProvider =
    NotifierProvider<ThemeConfigViewModel, ThemeConfigModel>(
        () => throw UnimplementedError());
