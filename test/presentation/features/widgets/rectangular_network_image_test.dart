import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/widgets/rectangular_network_image.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/http_overrides.dart';
import 'utils/localized_material_app.dart';

void main() {
  setUp(() {
    io.HttpOverrides.global = TestHttpOverrides();
  });

  testWidgets('RectangularNetworkImage whould display image with given url', (WidgetTester tester) async {
    const String imageUrl = 'test image url';

    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: RectangularNetworkImage(imageUrl: imageUrl),
      ),
    );
    await tester.pumpAndSettle();

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final Image imageWidget = tester.widget(imageFinder);
    final NetworkImage imageProvider = imageWidget.image;
    expect(imageProvider.url, imageUrl);
  });
}
