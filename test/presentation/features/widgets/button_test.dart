import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/widgets/button.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/localized_material_app.dart';

void main() {
  const title = 'test title';
  const icon = Icons.add;

  testWidgets('Button should display a title and icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: Button(
          title: title,
          icon: icon,
          onTapped: () => {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    final Text text = tester.widget(textFinder);
    expect(text.data, title);
  });

  testWidgets('Button should only display a title', (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: Button(
          title: title,
          onTapped: () => {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    final Text text = tester.widget(textFinder);
    expect(text.data, title);
  });

  testWidgets('Button should only display a icon', (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: Button(
          icon: icon,
          onTapped: () => {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsOneWidget);

    final Icon iconWidget = tester.widget(iconFinder);
    expect(iconWidget.icon, icon);
  });

  testWidgets('Button should execute callback on tap', (WidgetTester tester) async {
    bool onTapCalled = false;

    void onTapped() => onTapCalled = true;
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: Button(
          icon: icon,
          onTapped: onTapped,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Button));
    await tester.pump();

    expect(onTapCalled, isTrue);
  });
}
