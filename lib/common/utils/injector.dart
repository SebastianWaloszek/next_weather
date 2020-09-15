import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_next_weather/common/blocs/network/network_bloc.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/common/environment/environment_prod.dart';
import 'package:flutter_next_weather/data/data_sources/local/local_settings_data_source.dart';
import 'package:flutter_next_weather/data/data_sources/remote/remote_weather_data_source.dart';
import 'package:flutter_next_weather/data/data_sources/settings_data_source.dart';
import 'package:flutter_next_weather/data/data_sources/weather_data_source.dart';
import 'package:flutter_next_weather/data/network/network_info.dart';
import 'package:flutter_next_weather/data/network/network_service.dart';
import 'package:flutter_next_weather/data/network/managed_network_service.dart';
import 'package:flutter_next_weather/data/network/network_service_impl.dart';
import 'package:flutter_next_weather/data/network/web_network_info.dart';
import 'package:flutter_next_weather/data/repositories/settings_repository_impl.dart';
import 'package:flutter_next_weather/data/repositories/weather_repository_impl.dart';
import 'package:flutter_next_weather/domain/repositories/settings_repository.dart';
import 'package:flutter_next_weather/domain/repositories/weather_repository.dart';
import 'package:flutter_next_weather/domain/use_cases/settings/load_settings.dart';
import 'package:flutter_next_weather/domain/use_cases/settings/save_settings.dart';
import 'package:flutter_next_weather/domain/use_cases/weather/get_weather_forecast.dart';
import 'package:flutter_next_weather/presentation/features/home/bloc/home_page_bloc.dart';
import 'package:flutter_next_weather/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:kiwi/kiwi.dart';

class Injector {
  static KiwiContainer container;
  static final T Function<T>([String name]) resolve = container.resolve;

  static void setup() {
    container = KiwiContainer();

    _common();

    _switchBasedOnEnvironment(
      devSetup: _commonDevelopment,
      prodSetup: _commonProduction,
    );

    if (kIsWeb) {
      _webCommon();
      _switchBasedOnEnvironment(
        devSetup: _webDevelopment,
        prodSetup: _webProduction,
      );
    } else {
      _mobileCommon();
      _switchBasedOnEnvironment(
        devSetup: _mobileDevelopment,
        prodSetup: _mobileProduction,
      );
    }
  }

  static void _switchBasedOnEnvironment({
    @required void Function() devSetup,
    @required void Function() prodSetup,
  }) {
    switch (Environment.current.runtimeType) {
      case DevelopmentEnvironment:
        devSetup?.call();
        break;
      case ProductionEnvironment:
        prodSetup?.call();
        break;
    }
  }

  static void _common() {
    container.registerSingleton(
      (c) => Dio(BaseOptions(
        baseUrl: Environment.current.baseUrl,
      )),
    );

    container.registerSingleton<NetworkService>(
      (c) => NetworkServiceImpl(dio: c.resolve()),
      name: 'networkServiceImpl',
    );

    container.registerSingleton<NetworkService>(
      (c) => ManagedNetworkService(
        networkInfo: c.resolve(),
        networkService: c.resolve('networkServiceImpl'),
        networkBloc: c.resolve(),
      ),
    );

    container.registerSingleton<SettingsDataSource>(
      (c) => LocalSettingsDataSource(),
    );
    container.registerSingleton<WeatherDataSource>(
      (c) => RemoteWeatherDataSource(networkService: c.resolve()),
    );

    container.registerSingleton<SettingsRepository>(
      (c) => SettingsRepositoryImpl(settingsDataSource: c.resolve()),
    );
    container.registerSingleton<WeatherRepository>(
      (c) => WeatherRepositoryImpl(dataSource: c.resolve()),
    );

    container.registerSingleton((c) => LoadSettings(settingsRepository: c.resolve()));
    container.registerSingleton((c) => SaveSettings(settingsRepository: c.resolve()));
    container.registerSingleton((c) => GetWeatherForecast(weatherRepository: c.resolve()));

    container.registerSingleton((c) => NetworkBloc());
    container.registerSingleton(
      (c) => SettingsBloc(
        loadSettings: c.resolve(),
        saveSettings: c.resolve(),
      ),
    );

    container.registerSingleton((c) => HomePageBloc(getWeatherForecast: c.resolve()));
  }

  static void _commonDevelopment() {}

  static void _commonProduction() {}

  static void _webCommon() {
    container.registerSingleton<NetworkInfo>(
      (c) => WebNetworkInfoImpl(),
    );
  }

  static void _webDevelopment() {}

  static void _webProduction() {}

  static void _mobileCommon() {
    container.registerSingleton<NetworkInfo>(
      (c) => NetworkInfoImpl(c.resolve()),
    );
    container.registerSingleton((c) => DataConnectionChecker());
  }

  static void _mobileDevelopment() {}

  static void _mobileProduction() {}
}
