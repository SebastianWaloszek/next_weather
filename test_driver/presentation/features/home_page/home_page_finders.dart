import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_next_weather/presentation/features/home/page/home_page_keys.dart';

abstract class HomePageFinders {
  static final scaffold = find.byValueKey(HomePageKeys.homePageScaffold);
  static final settingsButton = find.byValueKey(HomePageKeys.settingsButton);
  static final dayWeatherPredictionList = find.byValueKey(HomePageKeys.dayWeatherPredictionList);
  static SerializableFinder weatherSummary(int index) => find.byValueKey(HomePageKeys.weatherSummary(index));
  static SerializableFinder weatherDetails(int index) => find.byValueKey(HomePageKeys.weatherDetails(index));
  static SerializableFinder dayWeatherPredictionCellKey(int index) => find.byValueKey(
        HomePageKeys.dayWeatherPredictionCell(index),
      );
}
