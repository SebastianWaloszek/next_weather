import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/utils/extensions/widget_extensions.dart';
import 'package:flutter_next_weather/domain/entities/weather.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_detail_factory.dart';
import 'package:flutter_next_weather/presentation/mixins/global_settings.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';
import 'package:flutter_next_weather/presentation/widgets/screen_dependent.dart';

class WeatherDetails extends StatelessWidget with GlobalSettings {
  static const double verticalPadding = 30;

  final Weather weather;

  final Axis scrollDirection;

  bool get isVertical => scrollDirection == Axis.vertical;

  const WeatherDetails({
    Key key,
    @required this.weather,
    this.scrollDirection = Axis.vertical,
  })  : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildScrollContent(context),
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeConstants.horizontalPagePadding,
        vertical: verticalPadding,
      ),
      decoration: _buildDecoration(context),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border(
        top: isVertical ? BorderSide.none : borderSide(context),
        bottom: isVertical ? BorderSide.none : borderSide(context),
        left: isVertical ? borderSide(context) : BorderSide.none,
        right: isVertical ? borderSide(context) : BorderSide.none,
      ),
    );
  }

  Widget _buildScrollContent(BuildContext context) {
    return ScreenDependent(
      wide: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: WeatherDetailFactory.getWeatherDetails(
          context,
          weather: weather,
          windSpeedUnit: settings.windSpeedUnit,
        ),
      ),
      narrow: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: WeatherDetailFactory.getWeatherDetails(
          context,
          weather: weather,
          windSpeedUnit: settings.windSpeedUnit,
        ),
      ),
    );
  }
}
