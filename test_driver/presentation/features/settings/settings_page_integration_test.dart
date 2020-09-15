import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../home_page/home_page_finders.dart';
import 'settings_page_finders.dart';
import 'settings_picker_page_finders.dart';

void main() {
  group('Settings page integration tests - ', () {
    FlutterDriver driver;

    Future<void> _openSettingsPicker(SerializableFinder openPickerButtonFinder) async {
      await driver.tap(openPickerButtonFinder);
      await driver.waitForAbsent(SettingsPageFinders.scaffold);
      await driver.waitFor(SettingsPickerPageFinder.scaffold);
    }

    Future<void> _closeSettingsPicker() async {
      await driver.tap(SettingsPickerPageFinder.backButton);
      await driver.waitForAbsent(SettingsPickerPageFinder.scaffold);
    }

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Should open settings from home screen', () async {
      await driver.waitFor(HomePageFinders.scaffold);
      await driver.tap(HomePageFinders.settingsButton);
      await driver.waitForAbsent(HomePageFinders.scaffold);
      await driver.waitFor(SettingsPageFinders.scaffold);
    });

    test('Should open theme settings selection, make a change and return', () async {
      await _openSettingsPicker(SettingsPageFinders.themeSettingsRow);
      await driver.tap(SettingsPickerPageFinder.optionRow(1));
      await _closeSettingsPicker();
    });

    test('Should open temperature units settings, make a change and return', () async {
      await _openSettingsPicker(SettingsPageFinders.temperatureUnitSettingsRow);
      await driver.tap(SettingsPickerPageFinder.optionRow(1));
      await _closeSettingsPicker();
    });

    test('Should open wind speed units settings, make a change and return', () async {
      await _openSettingsPicker(SettingsPageFinders.windSpeedUnitSettingsRow);
      await driver.tap(SettingsPickerPageFinder.optionRow(1));
      await _closeSettingsPicker();
    });

    test('Should return from settings to home page', () async {
      await driver.tap(SettingsPageFinders.backButton);
      await driver.waitForAbsent(SettingsPageFinders.scaffold);
      await driver.waitFor(HomePageFinders.scaffold);
    });
  });
}
