import 'package:flutter_next_weather/data/models/wind_speed_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  test('Should parse JSON to a new wind speed model correctly', () {
    final Map<String, dynamic> json = fixture('weather_prediction.json');
    final model = WindSpeedModel.fromJson(json);
    expect(model.value, json['wind_speed']);
  });
}
