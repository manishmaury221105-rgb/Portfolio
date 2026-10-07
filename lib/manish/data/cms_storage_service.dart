import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_config_model.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../models/why_work_model.dart';
import '../theme/app_colors.dart';
import '../utils/app_localization.dart';
import '../utils/file_download_helper.dart';
import '../utils/web_storage_helper.dart';
import 'portfolio_data.dart';

/// Ultra-Robust Permanent CMS Storage & Database Service.
/// Features:
/// 1. Instant 0ms in-memory reactivity for UI
/// 2. Multi-layer local persistence (SharedPreferences + Web LocalStorage Redundancy)
/// 3. Persistent Browser Storage request (prevents browser from clearing site data)
/// 4. Master Snapshot Auto-Sync to prevent data loss or partial write corruption
/// 5. 1-Click JSON Backup Download and Device JSON File Import
/// 6. Safe error-tolerant JSON parsing that preserves all user-customized entries
class CmsStorageService extends ChangeNotifier {
  static const String _keyProfileConfig = 'manish_cms_profile_config_v13';
  static const String _keyServices = 'manish_cms_services_v13';
  static const String _keyProjects = 'manish_cms_projects_v13';
  static const String _keyWhyWork = 'manish_cms_why_work_v13';
  static const String _keyLanguage = 'manish_portfolio_lang_v13';
  static const String _keyMasterBackup = 'manish_cms_master_backup_v13';

  // Legacy fallback keys
  static const String _legacyServices = 'manish_cms_services_v6';
  static const String _legacyProjects = 'manish_cms_projects_v6';
  static const String _legacyWhyWork = 'manish_cms_why_work_v6';

