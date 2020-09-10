import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

mixin AppLocalizationMessages {
  String noInternetFound() => Intl.message(
        'No internet connection found',
        name: 'noInternetFound',
      );

  String unexpectedError() => Intl.message(
        'An unexpected error occured',
        name: 'unexpectedError',
      );

  String milesPerHour() => Intl.message(
        'mph',
        name: 'milesPerHour',
      );

  String kilometersPerHour() => Intl.message(
        'km/h',
        name: 'kilometersPerHour',
      );

  String centigradeUnit() => Intl.message(
        'C',
        name: 'centigradeUnit',
      );

  String fahrenheitUnit() => Intl.message(
        'F',
        name: 'fahrenheitUnit',
      );

  String degreeSign() => Intl.message(
        '°',
        name: 'degreeSign',
      );

  String percentageSign() => Intl.message(
        '%',
        name: 'percentageSign',
      );

  String hectopascals() => Intl.message(
        'hPa',
        name: 'hectopascals',
      );

  String humidity() => Intl.message(
        'Humidity',
        name: 'humidity',
      );

  String pressure() => Intl.message(
        'Pressure',
        name: 'pressure',
      );

  String wind() => Intl.message(
        'Wind',
        name: 'wind',
      );

  String temperatureRange({
    @required int min,
    @required int max,
    @required String unit,
  }) =>
      Intl.message(
        '$min$unit / $max$unit',
        name: 'temperatureRange',
      );

  String tapToTryAgain() => Intl.message(
        'Tap to try again',
        name: 'tapToTryAgain',
      );
}
