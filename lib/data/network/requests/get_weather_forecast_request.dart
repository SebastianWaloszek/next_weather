import 'package:flutter_next_weather/data/models/weather_forecast_model.dart';
import 'package:flutter_next_weather/data/network/request.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';

class GetWeatherForecastRequest extends Request<WeatherForecast> {
  GetWeatherForecastRequest(
    int woeId,
  ) : super(
          path: 'api/location/$woeId',
        );

  @override
  WeatherForecast createResponse(dynamic json) => WeatherForecastModel.fromJson(
        json as Map<String, dynamic>,
      );
}
