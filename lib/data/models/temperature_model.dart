import 'package:flutter_next_weather/domain/entities/temperature.dart';

class TemperatureModel extends Temperature {
  TemperatureModel.fromJson(Map<String, dynamic> json)
      : super(
          current: json['the_temp'],
          min: json['min_temp'],
          max: json['max_temp'],
        );
}
