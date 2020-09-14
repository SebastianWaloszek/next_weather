import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/widgets/loading_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/localized_material_app.dart';

void main() {
  testWidgets('LoadingIndicator should display a circular loading indicator', (WidgetTester tester) async {
    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: LoadingIndicator(),
      ),
    );
    await tester.pump();

    final indicatorFinder = find.byType(CircularProgressIndicator);
    expect(indicatorFinder, findsOneWidget);
  });
}
