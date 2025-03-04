import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inclass8/main.dart';

void main() {
  testWidgets('MyApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);
  });
}
