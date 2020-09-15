import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_next_weather/presentation/features/settings/page/settings_picker_page/settings_picker_page_keys.dart';

abstract class SettingsPickerPageFinder {
  static final scaffold = find.byValueKey(SettingsPickerPageKeys.scaffold);
  static final backButton = find.byValueKey(SettingsPickerPageKeys.backButton);
  static SerializableFinder optionRow(int index) => find.byValueKey(SettingsPickerPageKeys.optionRow(index));
}
