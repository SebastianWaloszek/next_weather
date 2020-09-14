import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';

extension TemperatureUnitDataExtensions on TemperatureUnit {
  String toRawValue() {
    switch (this) {
      case TemperatureUnit.centigrade:
        return _TemperatureUnitRawValues.centigrade;
      case TemperatureUnit.fahrenheit:
        return _TemperatureUnitRawValues.fahrenheit;
      default:
        throw UnsupportedError('$this is not supported');
    }
  }

  static TemperatureUnit fromRawValue(String value) {
    switch (value) {
      case _TemperatureUnitRawValues.centigrade:
        return TemperatureUnit.centigrade;
      case _TemperatureUnitRawValues.fahrenheit:
        return TemperatureUnit.fahrenheit;
      default:
        throw UnsupportedError('$value is not supported');
    }
  }
}

abstract class _TemperatureUnitRawValues {
  static const centigrade = 'C';
  static const fahrenheit = 'F';
}
