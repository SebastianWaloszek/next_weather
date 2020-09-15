import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/data_source_disclaimer_label.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widgets/utils/localized_material_app.dart';

void main() {
  testWidgets('DataSourceDisclaimerLabel should contain the appropriate TextSpans', (WidgetTester tester) async {
    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: DataSourceDisclaimerLabel(),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byType(RichText);
    expect(textFinder, findsOneWidget);

    final RichText textWidget = tester.widget(textFinder);
    final TextSpan mainTextSpan = textWidget.text;

    expect(mainTextSpan.children.length, 2);
    for (final child in mainTextSpan.children) {
      expect(child, isA<TextSpan>());
    }

    final TextSpan secondChildTextSpan = mainTextSpan.children.last;
    expect(secondChildTextSpan.recognizer, isNotNull);
  });
}
