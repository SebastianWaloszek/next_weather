import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';

class Header extends StatelessWidget {
  final String title;

  final Key _backButtonKey;

  const Header({
    Key key,
    Key backButtonKey,
    @required this.title,
  })  : assert(title != null),
        _backButtonKey = backButtonKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: AppThemeConstants.horizontalPagePadding,
        top: 20,
        bottom: 10,
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildBackButton(context),
        _buildTitleText(context),
      ],
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.headline3(context),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      key: _backButtonKey,
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryContent(context),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
