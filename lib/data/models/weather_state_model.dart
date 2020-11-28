import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/data/extensions/weather_type_data_extensions.dart';
import 'package:flutter_next_weather/domain/entities/weather_state.dart';

class WeatherStateModel extends WeatherState {
  WeatherStateModel.fromJson(Map<String, dynamic> json)
      : super(
          description: json['weather_state_name'] as String,
          type: WeatherTypeDataExtensions.fromAbbreviation(
              json['weather_state_abbr'] as String),
          imageUrl:
              '${Environment.current.baseUrl}static/img/weather/png/${json['weather_state_abbr']}.png',
        );
}
