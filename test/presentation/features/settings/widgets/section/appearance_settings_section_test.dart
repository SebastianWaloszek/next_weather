import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/section/appearance_settings_section.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/settings_row.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widgets/utils/localized_material_app.dart';

void main() {
  const themeMode = ThemeMode.dark;
  const temperatureUnit = TemperatureUnit.centigrade;
  const windSpeedUnit = SpeedUnit.kilometersPerHour;
  final settings = [
    themeMode,
    temperatureUnit,
    windSpeedUnit,
  ];

  void onThemeRowSelected() {}
  void onTemperatureUnitRowSelected() {}
  void onWindSpeedUnitRowSelected() {}

  testWidgets('SettingsSection should show all settings sections with corresponding onSelection handler',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: AppearanceSettingsSection(
          themeMode: themeMode,
          temperatureUnit: temperatureUnit,
          windSpeedUnit: windSpeedUnit,
          ontemperatureUnitRowSelected: onTemperatureUnitRowSelected,
          onThemeRowSelected: onThemeRowSelected,
          onWindSpeedUnitRowSelected: onWindSpeedUnitRowSelected,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final rowFinder = find.byType(SettingsRow);
    expect(rowFinder, findsNWidgets(settings.length));

    final List<SettingsRow> rows = List<SettingsRow>.from(tester.widgetList(rowFinder));
    final themeRow = rows[0];
    final temperatureUnitRow = rows[1];
    final windSpeedUnitRow = rows[2];

    expect(themeRow.onSelected, onThemeRowSelected);
    expect(temperatureUnitRow.onSelected, onTemperatureUnitRowSelected);
    expect(windSpeedUnitRow.onSelected, onWindSpeedUnitRowSelected);
  });
}
