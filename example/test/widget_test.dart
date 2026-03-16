import 'package:flutter_test/flutter_test.dart';
import 'package:lcars_ui_example/main.dart';

void main() {
  testWidgets('LCARS Demo loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LcarsDemoApp());

    // Verify that the header exists.
    expect(find.text('LCARS INTERFACE DEMO'), findsOneWidget);
  });
}
