import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/humidity_unit.dart';
import 'package:flutter_next_weather/domain/entities/pressure_unit.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/weather.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_detail.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';

abstract class WeatherDetailFactory {
  static List<Widget> getWeatherDetails(BuildContext context, {@required Weather weather}) {
    return [
      _buildHumidityDetail(context, weather),
      _buildPressureDetail(context, weather),
      _buildWindDetail(context, weather),
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

  static Widget _buildWindDetail(BuildContext context, Weather weather) {
    return WeatherDetail(
      title: AppLocalizations.of(context).wind(),
      value: weather.windSpeed.value.floor(),
      valueUnit: SpeedUnit.milesPerHour.getDescription(context), // TODO: Change when enabling changing units
    );
  }
}
