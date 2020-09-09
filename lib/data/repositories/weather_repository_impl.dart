import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/data/data_sources/weather_data_source.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';
import 'package:flutter_next_weather/domain/repositories/weather_repository.dart';
import 'package:meta/meta.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource dataSource;

  const WeatherRepositoryImpl({
    @required this.dataSource,
  }) : assert(dataSource != null);

  @override
  Future<Result<WeatherForecast, Failure>> getWeatherForecast(int woeId) {
    return dataSource.getWeatherForecast(woeId);
  }
}
