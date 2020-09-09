enum WeatherType {
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

extension WeatherTypeExtensions on WeatherType {
  static WeatherType fromAbbreviation(String abbreviation) {
    switch (abbreviation) {
      case 'sn':
        return WeatherType.snow;
      case 'sl':
        return WeatherType.sleet;
      case 'h':
        return WeatherType.hail;
      case 't':
        return WeatherType.thunderstorm;
      case 'hr':
        return WeatherType.heavyRain;
      case 'lr':
        return WeatherType.lightRain;
      case 's':
        return WeatherType.showers;
      case 'hc':
        return WeatherType.heavyCloud;
      case 'lc':
        return WeatherType.lightCloud;
      case 'c':
        return WeatherType.clear;
      default:
        throw UnsupportedError('$abbreviation abbreviation is not supported');
    }
  }
}
