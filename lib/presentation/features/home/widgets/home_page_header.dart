import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/utils/extensions/date_time_extensions.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';

class HomePageHeader extends StatelessWidget {
  final WeatherPrediction weatherPrediction;

  final EdgeInsets margin;

  const HomePageHeader({
    Key key,
    this.weatherPrediction,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: weatherPrediction != null ? _buildDayText(context) : Container(),
    );
  }

  Widget _buildDayText(BuildContext context) {
    return Text(
      weatherPrediction.day.format(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.headline3(context),
    );
  }
}
