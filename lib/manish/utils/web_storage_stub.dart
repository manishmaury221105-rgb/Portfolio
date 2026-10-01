// Stub for non-web platforms
class WebStorageHelper {
  static Future<void> requestPersistentStorage() async {}
  static void saveRaw(String key, String value) {}
  static String? readRaw(String key) => null;
  static void removeRaw(String key) {}
}
