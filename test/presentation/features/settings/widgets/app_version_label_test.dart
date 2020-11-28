import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/app_version_label.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widgets/utils/localized_material_app.dart';


void main() {
  const appName = 'AppName';
  const packageName = 'packageName';
  const version = '1.0.0';
  const buildNumber = '13';

  setUpAll(() {
    const MethodChannel('plugins.flutter.io/package_info').setMockMethodCallHandler(
      (MethodCall methodCall) async {
        if (methodCall.method == 'getAll') {
          return <String, dynamic>{
            'appName': appName,
            'packageName': packageName,
            'version': version,
            'buildNumber': buildNumber,
          };
        }
        return null;
      },
    );
  });

  testWidgets('AppVersionLabel should display the version number text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const LocalizedMaterialApp(
        child: AppVersionLabel(),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);
  });
}
