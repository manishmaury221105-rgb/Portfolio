import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_config_model.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../models/why_work_model.dart';
import '../theme/app_colors.dart';
import 'portfolio_data.dart';

class CmsStorageService extends ChangeNotifier {
  static const String _keyProfileConfig = 'manish_cms_profile_config_v3';
  static const String _keyServices = 'manish_cms_services_v3';
  static const String _keyProjects = 'manish_cms_projects_v3';
  static const String _keyWhyWork = 'manish_cms_why_work_v3';

  static const String _collectionName = 'portfolio_cms';
  static const String _docConfig = 'config';
  static const String _docServices = 'services';
  static const String _docProjects = 'projects';
  static const String _docWhyWork = 'why_work';

  ProfileConfigModel _config = PortfolioData.defaultConfig;
  List<ServiceModel> _services = List.from(PortfolioData.defaultServices);
  List<ProjectModel> _projects = List.from(PortfolioData.defaultProjects);
  List<WhyWorkModel> _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);
  bool _isLoaded = false;
  bool _isSyncingWithCloud = false;
  bool _isRealtimeConnected = true;
  Future<void>? _loadFuture;

  ProfileConfigModel get config => _config;
  List<ServiceModel> get services => _services;
  List<ProjectModel> get projects => _projects;
  List<WhyWorkModel> get whyWorkList => _whyWorkList;
  bool get isLoaded => _isLoaded;
  bool get isSyncingWithCloud => _isSyncingWithCloud;
  bool get isRealtimeConnected => _isRealtimeConnected;

  CmsStorageService() {
    loadData();
  }

  Future<void> loadData() {
    _loadFuture ??= _performLoadData();
    return _loadFuture!;
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
    // 1. Fast local cache load for 0ms initial render
    try {
      final prefs = await SharedPreferences.getInstance();

      final configRaw = prefs.getString(_keyProfileConfig);
      if (configRaw != null && configRaw.isNotEmpty) {
        _config = ProfileConfigModel.fromJson(jsonDecode(configRaw));
      } else {
        _config = PortfolioData.defaultConfig;
      }

      final servicesRaw = prefs.getString(_keyServices);
      if (servicesRaw != null && servicesRaw.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(servicesRaw);
        final loaded = decoded.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>)).toList();
        _services = _mergeServicesWithDefaults(loaded);
      } else {
        _services = List.from(PortfolioData.defaultServices);
      }

      final projectsRaw = prefs.getString(_keyProjects);
      if (projectsRaw != null && projectsRaw.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(projectsRaw);
        final loaded = decoded.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>)).toList();
        _projects = _mergeProjectsWithDefaults(loaded);
      } else {
        _projects = List.from(PortfolioData.defaultProjects);
      }

      final whyWorkRaw = prefs.getString(_keyWhyWork);
      if (whyWorkRaw != null && whyWorkRaw.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(whyWorkRaw);
        _whyWorkList = decoded.map((e) => WhyWorkModel.fromJson(e as Map<String, dynamic>)).toList();
      } else {
        _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);
      }

      _isLoaded = true;
      AppColors.applyFromConfig(_config);
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading local CMS cache: $e');
      _config = PortfolioData.defaultConfig;
      _services = List.from(PortfolioData.defaultServices);
      _projects = List.from(PortfolioData.defaultProjects);
      _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);
      _isLoaded = true;
      AppColors.applyFromConfig(_config);
      notifyListeners();
    }

    // 2. Fetch and listen to live Firebase Realtime Database & Cloud Firestore
    _listenToFirebaseRealtime();
    _listenToCloudFirestore();
  }

  void _listenToFirebaseRealtime() {
    try {
      final rtdbRef = FirebaseDatabase.instance.ref(_collectionName);

      // Listen to Config node
      rtdbRef.child(_docConfig).onValue.listen((event) async {
        if (event.snapshot.exists && event.snapshot.value != null) {
          try {
            final dynamic val = event.snapshot.value;
            final Map<String, dynamic> map = Map<String, dynamic>.from(val as Map);
            _config = ProfileConfigModel.fromJson(map);
            AppColors.applyFromConfig(_config);
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString(_keyProfileConfig, jsonEncode(_config.toJson()));
            _isRealtimeConnected = true;
            notifyListeners();
          } catch (e) {
            debugPrint('Error parsing RTDB config: $e');
          }
        }
      }, onError: (err) => debugPrint('RTDB config stream error: $err'));

      // Listen to Services node
      rtdbRef.child(_docServices).onValue.listen((event) async {
        if (event.snapshot.exists && event.snapshot.value != null) {
          try {
            final dynamic val = event.snapshot.value;
            if (val is Map && val.containsKey('list')) {
              final List<dynamic> list = val['list'];
              final loaded = list.map((e) => ServiceModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
              _services = _mergeServicesWithDefaults(loaded);
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString(_keyServices, jsonEncode(_services.map((s) => s.toJson()).toList()));
              notifyListeners();
            }
          } catch (e) {
            debugPrint('Error parsing RTDB services: $e');
          }
        }
      }, onError: (err) => debugPrint('RTDB services stream error: $err'));

      // Listen to Projects node
      rtdbRef.child(_docProjects).onValue.listen((event) async {
        if (event.snapshot.exists && event.snapshot.value != null) {
          try {
            final dynamic val = event.snapshot.value;
            if (val is Map && val.containsKey('list')) {
              final List<dynamic> list = val['list'];
              final loaded = list.map((e) => ProjectModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
              _projects = _mergeProjectsWithDefaults(loaded);
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString(_keyProjects, jsonEncode(_projects.map((p) => p.toJson()).toList()));
              notifyListeners();
            }
          } catch (e) {
            debugPrint('Error parsing RTDB projects: $e');
          }
        }
      }, onError: (err) => debugPrint('RTDB projects stream error: $err'));

      // Listen to Why Work node
      rtdbRef.child(_docWhyWork).onValue.listen((event) async {
        if (event.snapshot.exists && event.snapshot.value != null) {
          try {
            final dynamic val = event.snapshot.value;
            if (val is Map && val.containsKey('list')) {
              final List<dynamic> list = val['list'];
              _whyWorkList = list.map((e) => WhyWorkModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString(_keyWhyWork, jsonEncode(_whyWorkList.map((w) => w.toJson()).toList()));
              notifyListeners();
            }
          } catch (e) {
            debugPrint('Error parsing RTDB whyWork: $e');
          }
        }
      }, onError: (err) => debugPrint('RTDB whyWork stream error: $err'));
    } catch (e) {
      debugPrint('Realtime Database stream setup error: $e');
    }
  }

  void _listenToCloudFirestore() {
    try {
      final collection = FirebaseFirestore.instance.collection(_collectionName);

      // Listen to Config doc
      collection.doc(_docConfig).snapshots().listen((snapshot) async {
        if (snapshot.exists && snapshot.data() != null) {
          try {
            final data = snapshot.data()!;
            _config = ProfileConfigModel.fromJson(data);
            AppColors.applyFromConfig(_config);
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString(_keyProfileConfig, jsonEncode(_config.toJson()));
            notifyListeners();
          } catch (e) {
            debugPrint('Error parsing cloud config: $e');
          }
        }
      }, onError: (err) => debugPrint('Cloud config stream error: $err'));

      // Listen to Services doc
      collection.doc(_docServices).snapshots().listen((snapshot) async {
        if (snapshot.exists && snapshot.data() != null) {
          try {
            final data = snapshot.data()!;
            if (data.containsKey('list') && data['list'] is List) {
              final List<dynamic> list = data['list'];
              final loaded = list.map((e) => ServiceModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
              _services = _mergeServicesWithDefaults(loaded);
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString(_keyServices, jsonEncode(_services.map((s) => s.toJson()).toList()));
              notifyListeners();
            }
          } catch (e) {
            debugPrint('Error parsing cloud services: $e');
          }
        }
      }, onError: (err) => debugPrint('Cloud services stream error: $err'));

      // Listen to Projects doc
      collection.doc(_docProjects).snapshots().listen((snapshot) async {
        if (snapshot.exists && snapshot.data() != null) {
          try {
            final data = snapshot.data()!;
            if (data.containsKey('list') && data['list'] is List) {
              final List<dynamic> list = data['list'];
              final loaded = list.map((e) => ProjectModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
              _projects = _mergeProjectsWithDefaults(loaded);
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString(_keyProjects, jsonEncode(_projects.map((p) => p.toJson()).toList()));
              notifyListeners();
            }
          } catch (e) {
            debugPrint('Error parsing cloud projects: $e');
          }
        }
      }, onError: (err) => debugPrint('Cloud projects stream error: $err'));

      // Listen to Why Work doc
      collection.doc(_docWhyWork).snapshots().listen((snapshot) async {
        if (snapshot.exists && snapshot.data() != null) {
          try {
            final data = snapshot.data()!;
            if (data.containsKey('list') && data['list'] is List) {
              final List<dynamic> list = data['list'];
              _whyWorkList = list.map((e) => WhyWorkModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString(_keyWhyWork, jsonEncode(_whyWorkList.map((w) => w.toJson()).toList()));
              notifyListeners();
            }
          } catch (e) {
            debugPrint('Error parsing cloud whyWork: $e');
          }
        }
      }, onError: (err) => debugPrint('Cloud whyWork stream error: $err'));
    } catch (e) {
      debugPrint('Firestore initialization failed: $e');
    }
  }

  // --- Profile & Site Config Updates ---
  Future<void> updateConfig(ProfileConfigModel newConfig) async {
    _config = newConfig;
    AppColors.applyFromConfig(_config);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyProfileConfig, jsonEncode(_config.toJson()));
    notifyListeners();
    await Future.wait([
      _syncConfigToFirestore(),
      _syncConfigToRealtime(),
    ]);
  }

  Future<void> _syncConfigToFirestore() async {
    try {
      _isSyncingWithCloud = true;
      await FirebaseFirestore.instance
          .collection(_collectionName)
          .doc(_docConfig)
          .set(_config.toJson(), SetOptions(merge: true));
    } catch (e) {
      debugPrint('Firestore sync config error: $e');
    } finally {
      _isSyncingWithCloud = false;
    }
  }

  Future<void> _syncConfigToRealtime() async {
    try {
      await FirebaseDatabase.instance
          .ref(_collectionName)
          .child(_docConfig)
          .set(_config.toJson());
    } catch (e) {
      debugPrint('RTDB sync config error: $e');
    }
  }

  // --- Services Full CRUD ---
  Future<void> addService(ServiceModel service) async {
    _services.add(service);
    await _saveServices();
    notifyListeners();
    await Future.wait([
      _syncServicesToFirestore(),
      _syncServicesToRealtime(),
    ]);
  }

  Future<void> updateService(ServiceModel service) async {
    final index = _services.indexWhere((s) => s.id == service.id);
    if (index != -1) {
      _services[index] = service;
      await _saveServices();
      notifyListeners();
      await Future.wait([
        _syncServicesToFirestore(),
        _syncServicesToRealtime(),
      ]);
    }
  }

  Future<void> deleteService(String id) async {
    _services.removeWhere((s) => s.id == id);
    await _saveServices();
    notifyListeners();
    await Future.wait([
      _syncServicesToFirestore(),
      _syncServicesToRealtime(),
    ]);
  }

  Future<void> reorderServices(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = _services.removeAt(oldIndex);
    _services.insert(newIndex, item);
    await _saveServices();
    notifyListeners();
    await Future.wait([
      _syncServicesToFirestore(),
      _syncServicesToRealtime(),
    ]);
  }

  Future<void> _saveServices() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode(_services.map((s) => s.toJson()).toList());
    await prefs.setString(_keyServices, jsonStr);
  }

  Future<void> _syncServicesToFirestore() async {
    try {
      _isSyncingWithCloud = true;
      await FirebaseFirestore.instance
          .collection(_collectionName)
          .doc(_docServices)
          .set({'list': _services.map((s) => s.toJson()).toList()}, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Firestore sync services error: $e');
    } finally {
      _isSyncingWithCloud = false;
    }
  }

  Future<void> _syncServicesToRealtime() async {
    try {
      await FirebaseDatabase.instance
          .ref(_collectionName)
          .child(_docServices)
          .set({'list': _services.map((s) => s.toJson()).toList()});
    } catch (e) {
      debugPrint('RTDB sync services error: $e');
    }
  }

  // --- Projects Full CRUD ---
  Future<void> addProject(ProjectModel project) async {
    _projects.insert(0, project);
    await _saveProjects();
    notifyListeners();
    await Future.wait([
      _syncProjectsToFirestore(),
      _syncProjectsToRealtime(),
    ]);
  }

  Future<void> updateProject(ProjectModel project) async {
    final index = _projects.indexWhere((p) => p.id == project.id);
    if (index != -1) {
      _projects[index] = project;
      await _saveProjects();
      notifyListeners();
      await Future.wait([
        _syncProjectsToFirestore(),
        _syncProjectsToRealtime(),
      ]);
    }
  }

  Future<void> deleteProject(String id) async {
    _projects.removeWhere((p) => p.id == id);
    await _saveProjects();
    notifyListeners();
    await Future.wait([
      _syncProjectsToFirestore(),
      _syncProjectsToRealtime(),
    ]);
  }

  Future<void> reorderProjects(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = _projects.removeAt(oldIndex);
    _projects.insert(newIndex, item);
    await _saveProjects();
    notifyListeners();
    await Future.wait([
      _syncProjectsToFirestore(),
      _syncProjectsToRealtime(),
    ]);
  }

  Future<void> _saveProjects() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode(_projects.map((p) => p.toJson()).toList());
    await prefs.setString(_keyProjects, jsonStr);
  }

  Future<void> _syncProjectsToFirestore() async {
    try {
      _isSyncingWithCloud = true;
      await FirebaseFirestore.instance
          .collection(_collectionName)
          .doc(_docProjects)
          .set({'list': _projects.map((p) => p.toJson()).toList()}, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Firestore sync projects error: $e');
    } finally {
      _isSyncingWithCloud = false;
    }
  }

  Future<void> _syncProjectsToRealtime() async {
    try {
      await FirebaseDatabase.instance
          .ref(_collectionName)
          .child(_docProjects)
          .set({'list': _projects.map((p) => p.toJson()).toList()});
    } catch (e) {
      debugPrint('RTDB sync projects error: $e');
    }
  }

  // --- Why Work With Me Pillars Full CRUD ---
  Future<void> addWhyWorkItem(WhyWorkModel item) async {
    _whyWorkList.add(item);
    await _saveWhyWork();
    notifyListeners();
    await Future.wait([
      _syncWhyWorkToFirestore(),
      _syncWhyWorkToRealtime(),
    ]);
  }

  Future<void> updateWhyWorkItem(WhyWorkModel item) async {
    final index = _whyWorkList.indexWhere((w) => w.id == item.id);
    if (index != -1) {
      _whyWorkList[index] = item;
      await _saveWhyWork();
      notifyListeners();
      await Future.wait([
        _syncWhyWorkToFirestore(),
        _syncWhyWorkToRealtime(),
      ]);
    }
  }

  Future<void> deleteWhyWorkItem(String id) async {
    _whyWorkList.removeWhere((w) => w.id == id);
    await _saveWhyWork();
    notifyListeners();
    await Future.wait([
      _syncWhyWorkToFirestore(),
      _syncWhyWorkToRealtime(),
    ]);
  }

  Future<void> _saveWhyWork() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = jsonEncode(_whyWorkList.map((w) => w.toJson()).toList());
    await prefs.setString(_keyWhyWork, jsonStr);
  }

  Future<void> _syncWhyWorkToFirestore() async {
    try {
      _isSyncingWithCloud = true;
      await FirebaseFirestore.instance
          .collection(_collectionName)
          .doc(_docWhyWork)
          .set({'list': _whyWorkList.map((w) => w.toJson()).toList()}, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Firestore sync whyWork error: $e');
    } finally {
      _isSyncingWithCloud = false;
    }
  }

  Future<void> _syncWhyWorkToRealtime() async {
    try {
      await FirebaseDatabase.instance
          .ref(_collectionName)
          .child(_docWhyWork)
          .set({'list': _whyWorkList.map((w) => w.toJson()).toList()});
    } catch (e) {
      debugPrint('RTDB sync whyWork error: $e');
    }
  }

  // --- Backup Export & Import ---
  String exportAllDataAsJson() {
    final Map<String, dynamic> fullBackup = {
      'version': '2.0',
      'timestamp': DateTime.now().toIso8601String(),
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

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyProfileConfig, jsonEncode(_config.toJson()));
      await prefs.setString(_keyServices, jsonEncode(_services.map((s) => s.toJson()).toList()));
      await prefs.setString(_keyProjects, jsonEncode(_projects.map((p) => p.toJson()).toList()));
      await prefs.setString(_keyWhyWork, jsonEncode(_whyWorkList.map((w) => w.toJson()).toList()));

      AppColors.applyFromConfig(_config);
      notifyListeners();

      // Sync all imported data to Firestore and Realtime Database
      await Future.wait([
        _syncConfigToFirestore(),
        _syncConfigToRealtime(),
        _syncServicesToFirestore(),
        _syncServicesToRealtime(),
        _syncProjectsToFirestore(),
        _syncProjectsToRealtime(),
        _syncWhyWorkToFirestore(),
        _syncWhyWorkToRealtime(),
      ]);

      return true;
    } catch (e) {
      debugPrint('Error importing JSON: $e');
      return false;
    }
  }

  // --- Factory Reset ---
  Future<void> resetToDefaults() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyProfileConfig);
    await prefs.remove(_keyServices);
    await prefs.remove(_keyProjects);
    await prefs.remove(_keyWhyWork);

    _config = PortfolioData.defaultConfig;
    _services = List.from(PortfolioData.defaultServices);
    _projects = List.from(PortfolioData.defaultProjects);
    _whyWorkList = List.from(PortfolioData.defaultWhyWorkList);

    AppColors.applyFromConfig(_config);
    notifyListeners();

    await Future.wait([
      _syncConfigToFirestore(),
      _syncConfigToRealtime(),
      _syncServicesToFirestore(),
      _syncServicesToRealtime(),
      _syncProjectsToFirestore(),
      _syncProjectsToRealtime(),
      _syncWhyWorkToFirestore(),
      _syncWhyWorkToRealtime(),
    ]);
  }
}
