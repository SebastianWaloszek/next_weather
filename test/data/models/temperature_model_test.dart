import 'package:flutter_next_weather/data/models/temperature_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const weatherPredictionJsonName = 'weather_prediction.json';
  final minTemp = fixture(weatherPredictionJsonName)['min_temp']?.floor();
  final theTemp = fixture(weatherPredictionJsonName)['the_temp']?.floor();
  final maxTemp = fixture(weatherPredictionJsonName)['max_temp']?.floor();

  test('Should parse JSON to a new temperature model correctly', () {
    final Map<String, dynamic> json = fixture(weatherPredictionJsonName);
    final model = TemperatureModel.fromJson(json);
    expect(model.min, minTemp);
    expect(model.current, theTemp);
    expect(model.max, maxTemp);
  });

  test('Should parse JSON with null min temp to a new model correctly', () {
    final Map<String, dynamic> json = fixture(weatherPredictionJsonName);
    json['min_temp'] = null;

    final model = TemperatureModel.fromJson(json);
    expect(model.min, isNull);
    expect(model.current, theTemp);
    expect(model.max, maxTemp);
  });

  test('Should parse JSON with the temp to a new model correctly', () {
    final Map<String, dynamic> json = fixture(weatherPredictionJsonName);
    json['the_temp'] = null;

    final model = TemperatureModel.fromJson(json);
    expect(model.min, minTemp);
    expect(model.current, isNull);
    expect(model.max, maxTemp);
  });

  test('Should parse JSON with max temp to a new model correctly', () {
    final Map<String, dynamic> json = fixture(weatherPredictionJsonName);
    json['max_temp'] = null;

    final model = TemperatureModel.fromJson(json);
    expect(model.min, minTemp);
    expect(model.current, theTemp);
    expect(model.max, isNull);
  });
}
