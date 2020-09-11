import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/home/page/home_page.dart';

import 'features/settings/page/settings_page.dart';
import 'features/settings/page/settings_picker_page/settings_picker_page.dart';

final Map<String, WidgetBuilder> navigationRoutes = <String, WidgetBuilder>{
  HomePage.routeName: (BuildContext context) => const HomePage(),
  SettingsPage.routeName: (BuildContext context) => const SettingsPage(),
  SettingsPickerPage.routeName: (BuildContext context) => const SettingsPickerPage(),
};
