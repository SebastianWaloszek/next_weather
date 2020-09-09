import 'dart:ui';

import 'package:flutter/material.dart';

abstract class LightThemeColors {
  static Color get primaryContent => const Color(0xFF222529);
  static Color get secondaryContent => const Color(0xFFBEBDBD);
  static Color get primaryAccent => const Color(0xFF);
  static Color get buttonContent => const Color(0xFFFFFFFF);
  static Color get background => const Color(0xFFFFFFFF);
  static Color get secondaryBackground => const Color(0xFFF5F5F5);
  static Color get active => const Color(0xFF7ECB7A);
  static Color get shadow => const Color(0xFF000000).withOpacity(0.25);
}

abstract class DarkThemeColors {
  static Color get primaryContent => const Color(0xFFE1E1E1);
  static Color get secondaryContent => const Color(0xFFA5A5A5);
  static Color get primaryAccent => const Color(0xFF);
  static Color get buttonContent => const Color(0xFFFFFFFF);
  static Color get background => const Color(0xFF181818);
  static Color get secondaryBackground => const Color(0xFF2B2B2B);
  static Color get active => const Color(0xFF7ECB7A);
  static Color get shadow => const Color(0xFF000000).withOpacity(0.25);
}
