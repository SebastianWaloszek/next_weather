import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/day_weather_prediction_cell.dart';
import 'package:flutter_next_weather/presentation/widgets/app_theme_constants.dart';

class DayWeatherPredictionList extends StatelessWidget {
  static const double itemOffset = 20;

  final List<WeatherPrediction> weatherPredictions;
  final WeatherPrediction selectedWeatherPrediction;

  final void Function(WeatherPrediction) onItemSelected;

  final EdgeInsets margin;

  const DayWeatherPredictionList({
    Key key,
    @required this.weatherPredictions,
    @required this.onItemSelected,
    this.selectedWeatherPrediction,
    this.margin,
  })  : assert(weatherPredictions != null),
        assert(onItemSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DayWeatherPredictionCell.size,
      margin: margin,
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: AppThemeConstants.shadowBlurRadius,
        horizontal: AppThemeConstants.horizontalPagePadding,
      ),
      itemBuilder: _buildListItem,
      separatorBuilder: _buildSeparator,
      itemCount: weatherPredictions.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
    );
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return SizedBox(width: itemOffset);
  }

  Widget _buildListItem(BuildContext context, int index) {
    final weatherPrediction = weatherPredictions.elementAt(index);
    return DayWeatherPredictionCell(
      weatherPrediction: weatherPrediction,
      isSelected: weatherPrediction == selectedWeatherPrediction,
      onSelected: onItemSelected,
    );
  }
}
