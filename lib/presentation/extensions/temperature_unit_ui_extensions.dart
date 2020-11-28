import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_option.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';

extension TemperatureUnitUiExtensions on TemperatureUnit {
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

  int getValueFromCertigrade(int centigrade) {
    switch (this) {
      case TemperatureUnit.centigrade:
        return centigrade;
      case TemperatureUnit.fahrenheit:
        return (centigrade * 9 / 5 + 32).floor();
      default:
        throw UnsupportedError('$this is not supported');
    }
  }

  SettingsPickerOption toSettingsOption(BuildContext context) {
    return SettingsPickerOption<TemperatureUnit>(
      value: this,
      description: getDescription(context),
    );
  }
}
