import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_next_weather/common/blocs/network/network_bloc.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/common/environment/environment_prod.dart';
import 'package:flutter_next_weather/data/network/mock_interceptor.dart';
import 'package:flutter_next_weather/data/network/network_info.dart';
import 'package:flutter_next_weather/data/network/network_service.dart';
import 'package:flutter_next_weather/data/network/network_service_impl.dart';
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
    //                 //
    //  N E T W O R K  //
    //                 //
    container.registerSingleton(
      (c) => Dio(BaseOptions())..interceptors.addAll(c.resolve()),
    );

    container.registerSingleton<NetworkService>(
      (c) => NetworkServiceImpl(
        networkInfo: c.resolve(),
        dio: c.resolve(),
        networkBloc: c.resolve(),
      ),
    );
    //                         //
    //  D A T A   S O U R C E  //
    //                         //

    //                       //
    //  R E P O S I T O R Y  //
    //                       //

    //                   //
    //  U S E   C A S E  //
    //                   //

    //             //
    //  B L O C S  //
    //             //
    container.registerSingleton((c) => NetworkBloc(networkInfo: c.resolve()));

    //                     //
    //  P A G E   B L O C  //
    //                     //
  }

  static void _commonDevelopment() {
    container.registerInstance<Iterable<Interceptor>>(<Interceptor>[
      if (Environment.current.useMockData) MockInterceptor(),
    ]);
  }

  static void _commonProduction() {
    container.registerInstance<Iterable<Interceptor>>(<Interceptor>[]);
  }

  //     //
  // WEB //
  //     //
  static void _webCommon() {}

  static void _webDevelopment() {}

  static void _webProduction() {}

  //        //
  // MOBILE //
  //        //
  static void _mobileCommon() {
    container.registerSingleton<NetworkInfo>(
      (c) => NetworkInfoImpl(c.resolve()),
    );
    container.registerSingleton((c) => DataConnectionChecker());
  }

  static void _mobileDevelopment() {}

  static void _mobileProduction() {}
}
