import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_next_weather/data/models/app_settings_model.dart';
import 'package:flutter_next_weather/domain/entities/app_settings.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:flutter_next_weather/domain/use_cases/settings/load_settings.dart';
import 'package:flutter_next_weather/domain/use_cases/settings/save_settings.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final LoadSettings loadSettings;
  final SaveSettings saveSettings;

  static SettingsState get initialState => const InitialSettingsState();

  SettingsBloc({
    @required this.loadSettings,
    @required this.saveSettings,
  })  : assert(loadSettings != null),
        assert(saveSettings != null),
        super(initialState);

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is LoadSettingsEvent) {
      yield* _handleLoadingSettings();
    } else if (event is ChangeThemeEvent) {
      yield* _handleChangingTheme(event);
    } else if (event is ChangeTemperatureUnitsEvent) {
      yield* _handleChangingTemperatureUnits(event);
    } else if (event is ChangeWindSpeedUnitsEvent) {
      yield* _handleChangingWindSpeedUnits(event);
    }
  }

  Stream<SettingsState> newLoadedState(AppSettings settings) async* {
    yield LoadedSettingsState(
      settings.copyWith(),
    );
  }

  Stream<SettingsState> _handleLoadingSettings() async* {
    final result = await loadSettings(null);
    yield* result.fold(
      onSuccess: (settings) async* {
        yield* newLoadedState(settings);
      },
      onFailure: (_) async* {
        // In the case of no custom settings specified or error => load default settings.
        yield* newLoadedState(const AppSettingsModel.defaultSettings());
      },
    );
  }

  //       //
  // Theme //
  //       //
  Stream<SettingsState> _handleChangingTheme(ChangeThemeEvent event) async* {
    _setSystemChrome(
      platformBrightness: event.platformBrightness,
      themeMode: event.mode,
    );

    final settings = state.settings.copyWith(themeMode: event.mode);
    yield* _handleSavingSettings(settings);
  }

  Stream<SettingsState> _handleSavingSettings(AppSettings settings) async* {
    final result = await saveSettings(settings);
    yield* result.fold(
      onSuccess: (_) async* {
        yield* newLoadedState(settings);
      },
      onFailure: (_) async* {
        yield* newLoadedState(const AppSettingsModel.defaultSettings());
      },
    );
  }

  void _setSystemChrome({@required platformBrightness, @required ThemeMode themeMode}) {
    SystemUiOverlayStyle overlayStyle;
    switch (themeMode) {
      case ThemeMode.light:
        overlayStyle = SystemUiOverlayStyle.dark;
        break;
      case ThemeMode.dark:
        overlayStyle = SystemUiOverlayStyle.light;
        break;
      case ThemeMode.system:
        overlayStyle = platformBrightness == Brightness.light ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light;
    }
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
  }

  Stream<SettingsState> _handleChangingTemperatureUnits(ChangeTemperatureUnitsEvent event) async* {
    final settings = state.settings.copyWith(temperatureUnit: event.unit);
    yield* _handleSavingSettings(settings);
  }

  Stream<SettingsState> _handleChangingWindSpeedUnits(ChangeWindSpeedUnitsEvent event) async* {
    final settings = state.settings.copyWith(windSpeedUnit: event.unit);
    yield* _handleSavingSettings(settings);
  }
}
