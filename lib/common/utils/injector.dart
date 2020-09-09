import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/common/environment/environment_prod.dart';
import 'package:flutter_next_weather/common/network/mock_interceptor.dart';
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
  static void _mobileCommon() {}

  static void _mobileDevelopment() {}

  static void _mobileProduction() {}
}
