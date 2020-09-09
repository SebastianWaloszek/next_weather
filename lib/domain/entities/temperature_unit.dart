import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';

enum TemperatureUnit {
  centigrade,
  fahrenheit,
}

extension TemperatureUnitExtensions on TemperatureUnit {
  String getDescription(BuildContext context) {
    switch (this) {
      case TemperatureUnit.centigrade:
        return AppLocalizations.of(context).centigradeUnit();
      case TemperatureUnit.fahrenheit:
        return AppLocalizations.of(context).fahrenheitUnit();
      default:
        throw UnsupportedError('$this is not supported');
    }
  }
}
