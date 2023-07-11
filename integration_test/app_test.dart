import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_namer_app/main.dart' as app;

import '../test/test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the like button, verify favorite button icon changes',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the favorite border icon is shown
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);

      // Finds the like button button to tap on.
      final likeButton = widgetWithText<ElevatedButton>('Like');

      // Emulate a tap on the floating action button.
      await tester.tap(likeButton);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the like button icon is updated.
      expect(find.byIcon(Icons.favorite_border), findsNothing);
      expect(widgetWithIcon<ElevatedButton>(Icons.favorite), findsOneWidget);
    });
  });
}
