import 'package:flutter_next_weather/common/parameters/app_settings.dart';
import 'package:flutter_next_weather/common/utils/injector.dart';
import 'package:flutter_next_weather/presentation/features/settings/bloc/settings_bloc.dart';

mixin GlobalSettings {
  SettingsBloc get _settingsBloc => Injector.resolve<SettingsBloc>();
  AppSettings get settings => _settingsBloc.state.settings;
}
