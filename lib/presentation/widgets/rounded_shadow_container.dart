import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';

class RoundedShadowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double width;
  final double height;

  final Color color;

  final void Function() onTapped;

  const RoundedShadowContainer({
    Key key,
    this.child,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.color,
    this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      height: height,
      decoration: _buildBoxDecoration(context),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Material(
      child: InkWell(
        onTap: onTapped,
        borderRadius: AppThemeConstants.borderRadius,
        child: Ink(
          padding: padding,
          child: child,
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      boxShadow: AppThemeConstants.getBoxShadow(context),
      color: color ?? AppColors.background(context),
      borderRadius: AppThemeConstants.borderRadius,
    );
  }
}
