import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/data/models/weather_model.dart';
import 'package:flutter_next_weather/data/models/weather_prediction_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());
  test('Should parse JSON to a new weather prediction model correctly', () {
    final Map<String, dynamic> json = fixture('weather_prediction.json');
    final model = WeatherPredictionModel.fromJson(json);
    expect(model.day, DateTime.tryParse(json['applicable_date']));
    expect(model.weather, WeatherModel.fromJson(json));
  });
}
