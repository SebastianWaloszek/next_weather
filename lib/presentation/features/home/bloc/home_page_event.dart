part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class LoadHomePageEvent extends HomePageEvent {}

class SelectWeatherPreditionEvent extends HomePageEvent {
  final WeatherPrediction weatherPrediction;

  const SelectWeatherPreditionEvent(
    this.weatherPrediction,
  );
}
