import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/humidity_unit.dart';
import 'package:flutter_next_weather/domain/entities/pressure_unit.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/weather.dart';
import 'package:flutter_next_weather/presentation/extensions/huminidty_unit_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/extensions/pressure_unit_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/extensions/speed_unit_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_detail.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/presentation/mixins/global_settings.dart';

abstract class WeatherDetailFactory with GlobalSettings {
  static List<Widget> getWeatherDetails(
    BuildContext context, {
    @required Weather weather,
    @required SpeedUnit windSpeedUnit,
  }) {
    return [
      _buildHumidityDetail(context, weather),
      _buildPressureDetail(context, weather),
      _buildWindDetail(context, weather, windSpeedUnit),
    ];
  }

  static Widget _buildHumidityDetail(BuildContext context, Weather weather) {
    return WeatherDetail(
      title: AppLocalizations.of(context).humidity(),
      value: weather.humidity.value,
      valueUnit: HumidityUnit.percentage.getDescription(context),
    );
  }

  static Widget _buildPressureDetail(BuildContext context, Weather weather) {
    return WeatherDetail(
      title: AppLocalizations.of(context).pressure(),
      value: weather.airPressure.value.floor(),
      valueUnit: PressureUnit.hectopascals.getDescription(context),
    );
  }

  static Widget _buildWindDetail(BuildContext context, Weather weather, SpeedUnit windSpeedUnit) {
    return WeatherDetail(
      title: AppLocalizations.of(context).wind(),
      value: windSpeedUnit.getValueFromMilesPerHour(weather.windSpeed.value).floor(),
      valueUnit: windSpeedUnit.getDescription(context),
    );
  }
}