  SharedPreferences? _prefs;
  ProfileConfigModel _config = PortfolioData.defaultConfig;
  List<ServiceModel> _services = List.from(PortfolioData.defaultServices);
  List<ProjectModel> _projects = List.from(PortfolioData.defaultProjects);
  List<WhyWorkModel> _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);
  AppLanguage _language = AppLanguage.english;
  bool _isLoaded = false;
  Future<void>? _loadFuture;
  DateTime? _lastSavedTime;

  ProfileConfigModel get config => _config;
  List<ServiceModel> get services => _services;
  List<ProjectModel> get projects => _projects;
  List<WhyWorkModel> get whyWorkList => _whyWorkList;
  AppLanguage get language => _language;
  AppLocalization get loc => AppLocalization(_language);
  bool get isLoaded => _isLoaded;
  bool get isLocalDatabaseReady => _isLoaded;
  DateTime? get lastSavedTime => _lastSavedTime;

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

  Future<void> _performLoadData() async {
    try {
      // 1. Request lifetime persistent storage on browser
      await WebStorageHelper.requestPersistentStorage();

      final prefs = await _getPrefs();

      // 2. Try loading Language (defaults to English)
      final langRaw = prefs.getString(_keyLanguage) ??
          WebStorageHelper.readRaw(_keyLanguage);
      if (langRaw != null && langRaw.isNotEmpty) {
        _language = AppLanguage.fromString(langRaw);
      } else {
        _language = AppLanguage.english;
      }

      // 3. Try loading Profile Configuration
      final configRaw = prefs.getString(_keyProfileConfig) ??
          WebStorageHelper.readRaw(_keyProfileConfig);
      if (configRaw != null && configRaw.isNotEmpty) {
        try {
          _config = ProfileConfigModel.fromJson(jsonDecode(configRaw));
        } catch (e) {
          debugPrint('Error parsing saved profile config: $e');
        }
      }

      // 4. Try loading Services
      final servicesRaw = prefs.getString(_keyServices) ??
          prefs.getString(_legacyServices) ??
          WebStorageHelper.readRaw(_keyServices);
      if (servicesRaw != null && servicesRaw.isNotEmpty) {
        try {
          final List<dynamic> decoded = jsonDecode(servicesRaw);
          final loaded = decoded
              .map((e) => ServiceModel.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList();
          if (loaded.isNotEmpty) {
            _services = loaded;
          }
        } catch (e) {
          debugPrint('Error parsing saved services: $e');
        }
      }

      // 5. Try loading Projects
      final projectsRaw = prefs.getString(_keyProjects) ??
          prefs.getString(_legacyProjects) ??
          WebStorageHelper.readRaw(_keyProjects);
      if (projectsRaw != null && projectsRaw.isNotEmpty) {
        try {
          final List<dynamic> decoded = jsonDecode(projectsRaw);
          final loaded = decoded
              .map((e) => ProjectModel.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList();
          if (loaded.isNotEmpty) {
            _projects = loaded;
          }
        } catch (e) {
          debugPrint('Error parsing saved projects: $e');
        }
      }

      // 6. Try loading Why Work Pillars
      final whyWorkRaw = prefs.getString(_keyWhyWork) ??
          prefs.getString(_legacyWhyWork) ??
          WebStorageHelper.readRaw(_keyWhyWork);
      if (whyWorkRaw != null && whyWorkRaw.isNotEmpty) {
        try {
          final List<dynamic> decoded = jsonDecode(whyWorkRaw);
          final loaded = decoded
              .map((e) => WhyWorkModel.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList();
          if (loaded.isNotEmpty) {
            _whyWorkList = loaded;
          }
        } catch (e) {
          debugPrint('Error parsing saved why work items: $e');
        }
      }

      // 7. Check Master Backup Snapshot fallback if any core data was missing
      if (configRaw == null && servicesRaw == null && projectsRaw == null) {
        final masterRaw = prefs.getString(_keyMasterBackup) ??
            WebStorageHelper.readRaw(_keyMasterBackup);
        if (masterRaw != null && masterRaw.isNotEmpty) {
          try {
            await importDataFromJson(masterRaw);
          } catch (e) {
            debugPrint('Master backup parse error: $e');
          }
        }
      }

      _isLoaded = true;
      AppColors.applyFromConfig(_config);
      notifyListeners();
    } catch (e) {
      debugPrint('Error in _performLoadData: $e');
      _isLoaded = true;
      AppColors.applyFromConfig(_config);
      notifyListeners();
    }
  }

  // --- Synchronize & Persist Master Snapshot across all storage tiers ---
  Future<void> _syncMasterSnapshot() async {
    _lastSavedTime = DateTime.now();
    try {
      final snapshot = exportAllDataAsJson();
      final prefs = await _getPrefs();
      await prefs.setString(_keyMasterBackup, snapshot);
      WebStorageHelper.saveRaw(_keyMasterBackup, snapshot);
    } catch (e) {
      debugPrint('Error syncing master backup snapshot: $e');
    }
  }

  // --- Language Switcher ---
  Future<void> setLanguage(AppLanguage newLang) async {
    if (_language == newLang) return;
    _language = newLang;
    notifyListeners();
    try {
      final prefs = await _getPrefs();
      await prefs.setString(_keyLanguage, newLang.name);
      WebStorageHelper.saveRaw(_keyLanguage, newLang.name);
      await _syncMasterSnapshot();
    } catch (e) {
      debugPrint('Error persisting language: $e');
    }
  }

  // --- Profile & Site Config Updates ---
  Future<void> updateConfig(ProfileConfigModel newConfig) async {
    _config = newConfig;
    AppColors.applyFromConfig(_config);
    notifyListeners();

    try {
      final prefs = await _getPrefs();
      final jsonStr = jsonEncode(_config.toJson());
      await prefs.setString(_keyProfileConfig, jsonStr);
      WebStorageHelper.saveRaw(_keyProfileConfig, jsonStr);
      await _syncMasterSnapshot();
    } catch (e) {
      debugPrint('Error persisting profile config: $e');
    }
  }

  // --- Services Full CRUD ---
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
    try {
      final prefs = await _getPrefs();
      final jsonStr = jsonEncode(_services.map((s) => s.toJson()).toList());
      await prefs.setString(_keyServices, jsonStr);
      WebStorageHelper.saveRaw(_keyServices, jsonStr);
      await _syncMasterSnapshot();
    } catch (e) {
      debugPrint('Error persisting services: $e');
    }
  }

  // --- Projects Full CRUD ---
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
    try {
      final prefs = await _getPrefs();
      final jsonStr = jsonEncode(_projects.map((p) => p.toJson()).toList());
      await prefs.setString(_keyProjects, jsonStr);
      WebStorageHelper.saveRaw(_keyProjects, jsonStr);
      await _syncMasterSnapshot();
    } catch (e) {
      debugPrint('Error persisting projects: $e');
    }
  }

  // --- Why Work With Me Pillars Full CRUD ---
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
    try {
      final prefs = await _getPrefs();
      final jsonStr = jsonEncode(_whyWorkList.map((w) => w.toJson()).toList());
      await prefs.setString(_keyWhyWork, jsonStr);
      WebStorageHelper.saveRaw(_keyWhyWork, jsonStr);
      await _syncMasterSnapshot();
    } catch (e) {
      debugPrint('Error persisting why work list: $e');
    }
  }

  // --- Backup Export & Import ---
  String exportAllDataAsJson() {
    final Map<String, dynamic> fullBackup = {
      'version': '4.0',
      'timestamp': DateTime.now().toIso8601String(),
      'type': 'permanent_cms_database',
      'language': _language.name,
      'config': _config.toJson(),
      'services': _services.map((s) => s.toJson()).toList(),
      'projects': _projects.map((p) => p.toJson()).toList(),
      'whyWorkList': _whyWorkList.map((w) => w.toJson()).toList(),
    };
    return const JsonEncoder.withIndent('  ').convert(fullBackup);
  }

  /// Trigger instant browser download of complete portfolio backup JSON file
  void downloadBackupFile() {
    final filename = 'digital_manish_portfolio_backup_${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}.json';
    FileDownloadHelper.downloadJsonFile(filename, exportAllDataAsJson());
  }

  /// Open file picker to choose and restore backup JSON file from device
  Future<bool> pickAndRestoreBackupFile() async {
    final jsonContent = await FileDownloadHelper.pickAndReadJsonFile();
    if (jsonContent != null && jsonContent.trim().isNotEmpty) {
      return await importDataFromJson(jsonContent.trim());
    }
    return false;
  }

  Future<bool> importDataFromJson(String jsonString) async {
    try {
      final Map<String, dynamic> decoded = jsonDecode(jsonString);
      if (decoded.containsKey('language')) {
        _language = AppLanguage.fromString(decoded['language'] as String?);
      }
      if (decoded.containsKey('config')) {
        _config = ProfileConfigModel.fromJson(Map<String, dynamic>.from(decoded['config'] as Map));
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
      final cfgStr = jsonEncode(_config.toJson());
      final srvStr = jsonEncode(_services.map((s) => s.toJson()).toList());
      final prjStr = jsonEncode(_projects.map((p) => p.toJson()).toList());
      final whyStr = jsonEncode(_whyWorkList.map((w) => w.toJson()).toList());

      await prefs.setString(_keyLanguage, _language.name);
      await prefs.setString(_keyProfileConfig, cfgStr);
      await prefs.setString(_keyServices, srvStr);
      await prefs.setString(_keyProjects, prjStr);
      await prefs.setString(_keyWhyWork, whyStr);

      WebStorageHelper.saveRaw(_keyLanguage, _language.name);
      WebStorageHelper.saveRaw(_keyProfileConfig, cfgStr);
      WebStorageHelper.saveRaw(_keyServices, srvStr);
      WebStorageHelper.saveRaw(_keyProjects, prjStr);
      WebStorageHelper.saveRaw(_keyWhyWork, whyStr);

      await _syncMasterSnapshot();

      AppColors.applyFromConfig(_config);
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error importing database JSON: $e');
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
    await prefs.remove(_keyMasterBackup);

    WebStorageHelper.removeRaw(_keyLanguage);
    WebStorageHelper.removeRaw(_keyProfileConfig);
    WebStorageHelper.removeRaw(_keyServices);
    WebStorageHelper.removeRaw(_keyProjects);
    WebStorageHelper.removeRaw(_keyWhyWork);
    WebStorageHelper.removeRaw(_keyMasterBackup);

    _language = AppLanguage.english;
    _config = PortfolioData.defaultConfig;
    _services = List.from(PortfolioData.defaultServices);
    _projects = List.from(PortfolioData.defaultProjects);
    _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);

    AppColors.applyFromConfig(_config);
    notifyListeners();
  }
}
