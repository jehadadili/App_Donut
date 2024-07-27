import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class ThemeService {
  // Theme
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black12,
  );

  final String _darkThemeKey = 'isDarkTheme';

  Future<void> saveThemeData(bool isDarkMode) async {
    await prefs!.setBool(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return prefs!.getBool(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    bool isDarkMode = isSavedDarkMode();
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSavedDarkMode());
  }
}
