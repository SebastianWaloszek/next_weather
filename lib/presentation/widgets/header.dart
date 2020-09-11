import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    Key key,
    @required this.title,
  })  : assert(title != null),
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
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}