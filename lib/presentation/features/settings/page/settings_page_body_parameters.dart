import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/app_settings.dart';
import 'package:flutter_next_weather/presentation/page/page_body_parameters.dart';

class SettingsPageBodyParameters extends PageBodyParameters {
  final AppSettings settings;

  final void Function() showPickerForTheme;
  final void Function() showPickerForTemperatureUnits;
  final void Function() showPickerForWindSpeedUnits;

  SettingsPageBodyParameters(
    BuildContext context, {
    @required this.settings,
    @required this.showPickerForTheme,
    @required this.showPickerForTemperatureUnits,
    @required this.showPickerForWindSpeedUnits,
  })  : assert(settings != null),
        assert(showPickerForTheme != null),
        assert(showPickerForTemperatureUnits != null),
        assert(showPickerForWindSpeedUnits != null),
        super(context: context);
}
