// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:custombank/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CustomBankApp());
    expect(find.text('CustomBank'), findsOneWidget);
  });
}