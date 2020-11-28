import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/result/failure_result.dart';
import 'package:flutter_next_weather/common/result/success_result.dart';
import 'package:flutter_next_weather/domain/entities/weather_forecast.dart';
import 'package:flutter_next_weather/domain/use_cases/weather/get_weather_forecast.dart';
import 'package:flutter_next_weather/presentation/features/home/bloc/home_page_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/test_data.dart';

class GetWeatherForecastMock extends Mock implements GetWeatherForecast {}

void main() {
  Environment.setCurrent(DevelopmentEnvironment());

  GetWeatherForecast getWeatherForecast;
  HomePageBloc bloc;
  final weatherForecast = TestData.weatherForecast;

  final successLoadResult = SuccessResult<WeatherForecast, Failure>(weatherForecast);
  final failure = UnexpectedFailure();
  final failedLoadResult = FailureResult<WeatherForecast, Failure>(failure);

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    getWeatherForecast = GetWeatherForecastMock();
    bloc = HomePageBloc(getWeatherForecast: getWeatherForecast);
  });

  blocTest(
    'Should emit correct states when loading weather forecast succeeds',
    build: () {
      when(getWeatherForecast.call(any)).thenAnswer((_) async => successLoadResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(LoadHomePageEvent());
    },
    expect: [
      const LoadingHomePageState(),
      LoadedHomePageState(weatherForecast, weatherForecast.weatherPredictions.first),
    ],
  );

  blocTest(
    'Should emit correct states when loading weather forecast fails',
    build: () {
      when(getWeatherForecast.call(any)).thenAnswer((_) async => failedLoadResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(LoadHomePageEvent());
    },
    expect: [
      const LoadingHomePageState(),
      FailedHomePageState(failure),
    ],
  );

  blocTest(
    'Should emit correct states when changing selected weather prediction',
    build: () {
      when(getWeatherForecast.call(any)).thenAnswer((_) async => successLoadResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(SelectWeatherPreditionEvent(weatherForecast.weatherPredictions.first));
    },
    expect: [
      LoadedHomePageState(null, weatherForecast.weatherPredictions.first),
    ],
  );

  blocTest(
    'Should emit correct states when loading weather forecast succeeds and changing selected weather prediction',
    build: () {
      when(getWeatherForecast.call(any)).thenAnswer((_) async => successLoadResult);
      return bloc;
    },
    act: (bloc) async {
      bloc.add(LoadHomePageEvent());
      return bloc.add(SelectWeatherPreditionEvent(weatherForecast.weatherPredictions.last));
    },
    expect: [
      const LoadingHomePageState(),
      LoadedHomePageState(weatherForecast, weatherForecast.weatherPredictions.first),
      LoadedHomePageState(weatherForecast, weatherForecast.weatherPredictions.last),
    ],
  );
}
