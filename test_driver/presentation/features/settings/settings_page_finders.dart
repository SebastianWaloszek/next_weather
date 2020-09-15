import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_page_keys.dart';

abstract class SettingsPageFinders {
  static final scaffold = find.byValueKey(SettingsPageKeys.scaffold);
  static final backButton = find.byValueKey(SettingsPageKeys.backButton);
  static final themeSettingsRow = find.byValueKey(SettingsPageKeys.themeSettingsRow);
  static final temperatureUnitSettingsRow = find.byValueKey(SettingsPageKeys.temperatureUnitSettingsRow);
  static final windSpeedUnitSettingsRow = find.byValueKey(SettingsPageKeys.windSpeedUnitSettingsRow);
}
