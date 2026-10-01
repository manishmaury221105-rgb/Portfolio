// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;
import 'package:flutter/foundation.dart';

class WebStorageHelper {
  /// Request browser permission for lifetime persistent storage (prevents automatic eviction by browser)
  static Future<void> requestPersistentStorage() async {
    try {
      final storage = html.window.navigator.storage;
      if (storage != null) {
        final isPersisted = await storage.persisted();
        if (isPersisted == false) {
          final granted = await storage.persist();
          debugPrint('Persistent browser storage requested: $granted');
        } else {
          debugPrint('Browser storage is already marked persistent.');
        }
      }
    } catch (e) {
      debugPrint('Persistent storage request skipped/unsupported: $e');
    }
  }

  /// Write directly to browser localStorage as redundant persistent layer
  static void saveRaw(String key, String value) {
    try {
      html.window.localStorage[key] = value;
    } catch (e) {
      debugPrint('Error writing to web localStorage [$key]: $e');
    }
  }

  /// Read directly from browser localStorage
  static String? readRaw(String key) {
    try {
      return html.window.localStorage[key];
    } catch (e) {
      debugPrint('Error reading from web localStorage [$key]: $e');
      return null;
    }
  }

  /// Remove item from browser localStorage
  static void removeRaw(String key) {
    try {
      html.window.localStorage.remove(key);
    } catch (e) {
      debugPrint('Error removing from web localStorage [$key]: $e');
    }
  }
}
