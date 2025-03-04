import 'package:flutter_test/flutter_test.dart';
import 'package:inclass8/main.dart'; // Ensure this path is correct

void main() {
  testWidgets('MyApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that MyApp is present in the widget tree.
    expect(find.byType(MyApp), findsOneWidget);
  });
}
