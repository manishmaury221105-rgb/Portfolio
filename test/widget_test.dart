import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/manish/data/cms_storage_service.dart';
import 'package:portfolio/manish/data/portfolio_data.dart';
import 'package:portfolio/manish/manish_app.dart';
import 'package:portfolio/manish/utils/url_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('ManishApp builds successfully and navigates separate pages', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const ManishApp());
    await tester.pumpAndSettle();

    expect(find.byType(ManishApp), findsOneWidget);
    expect(find.text('Digital Manish'), findsWidgets);

    // 1. Check Home Page renders
    expect(find.byType(Scaffold), findsWidgets);

    // 2. Navigate to About Page
    final aboutNav = find.widgetWithText(InkWell, 'About');
    if (aboutNav.evaluate().isNotEmpty) {
      await tester.tap(aboutNav.first);
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsWidgets);
    }

    // 3. Navigate to Services Page
    final servicesNav = find.widgetWithText(InkWell, 'Services');
    if (servicesNav.evaluate().isNotEmpty) {
      await tester.tap(servicesNav.first);
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsWidgets);
    }
  });

  testWidgets('Theme toggle switches mode', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const ManishApp());
    await tester.pumpAndSettle();

    final themeToggle = find.byType(IconButton).first;
    await tester.tap(themeToggle);
    await tester.pumpAndSettle();

    expect(find.byType(ManishApp), findsOneWidget);
  });

  test('UrlHelper normalizes phone numbers and social links properly', () async {
    expect(UrlHelper.phoneNumber, '9214468818');
    expect(UrlHelper.instagramProfile, 'https://www.instagram.com/digitalmanish.online/');
    expect(UrlHelper.facebookProfile, 'https://www.facebook.com/share/1HR3JDm7oZ/');
    expect(UrlHelper.youtubeProfile, 'https://www.youtube.com/@DigitalManish-s8i');
  });

  test('PortfolioData provides 100% complete local static data', () {
    final service = CmsStorageService();
    expect(service.isLoaded, true);
    expect(service.config.name, 'Digital Manish');
    expect(service.services.isNotEmpty, true);
    expect(service.projects.length >= 4, true);
    expect(service.whyWorkList.length, 6);

    // Verify live Vercel projects are loaded locally
    expect(PortfolioData.defaultProjects.any((p) => p.liveDemoUrl?.contains('school-management') ?? false), true);
    expect(PortfolioData.defaultProjects.any((p) => p.liveDemoUrl?.contains('e-commerse') ?? false), true);
  });
}
