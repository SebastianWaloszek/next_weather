import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/data/models/location_model.dart';
import 'package:flutter_next_weather/data/models/weather_forecast_model.dart';
import 'package:flutter_next_weather/data/models/weather_prediction_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());
  test('Should parse JSON to a new weather forecast model correctly', () {
    final Map<String, dynamic> json = fixture('weather_forecast.json');
    final model = WeatherForecastModel.fromJson(json);
    expect(model.location, LocationModel.fromJson(json));
    expect(
      model.weatherPredictions,
      List<WeatherPredictionModel>.from(
        json['consolidated_weather'].map(
          (weatherPrediction) => WeatherPredictionModel.fromJson(weatherPrediction),
        ),
      ),
    );
  });
}
