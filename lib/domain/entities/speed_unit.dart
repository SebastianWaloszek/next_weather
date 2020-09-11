import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_option.dart';
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

  String toRawValue() {
    switch (this) {
      case SpeedUnit.milesPerHour:
        return 'MILES_PER_HOUR';
      case SpeedUnit.kilometersPerHour:
        return 'KILOMETERS_PER_HOUR';
      default:
        throw UnsupportedError('$this is not supported');
    }
  }

  static SpeedUnit fromRawValue(String value) {
    switch (value) {
      case 'MILES_PER_HOUR':
        return SpeedUnit.milesPerHour;
      case 'KILOMETERS_PER_HOUR':
        return SpeedUnit.kilometersPerHour;
      default:
        throw UnsupportedError('$value is not supported');
    }
  }

  SettingsPickerOption toSettingsOption(BuildContext context) {
    return SettingsPickerOption<SpeedUnit>(
      value: this,
      description: getDescription(context),
    );
  }
}
