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
    expect(find.text('Home'), findsWidgets);
    expect(find.text('Services'), findsWidgets);
    expect(find.text('Projects'), findsWidgets);
    expect(find.text('Contact'), findsWidgets);
  });

  testWidgets('Navigation bar switches tabs smoothly', (WidgetTester tester) async {
    await tester.pumpWidget(const ManishApp());
    await tester.pumpAndSettle();

    // Tap on Services Tab
    final servicesTab = find.widgetWithText(InkWell, 'Services').first;
    await tester.tap(servicesTab);
    await tester.pumpAndSettle();

    expect(find.text('My Specialized Services'), findsWidgets);

    // Tap on Projects Tab
    final projectsTab = find.widgetWithText(InkWell, 'Projects').first;
    await tester.tap(projectsTab);
    await tester.pumpAndSettle();

    expect(find.text('Featured Projects Showcase'), findsWidgets);

    // Tap on Contact Tab
    final contactTab = find.widgetWithText(InkWell, 'Contact').first;
    await tester.tap(contactTab);
    await tester.pumpAndSettle();

    expect(find.text('Send a Message'), findsWidgets);
  });

  testWidgets('Admin Panel opens when tuning icon is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const ManishApp());
    await tester.pumpAndSettle();

    final adminBtn = find.byIcon(Icons.tune_rounded);
    expect(adminBtn, findsOneWidget);
    await tester.tap(adminBtn);
    await tester.pumpAndSettle();

    expect(find.text('Admin Control Center'), findsOneWidget);
  });

  test('UrlHelper normalizes phone numbers properly', () async {
    // Tests ensuring no double country code prefixes
    expect(UrlHelper.phoneNumber, '7380492118');
  });
}
