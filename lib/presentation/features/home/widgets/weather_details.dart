import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/weather.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_detail_factory.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';

class WeatherDetails extends StatelessWidget {
  static const double verticalPadding = 30;

  final Weather weather;

  const WeatherDetails({
    Key key,
    @required this.weather,
  })  : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildScrollView(context),
      decoration: _buildDecoration(context),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border(
        top: AppThemeConstants.getBorderSide(context),
        bottom: AppThemeConstants.getBorderSide(context),
      ),
      color: Colors.white,
    );
  }

  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeConstants.horizontalPagePadding,
        vertical: verticalPadding,
      ),
      child: _buildScrollContent(context),
    );
  }

  Widget _buildScrollContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: WeatherDetailFactory.getWeatherDetails(
        context,
        weather: weather,
      ),
    );
  }
}
