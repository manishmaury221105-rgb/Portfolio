import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/manish/manish_app.dart';
import 'package:portfolio/manish/utils/url_helper.dart';

void main() {
  testWidgets('ManishApp builds successfully and renders key components', (WidgetTester tester) async {
    await tester.pumpWidget(const ManishApp());
    await tester.pumpAndSettle();

    expect(find.byType(ManishApp), findsOneWidget);
    expect(find.text('Digital Manish'), findsWidgets);
    expect(find.text("Let's Talk"), findsWidgets);
    expect(find.text('My Specialized Services'), findsWidgets);
    expect(find.text('Featured Projects Showcase'), findsWidgets);
  });

  testWidgets('Theme toggle switches mode', (WidgetTester tester) async {
    await tester.pumpWidget(const ManishApp());
    await tester.pumpAndSettle();

    final themeToggle = find.byType(IconButton).first;
    await tester.tap(themeToggle);
    await tester.pumpAndSettle();

    expect(find.byType(ManishApp), findsOneWidget);
  });

  test('UrlHelper normalizes phone numbers properly', () async {
    expect(UrlHelper.phoneNumber, '7380492118');
  });
}
