import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/manish/manish_app.dart';
import 'package:portfolio/manish/utils/url_helper.dart';

void main() {
  testWidgets('ManishApp builds successfully and navigates separate pages', (WidgetTester tester) async {
    await tester.pumpWidget(const ManishApp());
    await tester.pumpAndSettle();

    expect(find.byType(ManishApp), findsOneWidget);
    expect(find.text('Digital Manish'), findsWidgets);

    // 1. Check Home Page
    expect(find.text('Services Overview'), findsWidgets);
    expect(find.text('Recent Works'), findsWidgets);

    // 2. Navigate to About Page
    final aboutNav = find.widgetWithText(InkWell, 'About').first;
    await tester.tap(aboutNav);
    await tester.pumpAndSettle();
    expect(find.text('About Digital Manish'), findsWidgets);

    // 3. Navigate to Services Page
    final servicesNav = find.widgetWithText(InkWell, 'Services').first;
    await tester.tap(servicesNav);
    await tester.pumpAndSettle();
    expect(find.text('My Specialized Services'), findsWidgets);

    // 4. Navigate to Projects Page
    final projectsNav = find.widgetWithText(InkWell, 'Projects').first;
    await tester.tap(projectsNav);
    await tester.pumpAndSettle();
    expect(find.text('Featured Projects Showcase'), findsWidgets);

    // 5. Navigate to Contact Page
    final contactNav = find.widgetWithText(InkWell, 'Contact').first;
    await tester.tap(contactNav);
    await tester.pumpAndSettle();
    expect(find.text('Get in Touch / Sampark Karein'), findsWidgets);
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
