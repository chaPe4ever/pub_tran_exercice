import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pub_tran_exercise/globals/constants.dart';
import 'package:pub_tran_exercise/ui/views/widgets/custom_floating_search_bar/widgets/search_body/widgets/location_picked_card_info.dart';

import '../shared_setup/test_helper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'Pressing on search text field on home view, writing the text hauptbahnhof, should give a callback with one result',
      (WidgetTester tester) async {
    /// Arrange
    await setupWidget(tester);
    Key inkWellKey = Key(kInkWellKey);

    /// Act
    await tester.tap(find.byType(CircularButton));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.enterText(find.byType(FloatingSearchBar), 'Hauptbahnhof');
    await tester.pumpAndSettle(Duration(seconds: 2));

    /// Assert
    expect(find.byKey(inkWellKey), findsOneWidget);
  });

  testWidgets(
      'Tapping on the search result, should populate the search info body',
      (WidgetTester tester) async {
    /// Arrange
    await setupWidget(tester);
    Key inkWellKey = Key(kInkWellKey);

    /// Act
    await tester.tap(find.byType(CircularButton));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.enterText(find.byType(FloatingSearchBar), 'Hauptbahnhof');
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(inkWellKey));
    await tester.pumpAndSettle(Duration(seconds: 1));

    /// Assert
    expect(find.byType(LocationPickedCardInfo), findsOneWidget);
  });

  testWidgets(
      'Tapping on the clear button on a searched item, should clear the body',
      (WidgetTester tester) async {
    /// Arrange
    await setupWidget(tester);
    Key inkWellKey = Key(kInkWellKey);

    /// Act
    await tester.tap(find.byType(CircularButton));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.enterText(find.byType(FloatingSearchBar), 'Hauptbahnhof');
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(inkWellKey));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(find.byIcon(Icons.clear));
    await tester.pumpAndSettle();

    /// Assert
    expect(find.byType(LocationPickedCardInfo), findsNothing);
  });
}
