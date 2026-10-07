import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_config_model.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../models/why_work_model.dart';
import '../theme/app_colors.dart';
import '../utils/app_localization.dart';
import 'portfolio_data.dart';

/// 100% Pure Local & Static Data Service for Digital Manish Portfolio.
/// All portfolio information (services, projects, profile, pillars) is stored
/// locally in code and assets without any external database or cloud dependency.
class CmsStorageService extends ChangeNotifier {
  static const String _keyLanguage = 'manish_portfolio_lang';

  final ProfileConfigModel _config = PortfolioData.defaultConfig;
  final List<ServiceModel> _services = List.unmodifiable(PortfolioData.defaultServices);
  final List<ProjectModel> _projects = List.unmodifiable(PortfolioData.defaultProjects);
  final List<WhyWorkModel> _whyWorkList = List.unmodifiable(PortfolioData.defaultWhyWorkList);
  AppLanguage _language = AppLanguage.english;
  final bool _isLoaded = true;

  ProfileConfigModel get config => _config;
  List<ServiceModel> get services => _services;
  List<ProjectModel> get projects => _projects;
  List<WhyWorkModel> get whyWorkList => _whyWorkList;
  AppLanguage get language => _language;
  AppLocalization get loc => AppLocalization(_language);
  bool get isLoaded => _isLoaded;
  bool get isLocalDatabaseReady => true;

  CmsStorageService() {
    _initLocalSettings();
  }

  Future<void> _initLocalSettings() async {
    try {
      AppColors.applyFromConfig(_config);
      final prefs = await SharedPreferences.getInstance();
      final savedLang = prefs.getString(_keyLanguage);
      if (savedLang != null && savedLang.isNotEmpty) {
        _language = AppLanguage.fromString(savedLang);
        notifyListeners();
      }
    } catch (_) {
      // Local fallback
    }
  }

  Future<void> setLanguage(AppLanguage newLang) async {
    if (_language == newLang) return;
    _language = newLang;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyLanguage, newLang.name);
    } catch (_) {}
  }
}
