import 'package:flutter/material.dart';
import 'package:flutter_next_weather/common/error/failure.dart';
import 'package:flutter_next_weather/presentation/widgets/failure_dependent.dart';
import 'package:flutter_next_weather/presentation/widgets/network_error_message.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/localized_material_app.dart';

void main() {
  const child = Icon(Icons.add);
  final failure = UnexpectedFailure();

  testWidgets('FailureDependent should show child when no failure is passed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: FailureDependent(
          onRetry: () => {},
          child: child,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final childFinder = find.byType(child.runtimeType);
    expect(childFinder, findsOneWidget);
  });

  testWidgets('FailureDependent should not show child when failure is passed',
      (WidgetTester tester) async {
    void onTapped() => {};

    await tester.pumpWidget(
      LocalizedMaterialApp(
        child: FailureDependent(
          failure: failure,
          onRetry: onTapped,
          child: child,
        ),
      ),
    );
    await tester.pumpAndSettle();

    final errorMessageFinder = find.byType(NetworkErrorMessage);
    expect(errorMessageFinder, findsOneWidget);

    final NetworkErrorMessage errorMessage = tester.widget(errorMessageFinder);
    expect(errorMessage.onTap, onTapped);

    final childFinder = find.byType(child.runtimeType);
    expect(childFinder, findsNothing);
  });
}
