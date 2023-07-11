// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_namer_app/main.dart';

import 'test_utils.dart';

void main() {
  testWidgets('Like button smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify the favorite border icon is shown
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    // Finds the like button button to tap on.
    final likeButtonText = widgetWithText<ElevatedButton>('Like');
    expect(likeButtonText, findsOneWidget);

    // Emulate a tap on the floating action button.
    await tester.tap(likeButtonText);

    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify the like button icon is updated.
    expect(find.byIcon(Icons.favorite_border), findsNothing);
    expect(widgetWithIcon<ElevatedButton>(Icons.favorite), findsOneWidget);
  });
}
