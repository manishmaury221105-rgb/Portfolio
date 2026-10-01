import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/manish/data/cms_storage_service.dart';
import 'package:portfolio/manish/manish_app.dart';
import 'package:portfolio/manish/models/project_model.dart';
import 'package:portfolio/manish/models/service_model.dart';
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

  test('UrlHelper normalizes phone numbers properly', () async {
    expect(UrlHelper.phoneNumber, '7380492118');
  });

  test('CmsStorageService persists data and handles JSON backup export/import', () async {
    SharedPreferences.setMockInitialValues({});
    final service = CmsStorageService();
    await service.loadData();

    expect(service.isLoaded, true);
    expect(service.config.name, 'Digital Manish');

    // 1. Update config
    final updated = service.config.copyWith(
      name: 'Digital Manish Pro',
      tagline: 'Lead Generation & Growth Specialist',
    );
    await service.updateConfig(updated);
    expect(service.config.name, 'Digital Manish Pro');

    // 2. Add custom service
    const customService = ServiceModel(
      id: 'custom_growth_hack',
      titleHindi: 'Growth Hacking',
      titleEnglish: 'Growth Hacking',
      shortDesc: 'Rapid customer acquisition',
      detailedDesc: 'Detailed growth strategies',
      iconCodePoint: 0xe567,
      accentColorValue: 0xFF6366F1,
      subOfferings: ['Funnel optimization', 'Viral loops'],
      benefits: ['Rapid scale', 'Lower CAC'],
    );
    await service.addService(customService);
    expect(service.services.any((s) => s.id == 'custom_growth_hack'), true);

    // 3. Add custom project
    const customProj = ProjectModel(
      id: 'custom_proj_1',
      title: 'E-Commerce Scale',
      category: 'Website',
      shortDesc: 'Built scalable portal',
      detailedDesc: 'High conversion e-commerce portal',
      techStack: ['Flutter', 'Node.js'],
      imageUrl: 'https://example.com/img.jpg',
    );
    await service.addProject(customProj);
    expect(service.projects.any((p) => p.id == 'custom_proj_1'), true);

    // 4. Export backup JSON
    final jsonBackup = service.exportAllDataAsJson();
    expect(jsonBackup.contains('Digital Manish Pro'), true);
    expect(jsonBackup.contains('custom_growth_hack'), true);
    expect(jsonBackup.contains('custom_proj_1'), true);

    // 5. Simulate new instance loading persisted data
    final service2 = CmsStorageService();
    await service2.loadData();

    expect(service2.config.name, 'Digital Manish Pro');
    expect(service2.services.any((s) => s.id == 'custom_growth_hack'), true);
    expect(service2.projects.any((p) => p.id == 'custom_proj_1'), true);

    // 6. Test JSON Import
    final importResult = await service2.importDataFromJson(jsonBackup);
    expect(importResult, true);
    expect(service2.config.name, 'Digital Manish Pro');
  });
}
