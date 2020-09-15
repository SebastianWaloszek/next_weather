abstract class HomePageKeys {
  static const homePageScaffold = 'HOME_PAGE_SCAFFOLD';
  static const settingsButton = 'SETTINGS_BUTTON';
  static const dayWeatherPredictionList = 'DAY_WEATHER_PREDICTION_LIST';
  static String weatherSummary(int dayIndex) => 'WEATHER_SUMMARY_$dayIndex';
  static String weatherDetails(int dayIndex) => 'WEATHER_DETAILS_$dayIndex';
  static String dayWeatherPredictionCell(int index) => 'DAY_WEATHER_PREDICTION_CELL_$index';
}
