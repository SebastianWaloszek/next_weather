import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/common/utils/injector.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/day_weather_prediction_cell.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/day_weather_prediction_list.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_data.dart';
import '../../widgets/utils/http_overrides.dart';
import '../../widgets/utils/localized_material_app.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());

  final weatherPredictions = TestData.weatherForecast.weatherPredictions;

  final selectedWeatherPrediction = weatherPredictions.last;

  setUpAll(() async {
    io.HttpOverrides.global = TestHttpOverrides();
    Injector.setup();
  });

  testWidgets('DayWeatherPredictionList should display a ListView', (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: DayWeatherPredictionList(
          weatherPredictions: weatherPredictions,
          onItemSelected: (_) => {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final listFinder = find.byType(ListView);
    expect(listFinder, findsOneWidget);
  });

  testWidgets('DayWeatherPredictionList cells should be properly initialized when no cell is selected',
      (WidgetTester tester) async {
    void onSelected(WeatherPrediction prediction) {}

    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: DayWeatherPredictionList(
          weatherPredictions: weatherPredictions,
          onItemSelected: onSelected,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final cellFinder = find.byType(DayWeatherPredictionCell);
    final List<DayWeatherPredictionCell> cells = List<DayWeatherPredictionCell>.of(tester.widgetList(cellFinder));
    for (final cell in cells) {
      expect(cell.isSelected, false);
      expect(cell.onSelected, onSelected);
      expect(cell.weatherPrediction, isNotNull);
    }
  });

  testWidgets('DayWeatherPredictionList cells should be properly initialized when a cell is selected',
      (WidgetTester tester) async {
    void onSelected(WeatherPrediction prediction) {}

    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: DayWeatherPredictionList(
          weatherPredictions: weatherPredictions,
          selectedWeatherPrediction: selectedWeatherPrediction,
          onItemSelected: onSelected,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final cellFinder = find.byType(DayWeatherPredictionCell);
    final List<DayWeatherPredictionCell> cells = List<DayWeatherPredictionCell>.of(tester.widgetList(cellFinder));
    for (final cell in cells) {
      expect(cell.isSelected, cell.weatherPrediction == selectedWeatherPrediction);
      expect(cell.onSelected, onSelected);
      expect(cell.weatherPrediction, isNotNull);
    }
  });
}
