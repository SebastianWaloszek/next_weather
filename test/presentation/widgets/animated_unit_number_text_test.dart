import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/widgets/animated_unit_number_text.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/localized_material_app.dart';

void main() {
  const valueTextStyle = TextStyle();
  const valueUnitTextStyle = TextStyle();

  const int value = 10;
  const String valueUnit = 'unit';

  testWidgets('AnimatedUnitNumberText should display a value and the unit', (WidgetTester tester) async {
    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: AnimatedUnitNumberText(
          value: value,
          valueUnit: valueUnit,
          valueTextStyle: valueTextStyle,
          valueUnitTextStyle: valueUnitTextStyle,
        ),
      ),
    );
    await tester.pump();

    final textFinder = find.byType(Text);
    expect(textFinder, findsNWidgets(2));

    final Text firstText = tester.widget(textFinder.first);
    expect(firstText.data, '$value');

    final Text secondText = tester.widget(textFinder.last);
    expect(secondText.data, valueUnit);
  });
}
