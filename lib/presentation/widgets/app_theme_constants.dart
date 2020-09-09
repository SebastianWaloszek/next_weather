import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';

abstract class AppThemeConstants {
  static const double horizontalPagePadding = 30;
  static final BorderRadius borderRadius = BorderRadius.circular(5.0);
  static const double shadowBlurRadius = 4;
  
  static List<BoxShadow> getBoxShadow(BuildContext context) {
    return [
      BoxShadow(
        color: AppColors.shadow(context),
        offset: const Offset(1, 1),
        blurRadius: shadowBlurRadius,
      )
    ];
  }
  static BorderSide getBorderSide(BuildContext context) {
    return BorderSide(
      width: 2,
      color: AppColors.secondaryBackground(context),
    );
  }
}
