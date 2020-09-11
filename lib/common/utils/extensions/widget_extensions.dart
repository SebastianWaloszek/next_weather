import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';

extension WidgetExtensions on Widget {
  List<BoxShadow> cellBoxShadow(BuildContext context) {
    return [
      BoxShadow(
        color: AppColors.shadow(context),
        offset: const Offset(1, 1),
        blurRadius: AppThemeConstants.shadowBlurRadius,
      )
    ];
  }

  BorderSide borderSide(BuildContext context) {
    return BorderSide(
      width: 2,
      color: AppColors.secondaryBackground(context),
    );
  }
}
