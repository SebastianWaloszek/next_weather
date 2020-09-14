import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/presentation/extensions/speed_unit_ui_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
void 
main() {
  test('Extension should convert 1 mile per hour to kilometers per hour', () {
    const speedUnit = SpeedUnit.kilometersPerHour;
    const milesPerhour = 1.0;
    final kilometersPerHour = speedUnit.getValueFromMilesPerHour(milesPerhour);
    expect(kilometersPerHour, 1);
  });

  test('Extension should convert miles per hour to kilometers per hour', () {
    const speedUnit = SpeedUnit.kilometersPerHour;
    const milesPerhour = 5.0;
    final kilometersPerHour = speedUnit.getValueFromMilesPerHour(milesPerhour);
    expect(kilometersPerHour, 8);
  });

  test('Extension should convert 0 miles per hour to 0 kilometers per hour', () {
    const speedUnit = SpeedUnit.kilometersPerHour;
    const milesPerhour = 0.0;
    final kilometersPerHour = speedUnit.getValueFromMilesPerHour(milesPerhour);
    expect(kilometersPerHour, 0);
  });

  test('Extension should return floored miles per hour value', () {
    const speedUnit = SpeedUnit.milesPerHour;
    const double milesPerhour = 10.1;
    final resultingValue = speedUnit.getValueFromMilesPerHour(milesPerhour);
    expect(resultingValue, 10);
  });
}
