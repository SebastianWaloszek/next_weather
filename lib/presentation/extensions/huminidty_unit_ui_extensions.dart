import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/humidity_unit.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';

extension HumidityUnitUiExtensions on HumidityUnit {
  String getDescription(BuildContext context) {
    switch (this) {
      case HumidityUnit.percentage:
        return AppLocalizations.of(context).percentageSign();
      default:
        throw UnsupportedError('$this is not supported');
    }
  }
}
