import 'package:flutter_next_weather/domain/entities/temperature.dart';

class TemperatureModel extends Temperature {
  const TemperatureModel({
    int current,
    int min,
    int max,
  }) : super(
          current: current,
          min: min,
          max: max,
        );

  TemperatureModel.fromJson(Map<String, dynamic> json)
      : super(
          current: json['the_temp']?.floor(),
          min: json['min_temp']?.floor(),
          max: json['max_temp']?.floor(),
        );
}
