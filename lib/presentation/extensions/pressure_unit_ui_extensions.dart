import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/pressure_unit.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';

extension PressureUnitUiExtensions on PressureUnit {
  String getDescription(BuildContext context) {
    switch (this) {
      case PressureUnit.hectopascals:
        return AppLocalizations.of(context).hectopascals();
      default:
        throw UnsupportedError('$this is not supported');
    }
  }
}
