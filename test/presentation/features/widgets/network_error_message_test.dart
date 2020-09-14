import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/widgets/network_error_message.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/localized_material_app.dart';

void main() {
  testWidgets('NetworkErrorMessage should display title, subtitle and default image accondingly',
      (WidgetTester tester) async {
    const title = 'test title';
    const subtitle = 'test subtitle';

    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: NetworkErrorMessage(
          title: title,
          subtitle: subtitle,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byType(Text);
    expect(textFinder, findsNWidgets(2));

    final Text firstText = tester.widget(textFinder.first);
    expect(firstText.data, title);

    final Text secondText = tester.widget(textFinder.last);
    expect(secondText.data, subtitle);

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);
  });
}
