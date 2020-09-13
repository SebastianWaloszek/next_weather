import 'dart:convert';

import 'package:flutter_next_weather/domain/entities/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';

class AppSettingsModel extends AppSettings {
  static const themeKey = 'theme';
  static const temperatureUnitKey = 'temperatureUnit';
  static const windSpeedUnitKey = 'windSpeedUnit';

  const AppSettingsModel({
    @required ThemeMode themeMode,
    @required TemperatureUnit temperatureUnit,
    @required SpeedUnit windSpeedUnit,
  }) : super(
          themeMode: themeMode,
          temperatureUnit: temperatureUnit,
          windSpeedUnit: windSpeedUnit,
        );

  const AppSettingsModel.defaultSettings()
      : super(
          themeMode: ThemeMode.light,
          temperatureUnit: TemperatureUnit.centigrade,
          windSpeedUnit: SpeedUnit.kilometersPerHour,
        );

  @override
  String toJson() {
    final map = {
      themeKey: themeMode.toString(),
      temperatureUnitKey: temperatureUnit.toRawValue(),
      windSpeedUnitKey: windSpeedUnit.toRawValue(),
    };
    return json.encode(map);
  }

  factory AppSettingsModel.fromJson(String jsonString) {
    if (jsonString == null) {
      return null;
    }
    final jsonMap = json.decode(jsonString) as Map<dynamic, dynamic>;
    final Map<String, String> settingsMap = Map<String, String>.from(jsonMap);
    const defaultSettings = AppSettingsModel.defaultSettings();
    return AppSettingsModel(
      themeMode: _themeModeFromString(settingsMap[themeKey]) ?? defaultSettings.themeMode,
      temperatureUnit:
          TemperatureUnitExtensions.fromRawValue(settingsMap[temperatureUnitKey]) ?? defaultSettings.temperatureUnit,
      windSpeedUnit: SpeedUnitExtensions.fromRawValue(settingsMap[windSpeedUnitKey]) ?? defaultSettings.windSpeedUnit,
    );
  }

  static ThemeMode _themeModeFromString(String s) {
    return ThemeMode.values.firstWhere((e) => e.toString() == s, orElse: () => null);
  }

  @override
  AppSettings copyWith({
    ThemeMode themeMode,
    TemperatureUnit temperatureUnit,
    SpeedUnit windSpeedUnit,
  }) {
    return AppSettingsModel(
      themeMode: themeMode ?? this.themeMode,
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
      windSpeedUnit: windSpeedUnit ?? this.windSpeedUnit,
    );
  }
}
