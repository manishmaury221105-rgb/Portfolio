// Stub for non-web platforms
class FileDownloadHelper {
  static void downloadJsonFile(String filename, String content) {}
  static Future<String?> pickAndReadJsonFile() async => null;
}
