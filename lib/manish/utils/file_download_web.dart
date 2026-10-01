// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/foundation.dart';

class FileDownloadHelper {
  /// Trigger instant browser download of a file (e.g. JSON backup)
  static void downloadJsonFile(String filename, String content) {
    try {
      final bytes = utf8.encode(content);
      final blob = html.Blob([bytes], 'application/json;charset=utf-8');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', filename)
        ..style.display = 'none';

      html.document.body?.children.add(anchor);
      anchor.click();
      anchor.remove();
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      debugPrint('Error triggering browser file download: $e');
    }
  }

  /// Open file picker to choose and read a .json file from local computer/device
  static Future<String?> pickAndReadJsonFile() async {
    final completer = Completer<String?>();
    final uploadInput = html.FileUploadInputElement()..accept = '.json,application/json';
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final file = files[0];
        final reader = html.FileReader();
        reader.onLoadEnd.listen((e) {
          final result = reader.result as String?;
          completer.complete(result);
        });
        reader.onError.listen((e) {
          completer.complete(null);
        });
        reader.readAsText(file);
      } else {
        completer.complete(null);
      }
    });

    return completer.future;
  }
}
