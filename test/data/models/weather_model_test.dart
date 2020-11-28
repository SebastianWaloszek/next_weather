import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/data/models/air_pressure_model.dart';
import 'package:flutter_next_weather/data/models/humidity_model.dart';
import 'package:flutter_next_weather/data/models/temperature_model.dart';
import 'package:flutter_next_weather/data/models/weather_model.dart';
import 'package:flutter_next_weather/data/models/weather_state_model.dart';
import 'package:flutter_next_weather/data/models/wind_speed_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());
  test('Should parse JSON to a new weather model correctly', () {
    final Map<String, dynamic> json = fixture('weather_prediction.json');
    final model = WeatherModel.fromJson(json);
    expect(model.airPressure, AirPressureModel.fromJson(json));
    expect(model.humidity, HumidityModel.fromJson(json));
    expect(model.state, WeatherStateModel.fromJson(json));
    expect(model.temperature, TemperatureModel.fromJson(json));
    expect(model.windSpeed, WindSpeedModel.fromJson(json));
  });
}
