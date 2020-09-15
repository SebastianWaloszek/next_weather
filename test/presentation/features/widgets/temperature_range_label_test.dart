import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/utils/injector.dart';
import 'package:flutter_next_weather/data/models/temperature_model.dart';
import 'package:flutter_next_weather/presentation/widgets/temperature_range_label.dart';
import 'package:flutter_test/flutter_test.dart';
import 'utils/localized_material_app.dart';

void main() {
  setUpAll(() async {
    Injector.setup();
  });

  testWidgets('TemperatureRangeLabel should show temperature text', (WidgetTester tester) async {
    const temperature = TemperatureModel(min: 0, current: 5, max: 10);
    const textStyle = TextStyle();

    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: TemperatureRangeLabel(
          temperature: temperature,
          textStyle: textStyle,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);
  });
}
