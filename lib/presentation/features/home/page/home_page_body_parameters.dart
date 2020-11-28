import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/presentation/page/page_body_parameters.dart';

class HomePageBodyParameters extends PageBodyParameters {
  final WeatherForecast weatherForecast;
  final void Function() loadWeatherForecast;

  final WeatherPrediction selectedWeatherPrediction;
  final void Function(WeatherPrediction) selectWeatherPredition;
  final void Function() changeLocation;

  final void Function() openSettings;

  final Completer<void> refreshCompleter;
  final bool wasLoadedOnce;
  final bool isLoading;

  final Failure failure;

  HomePageBodyParameters(
    BuildContext context, {
    this.weatherForecast,
    this.selectedWeatherPrediction,
    @required this.loadWeatherForecast,
    @required this.selectWeatherPredition,
    @required this.openSettings,
    @required this.changeLocation,
    @required this.refreshCompleter,
    @required this.wasLoadedOnce,
    @required this.isLoading,
    this.failure,
  })  : assert(loadWeatherForecast != null),
        assert(selectWeatherPredition != null),
        assert(openSettings != null),
        assert(changeLocation != null),
        assert(refreshCompleter != null),
        assert(wasLoadedOnce != null),
        super(context: context);
}
