import 'package:flutter_next_weather/data/models/weather_forecast_model.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';

import '../fixtures/fixture_reader.dart';

abstract class TestData {
  static WeatherForecast weatherForecast = WeatherForecastModel.fromJson(
    fixture('weather_forecast.json'),
  );
}
