import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/manish/manish_app.dart';

void main() {
  testWidgets('ManishApp builds successfully smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ManishApp());
    expect(find.byType(ManishApp), findsOneWidget);
  });
}
