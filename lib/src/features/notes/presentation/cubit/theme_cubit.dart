import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeState { light, dark, system }

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences sharedPreferences;

  ThemeCubit({required this.sharedPreferences}) : super(ThemeState.system);

  void setThemeMode(ThemeState themeState) {
    emit(themeState);
    _saveThemePreference(themeState);
  }

  void _saveThemePreference(ThemeState themeState) {
    sharedPreferences.setString('themeMode', themeState.toString());
  }

  void loadThemePreference() {
    String? storedTheme = sharedPreferences.getString('themeMode');
    if (storedTheme != null) {
      if (storedTheme == 'ThemeState.dark') {
        emit(ThemeState.dark);
      } else if (storedTheme == 'ThemeState.light') {
        emit(ThemeState.light);
      } else {
        emit(ThemeState.system);
      }
    } else {
      emit(ThemeState.system);
    }
  }
}
