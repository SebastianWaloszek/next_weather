import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:meta/meta.dart';

abstract class AppSettings extends Equatable {
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

  AppSettings copyWith({
    ThemeMode themeMode,
    TemperatureUnit temperatureUnit,
    SpeedUnit windSpeedUnit,
  });

  String toJson();

  @override
  List<Object> get props => [
        themeMode,
        temperatureUnit,
        windSpeedUnit,
      ];
}
