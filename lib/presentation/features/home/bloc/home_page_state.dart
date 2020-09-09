part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState extends Equatable {
  final WeatherForecast weatherForecast;

  const HomePageState({
    @required this.weatherForecast,
  });

  @override
  List<Object> get props => [
        weatherForecast,
      ];
}

class LoadingHomePageState extends HomePageState {
  const LoadingHomePageState();

  LoadingHomePageState.fromState(HomePageState state)
      : super(
          weatherForecast: state.weatherForecast,
        );
}

class LoadedHomePageState extends HomePageState {
  LoadedHomePageState(WeatherForecast weatherForecast)
      : super(
          weatherForecast: weatherForecast,
        );
}

class FailedHomePageState extends HomePageState {
  final Failure failure;

  FailedHomePageState.fromState(
    HomePageState state, {
    @required this.failure,
  })  : assert(failure != null),
        super(
          weatherForecast: state.weatherForecast,
        );
}
