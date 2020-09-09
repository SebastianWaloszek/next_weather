import 'package:flutter_next_weather/data/models/air_pressure_model.dart';
import 'package:flutter_next_weather/data/models/humidity_model.dart';
import 'package:flutter_next_weather/data/models/temperature_model.dart';
import 'package:flutter_next_weather/data/models/weather_state_model.dart';
import 'package:flutter_next_weather/data/models/wind_speed_model.dart';
import 'package:flutter_next_weather/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel.fromJson(Map<String, dynamic> json)
      : super(
          temperature: TemperatureModel.fromJson(json),
          state: WeatherStateModel.fromJson(json),
          airPressure: AirPressureModel.fromJson(json),
          humidity: HumidityModel.fromJson(json),
          windSpeed: WindSpeedModel.fromJson(json),
        );
}
