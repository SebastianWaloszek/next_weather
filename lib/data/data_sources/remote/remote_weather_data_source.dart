import 'package:flutter_next_weather/common/result/result.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/data/data_sources/weather_data_source.dart';
import 'package:flutter_next_weather/data/network/network_service.dart';
import 'package:flutter_next_weather/data/network/requests/get_weather_forecast_request.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';
import 'package:meta/meta.dart';

class RemoteWeatherDataSource implements WeatherDataSource {
  final NetworkService networkService;

  const RemoteWeatherDataSource({
    @required this.networkService,
  }) : assert(networkService != null);

  @override
  Future<Result<WeatherForecast, Failure>> getWeatherForecast(int woeId) {
    final request = GetWeatherForecastRequest(woeId);
    return networkService.make(request);
  }
}
