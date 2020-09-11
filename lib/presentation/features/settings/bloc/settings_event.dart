part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class LoadSettingsEvent extends SettingsEvent {
  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends SettingsEvent {
  final Brightness platformBrightness;
  final ThemeMode mode;

  const ChangeThemeEvent({
    @required this.platformBrightness,
    @required this.mode,
  })  : assert(platformBrightness != null),
        assert(mode != null);

  @override
  List<Object> get props => [mode];
}

class ChangeTemperatureUnitsEvent extends SettingsEvent {
  final TemperatureUnit unit;

  const ChangeTemperatureUnitsEvent(this.unit);

  @override
  List<Object> get props => [unit];
}

class ChangeWindSpeedUnitsEvent extends SettingsEvent {
  final SpeedUnit unit;

  const ChangeWindSpeedUnitsEvent(this.unit);

  @override
  List<Object> get props => [unit];
}
