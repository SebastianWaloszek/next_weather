import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';
import 'package:flutter_next_weather/presentation/page/page_body_parameters.dart';

class HomePageBodyParameters extends PageBodyParameters {
  final WeatherForecast weatherForecast;
  final void Function() loadWeatherForecast;
  final bool isLoading;

  HomePageBodyParameters(
    BuildContext context, {
    this.weatherForecast,
    @required this.loadWeatherForecast,
    @required this.isLoading,
  })  : assert(loadWeatherForecast != null),
        assert(isLoading != null),
        super(context: context);
}
