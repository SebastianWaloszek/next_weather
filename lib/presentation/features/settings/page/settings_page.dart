import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:flutter_next_weather/presentation/extensions/speed_unit_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/extensions/temperature_unit_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/extensions/theme_mode_ui_extensions.dart';
import 'package:flutter_next_weather/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_page_body_parameters.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_option.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_page.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_page_arguments.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/injector.dart';
import 'settings_page_body.dart';

class SettingsPage extends StatefulWidget {
  static String routeName = 'settings';

  const SettingsPage({
    Key key,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with WidgetsBindingObserver {
  final SettingsBloc settingsBloc = Injector.resolve<SettingsBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadSettings();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Load settings if app came back from background,
      // because of the possibility that permissions changed.
      _loadSettings();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _loadSettings() {
    settingsBloc.add(LoadSettingsEvent());
  }

  void _showSettingsPickerForTheme() {
    final arguments = SettingsPickerPageArguments.forThemePicker(
      context,
      initialOptionSelected:
          settingsBloc.state.settings.themeMode.toSettingsOption(context),
      onOptionSelected: (option) {
        settingsBloc.add(
          ChangeThemeEvent(
            platformBrightness: MediaQuery.of(context).platformBrightness,
            mode: option.value as ThemeMode,
          ),
        );
      },
      bloc: settingsBloc,
    );
    _showSettingsPicker(arguments);
  }

  void _showSettingsPickerForTemperatureUnits() {
    final arguments = SettingsPickerPageArguments.forTemperatureUnits(
      context,
      initialOptionSelected:
          settingsBloc.state.settings.temperatureUnit.toSettingsOption(context),
      onOptionSelected: (SettingsPickerOption option) {
        settingsBloc.add(
          ChangeTemperatureUnitsEvent(option.value as TemperatureUnit),
        );
      },
      bloc: settingsBloc,
    );
    _showSettingsPicker(arguments);
  }

  void _showSettingsPickerForWindSpeedUnits() {
    final arguments = SettingsPickerPageArguments.forWindSpeedUnits(
      context,
      initialOptionSelected:
          settingsBloc.state.settings.windSpeedUnit.toSettingsOption(context),
      onOptionSelected: (SettingsPickerOption option) {
        settingsBloc.add(ChangeWindSpeedUnitsEvent(option.value as SpeedUnit));
      },
      bloc: settingsBloc,
    );
    _showSettingsPicker(arguments);
  }

  void _showSettingsPicker(SettingsPickerPageArguments arguments) {
    Navigator.of(context).pushNamed(
      SettingsPickerPage.routeName,
      arguments: arguments,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      cubit: settingsBloc,
      builder: (context, state) {
        return SettingsPageBody(
          SettingsPageBodyParameters(
            context,
            settings: state.settings,
            showPickerForTheme: _showSettingsPickerForTheme,
            showPickerForTemperatureUnits:
                _showSettingsPickerForTemperatureUnits,
            showPickerForWindSpeedUnits: _showSettingsPickerForWindSpeedUnits,
          ),
        );
      },
    );
  }
}
