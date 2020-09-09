enum WeatherState {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
}

extension WeatherStateExtensions on WeatherState {
  static WeatherState fromAbbreviation(String abbreviation) {
    switch (abbreviation) {
      case 'sn':
        return WeatherState.snow;
      case 'sl':
        return WeatherState.sleet;
      case 'h':
        return WeatherState.hail;
      case 't':
        return WeatherState.thunderstorm;
      case 'hr':
        return WeatherState.heavyRain;
      case 'lr':
        return WeatherState.lightRain;
      case 's':
        return WeatherState.showers;
      case 'hc':
        return WeatherState.heavyCloud;
      case 'lc':
        return WeatherState.lightCloud;
      case 'c':
        return WeatherState.clear;
      default:
        throw UnsupportedError('$abbreviation abbreviation is not supported');
    }
  }
}
