import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_config_model.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../models/why_work_model.dart';
import '../theme/app_colors.dart';
import '../utils/app_localization.dart';
import 'portfolio_data.dart';

/// Ultra-Fast Self-Contained Local Database & CMS Storage Service.
/// Stores all portfolio data, services, projects, why work items, and configuration
/// locally inside persistent device / browser storage with 0ms in-memory reactivity,
/// background disk sync, 100% offline support, and full JSON backup export & restore.
class CmsStorageService extends ChangeNotifier {
  static const String _keyProfileConfig = 'manish_cms_profile_config_v3';
  static const String _keyServices = 'manish_cms_services_v3';
  static const String _keyProjects = 'manish_cms_projects_v3';
  static const String _keyWhyWork = 'manish_cms_why_work_v3';
  static const String _keyLanguage = 'manish_portfolio_lang_v3';

  SharedPreferences? _prefs;
  ProfileConfigModel _config = PortfolioData.defaultConfig;
  List<ServiceModel> _services = List.from(PortfolioData.defaultServices);
  List<ProjectModel> _projects = List.from(PortfolioData.defaultProjects);
  List<WhyWorkModel> _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);
  AppLanguage _language = AppLanguage.hinglish;
  bool _isLoaded = false;
  Future<void>? _loadFuture;

  ProfileConfigModel get config => _config;
  List<ServiceModel> get services => _services;
  List<ProjectModel> get projects => _projects;
  List<WhyWorkModel> get whyWorkList => _whyWorkList;
  AppLanguage get language => _language;
  AppLocalization get loc => AppLocalization(_language);
  bool get isLoaded => _isLoaded;
  bool get isLocalDatabaseReady => _isLoaded;

  // Compatibility flags
  bool get isRealtimeConnected => true;
  bool get isSyncingWithCloud => false;

  CmsStorageService() {
    loadData();
  }

  Future<void> loadData() {
    _loadFuture ??= _performLoadData();
    return _loadFuture!;
  }

  Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  List<ServiceModel> _mergeServicesWithDefaults(List<ServiceModel> input) {
    final list = List<ServiceModel>.from(input);
    if (list.length < 4) {
      for (final ds in PortfolioData.defaultServices) {
        if (!list.any((s) => s.id == ds.id)) {
          list.add(ds);
        }
        if (list.length >= 4) break;
      }
    }
    return list;
  }

  List<ProjectModel> _mergeProjectsWithDefaults(List<ProjectModel> input) {
    final list = List<ProjectModel>.from(input);
    if (list.length < 4) {
      for (final dp in PortfolioData.defaultProjects) {
        if (!list.any((p) => p.id == dp.id)) {
          list.add(dp);
        }
        if (list.length >= 4) break;
      }
    }
    return list;
  }

  Future<void> _performLoadData() async {
    try {
      final prefs = await _getPrefs();

      // Load language preference
      final langRaw = prefs.getString(_keyLanguage);
      if (langRaw != null && langRaw.isNotEmpty) {
        _language = AppLanguage.fromString(langRaw);
      } else {
        _language = AppLanguage.hinglish;
      }

      final configRaw = prefs.getString(_keyProfileConfig);
      if (configRaw != null && configRaw.isNotEmpty) {
        _config = ProfileConfigModel.fromJson(jsonDecode(configRaw));
      } else {
        _config = PortfolioData.defaultConfig;
      }

      final servicesRaw = prefs.getString(_keyServices);
      if (servicesRaw != null && servicesRaw.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(servicesRaw);
        final loaded = decoded
            .map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
            .toList();
        _services = _mergeServicesWithDefaults(loaded);
      } else {
        _services = List.from(PortfolioData.defaultServices);
      }

      final projectsRaw = prefs.getString(_keyProjects);
      if (projectsRaw != null && projectsRaw.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(projectsRaw);
        final loaded = decoded
            .map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
            .toList();
        _projects = _mergeProjectsWithDefaults(loaded);
      } else {
        _projects = List.from(PortfolioData.defaultProjects);
      }

      final whyWorkRaw = prefs.getString(_keyWhyWork);
      if (whyWorkRaw != null && whyWorkRaw.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(whyWorkRaw);
        _whyWorkList = decoded
            .map((e) => WhyWorkModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);
      }

      _isLoaded = true;
      AppColors.applyFromConfig(_config);
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading local CMS database: $e');
      _config = PortfolioData.defaultConfig;
      _services = List.from(PortfolioData.defaultServices);
      _projects = List.from(PortfolioData.defaultProjects);
      _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);
      _language = AppLanguage.hinglish;
      _isLoaded = true;
      AppColors.applyFromConfig(_config);
      notifyListeners();
    }
  }

  // --- Language Switcher (Instant 0ms update + Local Persistence) ---
  Future<void> setLanguage(AppLanguage newLang) async {
    if (_language == newLang) return;
    _language = newLang;
    notifyListeners();
    final prefs = await _getPrefs();
    await prefs.setString(_keyLanguage, newLang.name);
  }

  // --- Profile & Site Config Updates (Instant 0ms UI update + background persist) ---
  Future<void> updateConfig(ProfileConfigModel newConfig) async {
    _config = newConfig;
    AppColors.applyFromConfig(_config);
    notifyListeners();
    final prefs = await _getPrefs();
    await prefs.setString(_keyProfileConfig, jsonEncode(_config.toJson()));
  }

  // --- Services Full CRUD (Instant 0ms UI update + background persist) ---
  Future<void> addService(ServiceModel service) async {
    _services.add(service);
    notifyListeners();
    await _saveServices();
  }

  Future<void> updateService(ServiceModel service) async {
    final index = _services.indexWhere((s) => s.id == service.id);
    if (index != -1) {
      _services[index] = service;
      notifyListeners();
      await _saveServices();
    }
  }

  Future<void> deleteService(String id) async {
    _services.removeWhere((s) => s.id == id);
    notifyListeners();
    await _saveServices();
  }

  Future<void> reorderServices(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = _services.removeAt(oldIndex);
    _services.insert(newIndex, item);
    notifyListeners();
    await _saveServices();
  }

  Future<void> _saveServices() async {
    final prefs = await _getPrefs();
    final jsonStr = jsonEncode(_services.map((s) => s.toJson()).toList());
    await prefs.setString(_keyServices, jsonStr);
  }

  // --- Projects Full CRUD (Instant 0ms UI update + background persist) ---
  Future<void> addProject(ProjectModel project) async {
    _projects.insert(0, project);
    notifyListeners();
    await _saveProjects();
  }

  Future<void> updateProject(ProjectModel project) async {
    final index = _projects.indexWhere((p) => p.id == project.id);
    if (index != -1) {
      _projects[index] = project;
      notifyListeners();
      await _saveProjects();
    }
  }

  Future<void> deleteProject(String id) async {
    _projects.removeWhere((p) => p.id == id);
    notifyListeners();
    await _saveProjects();
  }

  Future<void> reorderProjects(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = _projects.removeAt(oldIndex);
    _projects.insert(newIndex, item);
    notifyListeners();
    await _saveProjects();
  }

  Future<void> _saveProjects() async {
    final prefs = await _getPrefs();
    final jsonStr = jsonEncode(_projects.map((p) => p.toJson()).toList());
    await prefs.setString(_keyProjects, jsonStr);
  }

  // --- Why Work With Me Pillars Full CRUD (Instant 0ms UI update + background persist) ---
  Future<void> addWhyWorkItem(WhyWorkModel item) async {
    _whyWorkList.add(item);
    notifyListeners();
    await _saveWhyWork();
  }

  Future<void> updateWhyWorkItem(WhyWorkModel item) async {
    final index = _whyWorkList.indexWhere((w) => w.id == item.id);
    if (index != -1) {
      _whyWorkList[index] = item;
      notifyListeners();
      await _saveWhyWork();
    }
  }

  Future<void> deleteWhyWorkItem(String id) async {
    _whyWorkList.removeWhere((w) => w.id == id);
    notifyListeners();
    await _saveWhyWork();
  }

  Future<void> _saveWhyWork() async {
    final prefs = await _getPrefs();
    final jsonStr = jsonEncode(_whyWorkList.map((w) => w.toJson()).toList());
    await prefs.setString(_keyWhyWork, jsonStr);
  }

  // --- Backup Export & Import ---
  String exportAllDataAsJson() {
    final Map<String, dynamic> fullBackup = {
      'version': '3.0',
      'timestamp': DateTime.now().toIso8601String(),
      'type': 'self_contained_local_database',
      'language': _language.name,
      'config': _config.toJson(),
      'services': _services.map((s) => s.toJson()).toList(),
      'projects': _projects.map((p) => p.toJson()).toList(),
      'whyWorkList': _whyWorkList.map((w) => w.toJson()).toList(),
    };
    return const JsonEncoder.withIndent('  ').convert(fullBackup);
  }

  Future<bool> importDataFromJson(String jsonString) async {
    try {
      final Map<String, dynamic> decoded = jsonDecode(jsonString);
      if (decoded.containsKey('language')) {
        _language = AppLanguage.fromString(decoded['language'] as String?);
      }
      if (decoded.containsKey('config')) {
        _config = ProfileConfigModel.fromJson(decoded['config'] as Map<String, dynamic>);
      }
      if (decoded.containsKey('services')) {
        final List<dynamic> list = decoded['services'];
        _services = list.map((e) => ServiceModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
      }
      if (decoded.containsKey('projects')) {
        final List<dynamic> list = decoded['projects'];
        _projects = list.map((e) => ProjectModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
      }
      if (decoded.containsKey('whyWorkList')) {
        final List<dynamic> list = decoded['whyWorkList'];
        _whyWorkList = list.map((e) => WhyWorkModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
      }

      final prefs = await _getPrefs();
      await prefs.setString(_keyLanguage, _language.name);
      await prefs.setString(_keyProfileConfig, jsonEncode(_config.toJson()));
      await prefs.setString(_keyServices, jsonEncode(_services.map((s) => s.toJson()).toList()));
      await prefs.setString(_keyProjects, jsonEncode(_projects.map((p) => p.toJson()).toList()));
      await prefs.setString(_keyWhyWork, jsonEncode(_whyWorkList.map((w) => w.toJson()).toList()));

      AppColors.applyFromConfig(_config);
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error importing local database JSON: $e');
      return false;
    }
  }

  // --- Factory Reset ---
  Future<void> resetToDefaults() async {
    final prefs = await _getPrefs();
    await prefs.remove(_keyLanguage);
    await prefs.remove(_keyProfileConfig);
    await prefs.remove(_keyServices);
    await prefs.remove(_keyProjects);
    await prefs.remove(_keyWhyWork);

    _language = AppLanguage.hinglish;
    _config = PortfolioData.defaultConfig;
    _services = List.from(PortfolioData.defaultServices);
    _projects = List.from(PortfolioData.defaultProjects);
    _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);

    AppColors.applyFromConfig(_config);
    notifyListeners();
  }
}
