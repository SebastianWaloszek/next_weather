import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_next_weather/common/parameters/app_settings.dart';
import 'package:flutter_next_weather/common/utils/injector.dart';
import 'package:flutter_next_weather/presentation/features/settings/bloc/settings_bloc.dart';

mixin GlobalSettings {
  SettingsBloc get _settingsBloc => Injector.resolve<SettingsBloc>();

  Widget settingsBuilder({
    @required Widget Function(AppSettings appSettings) childBuilder,
  }) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      cubit: _settingsBloc,
      builder: (context, state) {
        return childBuilder(state.settings);
      },
    );
  }
}
