import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../shared_setup/test_helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'Pressing the icon button on home view, should increment the number on text',
      (WidgetTester tester) async {
    /// Arrange
    await setupWidget(tester);

    /// Act
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    /// Assert
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
