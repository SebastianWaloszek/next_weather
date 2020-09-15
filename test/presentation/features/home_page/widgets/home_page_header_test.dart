import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/environment/environment.dart';
import 'package:flutter_next_weather/common/environment/environment_dev.dart';
import 'package:flutter_next_weather/common/utils/extensions/date_time_extensions.dart';
import 'package:flutter_next_weather/common/utils/extensions/string_extensions.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/home_page_header.dart';
import 'package:flutter_next_weather/presentation/widgets/button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/test_data.dart';
import '../../../widgets/utils/localized_material_app.dart';

void main() {
  Environment.setCurrent(DevelopmentEnvironment());

  final weatherPrediction = TestData.weatherForecast.weatherPredictions.first;

  testWidgets('HomePageHeader should display a clickable settings button', (WidgetTester tester) async {
    bool onTapCalled = false;
    void onTapped() => onTapCalled = true;

    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: HomePageHeader(
          onSettingsTapped: onTapped,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final buttonFinder = find.byType(Button);
    final Button button = tester.widget(buttonFinder);

    expect(button.onTapped, onTapped);

    await tester.tap(buttonFinder);
    await tester.pump();

    expect(onTapCalled, isTrue);
  });

  testWidgets('HomePageHeader should display no text labels when weatherPrediction is not specified',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: HomePageHeader(
          onSettingsTapped: () => {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byType(Text);
    expect(textFinder, findsNothing);
  });

  testWidgets('HomePageHeader should display text labels when weatherPrediction is specified',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: HomePageHeader(
          weatherPrediction: weatherPrediction,
          onSettingsTapped: () => {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byType(Text);
    expect(textFinder, findsNWidgets(2));

    final Text firstText = tester.widget(textFinder.first);
    expect(
      firstText.data,
      weatherPrediction.day.dayOfWeek().capitalize(),
    );
    final Text secondText = tester.widget(textFinder.last);
    expect(
      secondText.data,
      weatherPrediction.day.format(),
    );
  });
}
