import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

part 'app_theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppThemes.lightTheme);

  void toggleTheme() {
    final isLightTheme = state.brightness == Brightness.light;
    emit(isLightTheme ? AppThemes.darkTheme : AppThemes.lightTheme);
  }
}
