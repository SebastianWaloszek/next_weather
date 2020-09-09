import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';

enum SpeedUnit {
  milesPerHour,
  kilometersPerHour,
}

extension SpeedUnitExtensions on SpeedUnit {
  String getDescription(BuildContext context) {
    switch (this) {
      case SpeedUnit.milesPerHour:
        return AppLocalizations.of(context).milesPerHour();
      case SpeedUnit.kilometersPerHour:
        return AppLocalizations.of(context).kilometersPerHour();
      default:
        throw UnsupportedError('$this is not supported');
    }
  }
}
