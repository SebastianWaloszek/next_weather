part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState extends Equatable {
  final WeatherForecast weatherForecast;
  final WeatherPrediction selectedWeatherPrediction;
  final Failure failure;

  const HomePageState({
    this.weatherForecast,
    this.selectedWeatherPrediction,
    this.failure,
  });

  @override
  List<Object> get props => [
        weatherForecast,
        selectedWeatherPrediction,
      ];
}

class LoadingHomePageState extends HomePageState {
  const LoadingHomePageState();

  LoadingHomePageState.fromState(HomePageState state)
      : super(
          weatherForecast: state.weatherForecast,
          selectedWeatherPrediction: state.selectedWeatherPrediction,
        );
}

class LoadedHomePageState extends HomePageState {
  const LoadedHomePageState(WeatherForecast weatherForecast, WeatherPrediction selectedWeatherPrediction)
      : super(
          weatherForecast: weatherForecast,
          selectedWeatherPrediction: selectedWeatherPrediction,
        );

  LoadedHomePageState.fromState(HomePageState state, {WeatherPrediction selectedWeatherPrediction})
      : super(
          weatherForecast: state.weatherForecast,
          selectedWeatherPrediction: selectedWeatherPrediction ?? state.selectedWeatherPrediction,
        );
}

class FailedHomePageState extends HomePageState {
  const FailedHomePageState(Failure failure) : super(failure: failure);
}
