import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_option.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';

extension SpeedUnitUiExtensions on SpeedUnit {
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

  double getValueFromMilesPerHour(double milesPerhour) {
    switch (this) {
      case SpeedUnit.milesPerHour:
        return milesPerhour;
      case SpeedUnit.kilometersPerHour:
        return milesPerhour * 1.61;
      default:
        throw UnsupportedError('$this is not supported');
    }
  }

  SettingsPickerOption toSettingsOption(BuildContext context) {
    return SettingsPickerOption<SpeedUnit>(
      value: this,
      description: getDescription(context),
    );
  }
}
