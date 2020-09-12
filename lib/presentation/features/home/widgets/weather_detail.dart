import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/animated_unit_number_text.dart';

class WeatherDetail extends StatelessWidget {
  final String title;
  final int value;
  final String valueUnit;

  const WeatherDetail({
    Key key,
    @required this.title,
    @required this.value,
    @required this.valueUnit,
  })  : assert(title != null),
        assert(value != null),
        assert(valueUnit != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTitleText(context),
        _buildValueTextContainer(context),
      ],
    );
  }

  Widget _buildTitleText(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.subtitle1(
        context,
        color: AppColors.secondaryContent(context),
      ),
    );
  }

  Widget _buildValueTextContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: AnimatedUnitNumberText(
        value: value,
        valueUnit: valueUnit,
        valueTextStyle: AppTextStyles.body1(context),
        valueUnitTextStyle: AppTextStyles.body2(context),
      ),
    );
  }
}
