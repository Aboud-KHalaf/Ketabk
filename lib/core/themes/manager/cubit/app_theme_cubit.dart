import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../app_theme.dart';

part 'app_theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final Box box;

  ThemeCubit(this.box) : super(_getInitialTheme(box)) {
    _getInitialTheme(box);
  }

  static ThemeData _getInitialTheme(Box box) {
    final isDarkMode = box.get('isDarkMode', defaultValue: true) as bool;
    log('is dark : $isDarkMode');
    return isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme;
  }

  void toggleTheme() {
    final isLightTheme = state.brightness == Brightness.light;
    final newTheme = isLightTheme ? AppThemes.darkTheme : AppThemes.lightTheme;

    // Save the theme preference to Hive
    box.put('isDarkMode', isLightTheme);

    emit(newTheme);
  }
}
