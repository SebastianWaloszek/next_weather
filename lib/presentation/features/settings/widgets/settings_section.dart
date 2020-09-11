import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> rows;

  const SettingsSection({
    this.title,
    @required this.rows,
  }) : assert(rows != null);

  bool get hasTitle => title != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (hasTitle) _buildTitle(context),
        _buildOptions(),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: AppThemeConstants.horizontalPagePadding),
      child: Text(
        title,
        style: AppTextStyles.headline4(
          context,
          color: AppColors.secondaryContent(context),
        ),
      ),
    );
  }

  Widget _buildOptions() {
    return Column(children: rows);
  }
}
