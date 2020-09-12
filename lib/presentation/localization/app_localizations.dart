import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'localization.dart' as localization;
import 'messages/messages_all.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return localization.supportedLocales.map((locale) => locale.languageCode).contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  static AppLocalizations current;

  AppLocalizations._() {
    current = this;
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.languageCode;
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations._();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String noInternetFound() => Intl.message(
        'No internet connection found',
        name: 'noInternetFound',
      );

  String unexpectedError() => Intl.message(
        'An unexpected error occurred',
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
        '°C',
        name: 'centigradeUnit',
      );

  String fahrenheitUnit() => Intl.message(
        '°F',
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

  String temperatureRange(
    int min,
    int max,
    String unit,
  ) =>
      Intl.message(
        '$min$unit / $max$unit',
        name: 'temperatureRange',
        args: [min, max, unit],
      );

  String tapToTryAgain() => Intl.message(
        'Tap to try again',
        name: 'tapToTryAgain',
      );

  String settings() => Intl.message(
        'Settings',
        name: 'settings',
      );

  String appearance() => Intl.message(
        'Appearance',
        name: 'appearance',
      );

  String theme() => Intl.message(
        'Theme',
        name: 'theme',
      );

  String system() => Intl.message(
        'System',
        name: 'system',
      );

  String lightTheme() => Intl.message(
        'Light',
        name: 'lightTheme',
      );

  String darkTheme() => Intl.message(
        'Dark',
        name: 'darkTheme',
      );

  String temperatureUnits() => Intl.message(
        'Temperature units',
        name: 'temperatureUnits',
      );

  String speedUnits() => Intl.message(
        'Speed units',
        name: 'speedUnits',
      );

  String dataSourceDisclaimer() => Intl.message(
        'Weather data provided by ',
        name: 'dataSourceDisclaimer',
      );

  String dataSourceName() => Intl.message(
        'MetaWeather.com',
        name: 'dataSourceName',
      );

  String appVersion(String version) => Intl.message(
        'v. $version',
        name: 'appVersion',
        args: [version],
      );
}
