import 'package:flutter_next_weather/data/models/air_pressure_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  test('Should parse JSON to a new air pressure model correctly', () {
    final Map<String, dynamic> json = fixture('weather_prediction.json');
    final model = AirPressureModel.fromJson(json);
    expect(model.value, json['air_pressure']);
  });
}
