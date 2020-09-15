import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/widgets/rounded_shadow_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'utils/localized_material_app.dart';

void main() {
  const textWidget = Text('test widget');

  testWidgets('RoundedShadowContainer should show child', (WidgetTester tester) async {
    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: RoundedShadowContainer(
          child: textWidget,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byWidget(textWidget);
    expect(textFinder, findsOneWidget);
  });

  testWidgets('RoundedShadowContainer should show perform onTap callback', (WidgetTester tester) async {
    bool onTapCalled = false;
    void onTapped() => onTapCalled = true;

    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: RoundedShadowContainer(
          onTapped: onTapped,
          child: textWidget,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(onTapCalled, isFalse);

    await tester.tap(find.byType(RoundedShadowContainer));
    await tester.pump();

    expect(onTapCalled, isTrue);
  });
}
