import 'package:flutter_next_weather/domain/entities/speed_unit.dart';

extension SpeedUnitDataExtensions on SpeedUnit {
  String toRawValue() {
    switch (this) {
      case SpeedUnit.milesPerHour:
        return _SpeedUnitRawValues.milesPerHour;
      case SpeedUnit.kilometersPerHour:
        return _SpeedUnitRawValues.kilometersPerHour;
      default:
        throw UnsupportedError('$this is not supported');
    }
  }

  static SpeedUnit fromRawValue(String value) {
    switch (value) {
      case _SpeedUnitRawValues.milesPerHour:
        return SpeedUnit.milesPerHour;
      case _SpeedUnitRawValues.kilometersPerHour:
        return SpeedUnit.kilometersPerHour;
      default:
        throw UnsupportedError('$value is not supported');
    }
  }
}

abstract class _SpeedUnitRawValues {
  static const milesPerHour = 'MILES_PER_HOUR';
  static const kilometersPerHour = 'KILOMETERS_PER_HOUR';
}
