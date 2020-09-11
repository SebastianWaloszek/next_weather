import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/utils/extensions/date_time_extensions.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/button.dart';

class HomePageHeader extends StatelessWidget {
  final WeatherPrediction weatherPrediction;

  final EdgeInsets margin;

  final void Function() onSettingsTapped;

  const HomePageHeader({
    Key key,
    this.weatherPrediction,
    this.margin,
    @required this.onSettingsTapped,
  })  : assert(onSettingsTapped != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        weatherPrediction != null ? _buildDayText(context) : Container(),
        _buildSettingsIcon(context),
      ],
    );
  }

  Widget _buildDayText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          weatherPrediction.day.dayOfWeek(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.headline3(context),
        ),
        Text(
          weatherPrediction.day.format(),
          style: AppTextStyles.subtitle1(
            context,
            color: AppColors.secondaryContent(context),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsIcon(BuildContext context) {
    return Button(
      width: 40,
      onTapped: onSettingsTapped,
      icon: Icons.settings_outlined,
    );
  }
}
