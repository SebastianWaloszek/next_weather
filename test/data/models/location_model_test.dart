import 'package:flutter_next_weather/data/models/location_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  test('Should parse JSON to a new location model correctly', () {
    final Map<String, dynamic> json = fixture('weather_forecast.json');
    final model = LocationModel.fromJson(json);
    expect(model.title, json['title']);
  });
}
