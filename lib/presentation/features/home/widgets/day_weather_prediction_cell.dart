import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/utils/extensions/date_time_extensions.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/presentation/theme/app_text_styles.dart';
import 'package:flutter_next_weather/presentation/theme/color/app_colors.dart';
import 'package:flutter_next_weather/presentation/widgets/rounded_shadow_container.dart';
import 'package:flutter_next_weather/presentation/widgets/temperature_range_label.dart';
import 'package:flutter_next_weather/presentation/widgets/rectangular_network_image.dart';

class DayWeatherPredictionCell extends StatelessWidget {
  static const double size = 140;
  static const double imageSize = 50;
  static const double cellPadding = 10;

  final WeatherPrediction weatherPrediction;
  final void Function(WeatherPrediction) onSelected;
  final bool isSelected;

  const DayWeatherPredictionCell({
    Key key,
    @required this.weatherPrediction,
    @required this.onSelected,
    @required this.isSelected,
  })  : assert(weatherPrediction != null),
        assert(onSelected != null),
        assert(isSelected != null),
        super(key: key);

  Color _getTextColor(BuildContext context) {
    return isSelected ? AppColors.buttonContent(context) : AppColors.primaryContent(context);
  }

  @override
  Widget build(BuildContext context) {
    return RoundedShadowContainer(
      height: size,
      padding: const EdgeInsets.all(cellPadding),
      width: size,
      color: isSelected ? AppColors.secondaryAccent(context) : AppColors.secondaryBackground(context),
      onTapped: () => onSelected(weatherPrediction),
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildDayOfWeekText(context),
        _buildWeatherStateImage(context),
        _buildTemperatureRangeText(context),
      ],
    );
  }

  Widget _buildDayOfWeekText(BuildContext context) {
    return Text(
      weatherPrediction.day.dayOfWeekAbbreviated(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.headline4(
        context,
        color: _getTextColor(context),
      ),
    );
  }

  Widget _buildWeatherStateImage(BuildContext context) {
    return RectangularNetworkImage(
      imageUrl: weatherPrediction.weather.state.imageUrl,
      size: imageSize,
    );
  }

  Widget _buildTemperatureRangeText(BuildContext context) {
    return TemperatureRangeLabel(
      temperature: weatherPrediction.weather.temperature,
      textStyle: AppTextStyles.headline4(
        context,
        color: _getTextColor(context),
      ),
    );
  }
}
