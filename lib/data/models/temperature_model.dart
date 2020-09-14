import 'package:flutter_next_weather/domain/entities/temperature.dart';

class TemperatureModel extends Temperature {
  const TemperatureModel({
    int average,
    int min,
    int max,
  }) : super(
          average: average,
          min: min,
          max: max,
        );

  TemperatureModel.fromJson(Map<String, dynamic> json)
      : super(
          average: json['the_temp']?.floor(),
          min: json['min_temp']?.floor(),
          max: json['max_temp']?.floor(),
        );
}
