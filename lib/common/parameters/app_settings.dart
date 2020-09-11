import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:meta/meta.dart';

class AppSettings extends Equatable {
  static const themeKey = 'theme';
  static const temperatureUnitKey = 'temperatureUnit';
  static const windSpeedUnitKey = 'windSpeedUnit';

  final ThemeMode themeMode;
  final TemperatureUnit temperatureUnit;
  final SpeedUnit windSpeedUnit;

  const AppSettings({
    @required this.themeMode,
    @required this.temperatureUnit,
    @required this.windSpeedUnit,
  })  : assert(themeMode != null),
        assert(temperatureUnit != null),
        assert(windSpeedUnit != null);

  const AppSettings.defaultSettings()
      : themeMode = ThemeMode.light,
        temperatureUnit = TemperatureUnit.centigrade,
        windSpeedUnit = SpeedUnit.kilometersPerHour;

  AppSettings copyWith({
    ThemeMode themeMode,
    TemperatureUnit temperatureUnit,
    SpeedUnit windSpeedUnit,
  }) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
      windSpeedUnit: windSpeedUnit ?? this.windSpeedUnit,
    );
  }

  @override
  List<Object> get props => [
        themeMode,
        temperatureUnit,
        windSpeedUnit,
      ];

  //      //
  // JSON //
  //      //
  String toJson() {
    final map = {
      themeKey: themeMode.toString(),
      temperatureUnitKey: temperatureUnit.toRawValue(),
      windSpeedUnitKey: windSpeedUnit.toRawValue(),
    };
    return json.encode(map);
  }

  factory AppSettings.fromJson(String jsonString) {
    if (jsonString == null) {
      return null;
    }
    final jsonMap = json.decode(jsonString) as Map<dynamic, dynamic>;
    final Map<String, String> settingsMap = Map<String, String>.from(jsonMap);
    final defaultSettings = AppSettings.defaultSettings();
    return AppSettings(
      themeMode: _themeModeFromString(settingsMap[themeKey]) ?? defaultSettings.themeMode,
      temperatureUnit:
          TemperatureUnitExtensions.fromRawValue(settingsMap[temperatureUnitKey]) ?? defaultSettings.temperatureUnit,
      windSpeedUnit: SpeedUnitExtensions.fromRawValue(settingsMap[windSpeedUnitKey]) ?? defaultSettings.windSpeedUnit,
    );
  }

  static ThemeMode _themeModeFromString(String s) {
    return ThemeMode.values.firstWhere((e) => e.toString() == s, orElse: () => null);
  }
}