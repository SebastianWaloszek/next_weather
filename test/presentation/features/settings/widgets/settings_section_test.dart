import 'package:flutter/material.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/settings_row.dart';
import 'package:flutter_next_weather/presentation/features/settings/widgets/settings_section.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../widgets/utils/localized_material_app.dart';

void main() {
  const String title = 'Section title';
  final firstSettingsRow = SettingsRow(leading: const Icon(Icons.add), title: 'settingsRow1', onSelected: () => {});
  final secondSettingsRow = SettingsRow(leading: const Icon(Icons.delete), title: 'settingsRow2', onSelected: () => {});
  final List<Widget> rows = [firstSettingsRow, secondSettingsRow];

  testWidgets('SettingsSection should show all row elements and title', (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: SettingsSection(
          title: title,
          rows: rows,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byWidgetPredicate(
      (widget) => widget is Text && widget.data == title,
    );
    expect(textFinder, findsOneWidget);

    final Text text = tester.widget(textFinder);
    expect(text.data, title);

    final firstRowFinder = find.byWidget(firstSettingsRow);
    expect(firstRowFinder, findsOneWidget);

    final secondRowFinder = find.byWidget(secondSettingsRow);
    expect(secondRowFinder, findsOneWidget);
  });

  testWidgets('SettingsSection should show not show title when not specified', (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: SettingsSection(
          rows: rows,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final textFinder = find.byWidgetPredicate(
      (widget) => widget is Text && widget.data == title,
    );
    expect(textFinder, findsNothing);

    final firstRowFinder = find.byWidget(firstSettingsRow);
    expect(firstRowFinder, findsOneWidget);

    final secondRowFinder = find.byWidget(secondSettingsRow);
    expect(secondRowFinder, findsOneWidget);
  });
}
