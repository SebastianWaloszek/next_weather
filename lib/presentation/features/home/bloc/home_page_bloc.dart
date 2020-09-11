import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/utils/extensions/date_time_extensions.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/domain/use_cases/weather/get_weather_forecast.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  static const int cityWoeId = 638242; // TODO: Replace Berlin woeId placeholder

  static HomePageState get initialState => LoadingHomePageState();

  final GetWeatherForecast getWeatherForecast;

  HomePageBloc({
    @required this.getWeatherForecast,
  })  : assert(getWeatherForecast != null),
        super(initialState);

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is LoadHomePageEvent) {
      yield* _handleLoadWeatherForecast(event);
    } else if (event is SelectWeatherPreditionEvent) {
      yield* _handleSelectWeatherPredition(event);
    }
  }

  Stream<HomePageState> _handleLoadWeatherForecast(LoadHomePageEvent event) async* {
    yield LoadingHomePageState.fromState(state);
    final result = await getWeatherForecast(cityWoeId);
    yield* result.fold(
      onSuccess: (weatherForecast) async* {
        yield LoadedHomePageState(
          weatherForecast,
          // Use _getSelectedWeatherPrediction for selecting same day as previously selected
          // Didn't use it here because it looks from the user perspective like the weather data wasn't
          // changed but it was.
          weatherForecast?.weatherPredictions?.first,
        );
      },
      onFailure: (failure) async* {
        yield FailedHomePageState(failure);
      },
    );
  }

  WeatherPrediction _getSelectedWeatherPrediction(WeatherForecast weatherForecast) {
    return weatherForecast?.weatherPredictions?.firstWhere(
          (weatherPrediction) => weatherPrediction.day.isSameDay(state.selectedWeatherPrediction?.day),
        ) ??
        weatherForecast?.weatherPredictions?.first;
  }

  Stream<HomePageState> _handleSelectWeatherPredition(SelectWeatherPreditionEvent event) async* {
    yield LoadedHomePageState.fromState(
      state,
      selectedWeatherPrediction: event.weatherPrediction,
    );
  }
}
