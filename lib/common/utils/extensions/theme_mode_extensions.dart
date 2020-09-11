import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_option.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';

extension ThemeModeExtensions on ThemeMode {
  SettingsPickerOption toSettingsOption(BuildContext context) {
    return SettingsPickerOption<ThemeMode>(
      value: this,
      description: getDescription(context),
    );
  }

  String getDescription(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return AppLocalizations.of(context).system();
      case ThemeMode.light:
        return AppLocalizations.of(context).lightTheme();
      case ThemeMode.dark:
        return AppLocalizations.of(context).darkTheme();
    }
    throw UnsupportedError('$this is not supported');
  }
}
