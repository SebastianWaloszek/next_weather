import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

List<Locale> supportedLocales = [
  const Locale('en', 'US'),
  const Locale('de', 'DE'),
  const Locale('pl', 'PL'),
];

final List<LocalizationsDelegate> localizationDelegates = [
  const AppLocalizationsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  DefaultCupertinoLocalizations.delegate,
];
