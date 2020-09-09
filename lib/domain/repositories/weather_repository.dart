
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';

abstract class WeatherRepository {
  Future<Result<WeatherForecast, Failure>> getWeatherForecast(int woeId);
}