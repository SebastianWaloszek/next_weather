import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';

class SettingsRow extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget trailing;
  final TextStyle titleStyle;
  final void Function() onSelected;

  const SettingsRow({
    Key key,
    @required this.leading,
    @required this.title,
    @required this.onSelected,
    this.titleStyle,
    this.trailing,
  })  : assert(leading != null),
        assert(title != null),
        assert(onSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Column(
        children: [
          _buildRow(context),
          _buildSeparator(context),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildLeading(),
          _buildTitle(context),
          if (trailing != null) _buildTrailing(),
        ],
      ),
    );
  }

  Widget _buildLeading() {
    return Container(
      padding: const EdgeInsets.only(left: AppThemeConstants.horizontalPagePadding),
      child: leading,
    );
  }

  Widget _buildTrailing() {
    return Container(
      padding: const EdgeInsets.only(right: AppThemeConstants.horizontalPagePadding),
      child: trailing,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        child: Text(
          title,
          style: titleStyle ?? AppTextStyles.body2(context),
        ),
      ),
    );
  }

  Widget _buildSeparator(BuildContext context) {
    return Container(
      height: 2,
      width: double.infinity,
      margin: const EdgeInsets.only(left: AppThemeConstants.horizontalPagePadding),
      color: AppColors.secondaryBackground(context),
    );
  }
}
