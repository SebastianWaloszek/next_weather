import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'home_page_finders.dart';

void main() {
  group('Home page integration tests - ', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Should select another weather day from list and weather details should change accordingly', () async {
      const dayIndexToSelect = 1;
      const scrollOffset = 100.0;
      await driver.waitFor(HomePageFinders.scaffold);

      final listFinder = HomePageFinders.dayWeatherPredictionList;
      await driver.waitFor(listFinder);

      final itemFinder = HomePageFinders.dayWeatherPredictionCellKey(dayIndexToSelect);
      await driver.scrollUntilVisible(listFinder, itemFinder, dxScroll: scrollOffset);
      await driver.tap(itemFinder);

      final detailsFinder = HomePageFinders.weatherDetails(dayIndexToSelect);
      await driver.waitFor(detailsFinder);

      final summaryFinder = HomePageFinders.weatherSummary(dayIndexToSelect);
      await driver.waitFor(summaryFinder);
    });
  });
}
