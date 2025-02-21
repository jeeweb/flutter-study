import 'package:shared_preferences/shared_preferences.dart';

class ThemeConfigRepository {
  static final String _darkTheme = "darkTheme";
  final SharedPreferences _preferences;

  ThemeConfigRepository(this._preferences);

  Future<void> setDarkTheme(bool value) async {
    _preferences.setBool(_darkTheme, value);
  }

  bool isDarkTheme() {
    return _preferences.getBool(_darkTheme) ?? false;
  }
}
