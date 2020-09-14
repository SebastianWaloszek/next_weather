import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:flutter_next_weather/presentation/extensions/temperature_unit_ui_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Extension should convert centigrades to fahrenheits', () {
    const temperatureUnit = TemperatureUnit.fahrenheit;
    const certigrades = 11;
    final fahrenheits = temperatureUnit.getValueFromCertigrade(certigrades);
    expect(fahrenheits, 51);
  });

  test('Extension should return centigrades', () {
    const temperatureUnit = TemperatureUnit.centigrade;
    const certigrades = 11;
    final resultingValue = temperatureUnit.getValueFromCertigrade(certigrades);
    expect(resultingValue, 11);
  });
}
