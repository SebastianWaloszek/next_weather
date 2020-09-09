import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/domain/entities/weather_state.dart';
import 'package:flutter_next_weather/domain/entities/weather_type.dart';

class WeatherStateModel extends WeatherState {
  WeatherStateModel.fromJson(Map<String, dynamic> json)
      : super(
          description: json['weather_state_name'],
          type: WeatherTypeExtensions.fromAbbreviation(json['weather_state_abbr']),
          imageUrl: '${Environment.current.baseUrl}static/img/weather/png/${json['weather_state_abbr']}.png',
        );
}
