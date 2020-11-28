import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/home/widgets/weather_detail.dart';
import 'package:flutter_next_weather/presentation/widgets/animated_unit_number_text.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widgets/utils/localized_material_app.dart';

void main() {
  const String title = 'detail title';
  const int value = 10;
  const String valueUnit = 'value unit';

  testWidgets('WeatherDetail should show a title and AnimatedUnitNumberText', (WidgetTester tester) async {
    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: WeatherDetail(
          title: title,
          valueUnit: valueUnit,
          value: value,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byWidgetPredicate(
      (widget) => widget is Text && widget.data == title,
    );
    expect(textFinder, findsOneWidget);

    final unitNumberTexFinder = find.byType(AnimatedUnitNumberText);
    final AnimatedUnitNumberText unitNumberText = tester.widget(unitNumberTexFinder);
    expect(unitNumberText.value, value);
    expect(unitNumberText.valueUnit, valueUnit);
  });
}
