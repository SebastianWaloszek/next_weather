import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/widgets/header.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/localized_material_app.dart';

void main() {
  const title = 'test title';

  testWidgets('Header should display a title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: Header(title: title),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    final Text text = tester.widget(textFinder);
    expect(text.data, title);
  });

  testWidgets('Header should contain back button item', (WidgetTester tester) async {
    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: Header(title: title),
      ),
    );
    await tester.pumpAndSettle();

    final buttonFinder = find.byType(IconButton);
    expect(buttonFinder, findsOneWidget);

    final IconButton button = tester.widget(buttonFinder);
    expect(button.onPressed, isNotNull);
  });
}
