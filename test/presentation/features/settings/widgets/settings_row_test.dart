import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/settings_row.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../widgets/utils/localized_material_app.dart';

void main() {
  const title = 'title';
  const leading = Icon(Icons.add);
  const trailing = Icon(Icons.delete);

  testWidgets('SettingsRow should show required parameter elements', (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: SettingsRow(
          leading: leading,
          title: title,
          onSelected: () => {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final leadingFinder = find.byWidget(leading);
    expect(leadingFinder, findsOneWidget);

    final textFinder = find.byType(Text);
    final Text titleText = tester.widget(textFinder);
    expect(titleText.data, title);
  });

  testWidgets('SettingsRow should show optional trailing widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: SettingsRow(
          leading: leading,
          title: title,
          trailing: trailing,
          onSelected: () => {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final trailingFinder = find.byWidget(trailing);
    expect(trailingFinder, findsOneWidget);
  });

  testWidgets('SettingsRow should call onSelected then tapped', (WidgetTester tester) async {
    bool onSelectedCalled = false;
    void onSelected() => onSelectedCalled = true;

    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: SettingsRow(
          leading: leading,
          title: title,
          trailing: trailing,
          onSelected: onSelected,
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(SettingsRow));
    await tester.pump();

    expect(onSelectedCalled, isTrue);
  });
}
