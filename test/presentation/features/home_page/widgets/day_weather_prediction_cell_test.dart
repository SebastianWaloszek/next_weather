import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/common/utils/extensions/date_time_extensions.dart';
import 'package:flutter_next_weather/common/utils/injector.dart';
import 'package:flutter_next_weather/domain/entities/weather_prediction.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/day_weather_prediction_cell.dart';
import 'package:flutter_next_weather/presentation/widgets/rectangular_network_image.dart';
import 'package:flutter_next_weather/presentation/widgets/temperature_range_label.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_data.dart';
import '../../widgets/utils/http_overrides.dart';
import '../../widgets/utils/localized_material_app.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());

  final weatherPrediction = TestData.weatherForecast.weatherPredictions.first;

  setUpAll(() async {
    io.HttpOverrides.global = TestHttpOverrides();
    Injector.setup();
  });

  testWidgets('DayWeatherPredictionCell should display abv. week, image and temperature range',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: DayWeatherPredictionCell(
          weatherPrediction: weatherPrediction,
          isSelected: false,
          onSelected: (_) => {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byWidgetPredicate(
      (widget) => widget is Text && widget.data == weatherPrediction.day.dayOfWeekAbbreviated(),
    );
    expect(textFinder, findsOneWidget);

    final imageFinder = find.byType(RectangularNetworkImage);
    final RectangularNetworkImage image = tester.widget(imageFinder);
    expect(image.imageUrl, weatherPrediction.weather.state.imageUrl);

    final temperatureRangeLabelFinder = find.byType(TemperatureRangeLabel);
    final TemperatureRangeLabel temperatureRange = tester.widget(temperatureRangeLabelFinder);
    expect(temperatureRange.temperature, weatherPrediction.weather.temperature);
  });

  testWidgets('DayWeatherPredictionCell should call onSelected when selected', (WidgetTester tester) async {
    bool onTapCalled = false;
    void onSelected(WeatherPrediction prediction) {
      onTapCalled = true;
      expect(prediction, weatherPrediction);
    }

    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: DayWeatherPredictionCell(
          weatherPrediction: weatherPrediction,
          isSelected: false,
          onSelected: onSelected,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DayWeatherPredictionCell));
    await tester.pump();

    expect(onTapCalled, true);
  });
}
