import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../shared_setup/test_helper.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await setupWidget(tester);

    // Tap on patient task card item
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.textContaining('1'), findsOneWidget);
  });
}
