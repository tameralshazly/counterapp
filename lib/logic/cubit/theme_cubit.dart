import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light)) {
    updateAppTheme();
  }

  void updateAppTheme() {
    final Brightness currentBrightness = AppTheme.currentSystemBrightness;
    if (currentBrightness == Brightness.light) {
      _setTheme(ThemeMode.light);
    } else if (currentBrightness == Brightness.dark) {
      _setTheme(ThemeMode.dark);
    } else {
      _setTheme(ThemeMode.light);
    }
  }

  void _setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }
}
