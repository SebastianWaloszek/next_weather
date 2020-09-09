import 'package:flutter_next_weather/data/models/location_model.dart';
import 'package:flutter_next_weather/data/models/weather_prediction_model.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';

class WeatherForecastModel extends WeatherForecast {
  WeatherForecastModel.fromJson(Map<String, dynamic> json)
      : super(
          location: LocationModel.fromJson(json),
          weatherPredictions: List<WeatherPredictionModel>.from(
            json['consolidated_weather'].map(
              (weatherPrediction) => WeatherPredictionModel.fromJson(weatherPrediction),
            ),
          ),
        );
}
