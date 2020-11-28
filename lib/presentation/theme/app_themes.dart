import 'package:flutter/material.dart';

import 'color/theme_colors.dart';

final Map<ThemeMode, ThemeData> appThemes = {
  ThemeMode.light: ThemeData(
    accentColor: LightThemeColors.primaryAccent,
    primaryColor: LightThemeColors.primaryAccent,
    scaffoldBackgroundColor: LightThemeColors.background,
    canvasColor: Colors.transparent,
    brightness: Brightness.light,
  ),
  ThemeMode.dark: ThemeData(
    accentColor: DarkThemeColors.primaryAccent,
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: DarkThemeColors.background,
    brightness: Brightness.dark,
  ),
};
