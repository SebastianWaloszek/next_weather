import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';
import 'package:flutter_next_weather/domain/use_cases/weather/get_weather_forecast.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
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
    }
  }

  Stream<HomePageState> _handleLoadWeatherForecast(LoadHomePageEvent event) async* {
    yield LoadingHomePageState.fromState(state);

    final result = await getWeatherForecast(2487956); // TODO: Replace San Francisco woeId placeholder
    yield* result.fold(
      onSuccess: (weatherForecast) async* {
        yield LoadedHomePageState(weatherForecast);
      },
      onFailure: (failure) async* {
        yield FailedHomePageState.fromState(
          state,
          failure: failure,
        );
      },
    );
  }
}
