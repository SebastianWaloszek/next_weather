import 'package:equatable/equatable.dart';

import 'package:flutter_next_weather/domain/entities/location.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:meta/meta.dart';

class WeatherForecast extends Equatable {
  final Location location;
  final List<WeatherPrediction> weatherPredictions;

  const WeatherForecast({
    @required this.location,
    @required this.weatherPredictions,
  })  : assert(location != null),
        assert(weatherPredictions != null);

  @override
  List<Object> get props => [
        location,
        weatherPredictions,
      ];
}
