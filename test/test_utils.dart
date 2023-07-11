import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder widgetWithText<T>(String text) {
  return find.ancestor(
      of: find.text(text),
      matching: find.byWidgetPredicate((widget) => widget is T));
}

Finder widgetWithIcon<T>(IconData icon) {
  return find.ancestor(
      of: find.byIcon(icon),
      matching: find.byWidgetPredicate((widget) => widget is T));
}
