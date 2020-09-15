import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/widgets/animated_number_text.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/localized_material_app.dart';

void main() {
  const int value = 10;
  const textStyle = TextStyle();

  testWidgets('AnimatedNumberText should display a given value', (WidgetTester tester) async {
    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: AnimatedNumberText(
          number: value,
          textStyle: textStyle,
        ),
      ),
    );
    await tester.pump();

    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    final Text firstText = tester.widget(textFinder.first);
    expect(firstText.data, '$value');
  });
}
