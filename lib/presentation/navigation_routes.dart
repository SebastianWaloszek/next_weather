import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/home/page/home_page.dart';

final Map<String, WidgetBuilder> navigationRoutes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const HomePage(),
};
