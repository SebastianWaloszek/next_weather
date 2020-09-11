import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_option.dart';
import 'package:flutter_next_weather/presentation/page/page_body_parameters.dart';

class SettingsPickerPageParameters extends PageBodyParameters {
  final String pageTitle;

  final List<SettingsPickerOption> options;
  final SettingsPickerOption initialSelectedOption;
  final Function(SettingsPickerOption) onOptionSelected;
  final Function() hideSideView;

  final SettingsBloc settingsBloc;

  SettingsPickerPageParameters(
    BuildContext context, {
    @required this.pageTitle,
    @required this.options,
    @required this.initialSelectedOption,
    @required this.onOptionSelected,
    @required this.settingsBloc,
    this.hideSideView,
  })  : assert(pageTitle != null),
        assert(options != null),
        assert(initialSelectedOption != null),
        assert(onOptionSelected != null),
        assert(settingsBloc != null),
        super(context: context);
}
