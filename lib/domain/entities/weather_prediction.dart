import 'package:equatable/equatable.dart';
import 'package:flutter_next_weather/domain/entities/weather.dart';
import 'package:meta/meta.dart';

abstract class WeatherPrediction extends Equatable {
  final DateTime day;
  final Weather weather;

  const WeatherPrediction({
    @required this.day,
    @required this.weather,
  })  : assert(day != null),
        assert(weather != null);

  @override
  List<Object> get props => [
        day,
        weather,
      ];
}
