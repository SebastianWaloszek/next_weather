import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:flutter_next_weather/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_option.dart';
import 'package:flutter_next_weather/presentation/localization/app_localizations.dart';
import 'package:flutter_next_weather/common/utils/extensions/theme_mode_extensions.dart';
import 'package:meta/meta.dart';

class SettingsPickerPageArguments {
  final String pageTitle;
  final List<SettingsPickerOption> options;
  final SettingsPickerOption initialOption;
  final Function(SettingsPickerOption) onOptionSelected;
  final SettingsBloc bloc;

  const SettingsPickerPageArguments({
    @required this.pageTitle,
    @required this.options,
    @required this.initialOption,
    @required this.onOptionSelected,
    @required this.bloc,
  })  : assert(pageTitle != null),
        assert(options != null),
        assert(initialOption != null),
        assert(onOptionSelected != null),
        assert(bloc != null);

  factory SettingsPickerPageArguments.forThemePicker(
    BuildContext context, {
    SettingsPickerOption initialOptionSelected,
    Function(SettingsPickerOption) onOptionSelected,
    SettingsBloc bloc,
  }) {
    return SettingsPickerPageArguments(
      pageTitle: AppLocalizations.of(context).theme(),
      initialOption: initialOptionSelected,
      options: ThemeMode.values.map((themeMode) => themeMode.toSettingsOption(context)).toList(),
      onOptionSelected: onOptionSelected,
      bloc: bloc,
    );
  }

  factory SettingsPickerPageArguments.forTemperatureUnits(
    BuildContext context, {
    SettingsPickerOption initialOptionSelected,
    Function(SettingsPickerOption) onOptionSelected,
    SettingsBloc bloc,
  }) {
    return SettingsPickerPageArguments(
      pageTitle: AppLocalizations.of(context).temperatureUnits(),
      initialOption: initialOptionSelected,
      options: TemperatureUnit.values.map((unit) => unit.toSettingsOption(context)).toList(),
      onOptionSelected: onOptionSelected,
      bloc: bloc,
    );
  }

  factory SettingsPickerPageArguments.forWindSpeedUnits(
    BuildContext context, {
    SettingsPickerOption initialOptionSelected,
    Function(SettingsPickerOption) onOptionSelected,
    SettingsBloc bloc,
  }) {
    return SettingsPickerPageArguments(
      pageTitle: AppLocalizations.of(context).temperatureUnits(),
      initialOption: initialOptionSelected,
      options: SpeedUnit.values.map((unit) => unit.toSettingsOption(context)).toList(),
      onOptionSelected: onOptionSelected,
      bloc: bloc,
    );
  }
}
