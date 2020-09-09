import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/localization/localization.dart';
import 'package:flutter_next_weather/presentation/theme/app_themes.dart';
import 'navigation_routes.dart';

class MyApp extends StatefulWidget {
  static const String appName = 'NextWeather';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.appName,
      theme: appThemes[ThemeMode.light],
      darkTheme: appThemes[ThemeMode.dark],
      routes: navigationRoutes,
      home: Scaffold(
        body: Center(child: Text('Hello world')),
      ), // TODO: Remove placeholder
      localizationsDelegates: localizationDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
