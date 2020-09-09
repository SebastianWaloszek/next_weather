import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final String title;

  final void Function() onTapped;

  const Button({
    Key key,
    this.icon,
    this.title,
    @required this.onTapped,
  })  : assert(icon != null || title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: AppThemeConstants.borderRadius),
      color: AppColors.secondaryBackground(context),
      onPressed: onTapped,
      child: Row(
        children: <Widget>[
          _buildIcon(context),
          _buildTitleText(context),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Icon(
      Icons.location_on_outlined,
      color: AppColors.primaryAccent(context),
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: AppTextStyles.subtitle1(
          context,
          color: AppColors.primaryContent(context),
        ),
      ),
    );
  }
}
