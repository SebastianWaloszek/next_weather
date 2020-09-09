
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';
import 'package:flutter_next_weather/domain/repositories/weather_repository.dart';
import 'package:flutter_next_weather/domain/use_cases/use_case.dart';
import 'package:meta/meta.dart';

class GetWeatherForecast extends UseCase<WeatherForecast, int> {
  final WeatherRepository weatherRepository;

  const GetWeatherForecast({
    @required this.weatherRepository,
  }) : assert(weatherRepository != null);

  @override
  Future<Result<WeatherForecast, Failure>> call(int woeId) {
    return weatherRepository.getWeatherForecast(woeId);
  }
}