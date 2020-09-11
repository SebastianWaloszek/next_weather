import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/domain/entities/speed_unit.dart';
import 'package:flutter_next_weather/domain/entities/temperature_unit.dart';
import 'package:flutter_next_weather/domain/use_cases/settings/load_settings.dart';
import 'package:flutter_next_weather/domain/use_cases/settings/save_settings.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/common/parameters/app_settings.dart';
import 'package:flutter_next_weather/common/result/failure_result.dart';
import 'package:flutter_next_weather/common/result/success_result.dart';
import 'package:flutter_next_weather/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LoadSettingsMock extends Mock implements LoadSettings {}

class SaveSettingsMock extends Mock implements SaveSettings {}

void main() {
  LoadSettings loadSettings;
  SaveSettings saveSettings;

  SettingsBloc bloc;

  const settings = AppSettings(
    themeMode: ThemeMode.dark,
    temperatureUnit: TemperatureUnit.fahrenheit,
    windSpeedUnit: SpeedUnit.milesPerHour,
  );

  const defaultSettings = AppSettings.defaultSettings();

  final successLoadResult = SuccessResult<AppSettings, Failure>(settings);
  final failedLoadResult = FailureResult<AppSettings, Failure>(UnexpectedFailure());

  final successSaveResult = SuccessResult<void, Failure>(null);
  final failedSaveResult = FailureResult<void, Failure>(UnexpectedFailure());

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    loadSettings = LoadSettingsMock();
    saveSettings = SaveSettingsMock();

    bloc = SettingsBloc(
      loadSettings: loadSettings,
      saveSettings: saveSettings,
    );
  });

  blocTest(
    'Should emit correct states when loading settings succeeds',
    build: () {
      when(loadSettings.call(any)).thenAnswer((_) async => successLoadResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(LoadSettingsEvent());
    },
    expect: [
      const LoadedSettingsState(settings),
    ],
  );

  blocTest(
    'Should emit correct states when loading settings fails',
    build: () {
      when(loadSettings.call(any)).thenAnswer((_) async => failedLoadResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(LoadSettingsEvent());
    },
    expect: [
      const LoadedSettingsState(defaultSettings),
    ],
  );

  blocTest(
    'Should emit correct states when changing theme settings',
    build: () {
      when(saveSettings.call(any)).thenAnswer((_) async => successSaveResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(ChangeThemeEvent(platformBrightness: Brightness.light, mode: settings.themeMode));
    },
    expect: [
      LoadedSettingsState(
        AppSettings(
          themeMode: settings.themeMode,
          temperatureUnit: defaultSettings.temperatureUnit,
          windSpeedUnit: defaultSettings.windSpeedUnit,
        ),
      ),
    ],
  );

  blocTest(
    'Should emit correct states when changing theme settings fails',
    build: () {
      when(saveSettings.call(any)).thenAnswer((_) async => failedSaveResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(const ChangeThemeEvent(platformBrightness: Brightness.light, mode: ThemeMode.dark));
    },
    expect: [
      const LoadedSettingsState(defaultSettings),
    ],
  );

  blocTest(
    'Should emit correct states when changing temperature unit',
    build: () {
      when(saveSettings.call(any)).thenAnswer((_) async => successSaveResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(ChangeTemperatureUnitsEvent(settings.temperatureUnit));
    },
    expect: [
      LoadedSettingsState(
        AppSettings(
          themeMode: defaultSettings.themeMode,
          temperatureUnit: settings.temperatureUnit,
          windSpeedUnit: defaultSettings.windSpeedUnit,
        ),
      ),
    ],
  );

  blocTest(
    'Should emit correct states when changing temperature unit settings fails',
    build: () {
      when(saveSettings.call(any)).thenAnswer((_) async => failedSaveResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(ChangeTemperatureUnitsEvent(settings.temperatureUnit));
    },
    expect: [
      const LoadedSettingsState(defaultSettings),
    ],
  );

  blocTest(
    'Should emit correct states when changing wind speed unit',
    build: () {
      when(saveSettings.call(any)).thenAnswer((_) async => successSaveResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(ChangeWindSpeedUnitsEvent(settings.windSpeedUnit));
    },
    expect: [
      LoadedSettingsState(
        AppSettings(
          themeMode: defaultSettings.themeMode,
          temperatureUnit: defaultSettings.temperatureUnit,
          windSpeedUnit: settings.windSpeedUnit,
        ),
      ),
    ],
  );

  blocTest(
    'Should emit correct states when changing wind speed unit settings fails',
    build: () {
      when(saveSettings.call(any)).thenAnswer((_) async => failedSaveResult);
      return bloc;
    },
    act: (bloc) async {
      return bloc.add(ChangeWindSpeedUnitsEvent(settings.windSpeedUnit));
    },
    expect: [
      const LoadedSettingsState(defaultSettings),
    ],
  );
}
