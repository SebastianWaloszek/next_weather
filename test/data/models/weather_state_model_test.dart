import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/data/extensions/weather_type_data_extensions.dart';
import 'package:flutter_next_weather/data/models/weather_state_model.dart';
import 'package:test/test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());

  test('Should parse JSON to a new weather state model correctly', () {
    final Map<String, dynamic> json = fixture('weather_prediction.json');
    final model = WeatherStateModel.fromJson(json);
    expect(model.description, json['weather_state_name']);
    expect(model.type, WeatherTypeDataExtensions.fromAbbreviation(json['weather_state_abbr']));
    expect(model.imageUrl, '${Environment.current.baseUrl}static/img/weather/png/${json['weather_state_abbr']}.png');
  });
}
