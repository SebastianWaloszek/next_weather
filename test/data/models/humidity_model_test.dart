import 'package:flutter_next_weather/data/models/humidity_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  test('Should parse JSON to a new humidity model correctly', () {
    final Map<String, dynamic> json = fixture('weather_prediction.json');
    final model = HumidityModel.fromJson(json);
    expect(model.value, json['humidity']);
  });
}
