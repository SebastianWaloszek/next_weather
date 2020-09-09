import 'package:flutter/material.dart';

import 'color/app_colors.dart';

/// Text styles used throughout the app.
abstract class AppTextStyles {
  static const fontFamily = 'Roboto';

  static TextStyle headline1(BuildContext context, {Color color}) {
    return TextStyle(
      color: color ?? AppColors.primaryContent(context),
      fontSize: 96,
      letterSpacing: -0.24,
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle headline2(BuildContext context, {Color color}) {
    return TextStyle(
      color: color ?? AppColors.primaryContent(context),
      fontSize: 96,
      letterSpacing: -0.24,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle headline3(BuildContext context, {Color color}) {
    return TextStyle(
      color: color ?? AppColors.primaryContent(context),
      fontSize: 24,
      letterSpacing: -0.24,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle headline4(BuildContext context, {Color color}) {
    return TextStyle(
      color: color ?? AppColors.primaryContent(context),
      fontSize: 20,
      letterSpacing: -0.24,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle body1(BuildContext context, {Color color}) {
    return TextStyle(
      color: color ?? AppColors.primaryContent(context),
      fontSize: 24,
      letterSpacing: -0.24,
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle body2(BuildContext context, {Color color}) {
    return TextStyle(
      color: color ?? AppColors.primaryContent(context),
      fontSize: 20,
      letterSpacing: -0.24,
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle subtitle1(BuildContext context, {Color color}) {
    return TextStyle(
      color: color ?? AppColors.primaryContent(context),
      fontSize: 16,
      letterSpacing: -0.24,
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
    );
  }
}
