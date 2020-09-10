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

  final Axis scrollDirection;

  bool get isHorizontal => scrollDirection == Axis.horizontal;

  const DayWeatherPredictionList({
    Key key,
    @required this.weatherPredictions,
    @required this.onItemSelected,
    this.selectedWeatherPrediction,
    this.scrollDirection = Axis.horizontal,
    this.margin,
  })  : assert(weatherPredictions != null),
        assert(onItemSelected != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: isHorizontal ? AppThemeConstants.shadowBlurRadius : AppThemeConstants.horizontalPagePadding,
        horizontal: isHorizontal ? AppThemeConstants.horizontalPagePadding : AppThemeConstants.shadowBlurRadius,
      ),
      itemBuilder: _buildListItem,
      separatorBuilder: _buildSeparator,
      itemCount: weatherPredictions.length,
      scrollDirection: scrollDirection,
      shrinkWrap: true,
    );
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return SizedBox(
      width: isHorizontal ? itemOffset : null,
      height: isHorizontal ? null : itemOffset,
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final weatherPrediction = weatherPredictions.elementAt(index);
    return Center(
      child: DayWeatherPredictionCell(
        weatherPrediction: weatherPrediction,
        isSelected: weatherPrediction == selectedWeatherPrediction,
        onSelected: onItemSelected,
      ),
    );
  }
}
