import 'package:flutter_next_weather/data/models/weather_model.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';

class WeatherPredictionModel extends WeatherPrediction {
  WeatherPredictionModel.fromJson(Map<String, dynamic> json)
      : super(
          day: DateTime.tryParse(json['applicable_date']),
          weather: WeatherModel.fromJson(json),
        );
}
