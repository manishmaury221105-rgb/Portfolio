// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:async';
import 'dart:html' as html;

Future<String?> pickImageAsBase64() async {
  final completer = Completer<String?>();
  final uploadInput = html.FileUploadInputElement()..accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((e) {
    final files = uploadInput.files;
    if (files != null && files.isNotEmpty) {
      final file = files[0];
      final reader = html.FileReader();
      reader.onLoadEnd.listen((e) {
        final rawDataUrl = reader.result as String?;
        if (rawDataUrl == null || rawDataUrl.isEmpty) {
          completer.complete(null);
          return;
        }

        // Downscale and compress image via HTML Canvas so base64 stays < 50KB
        final img = html.ImageElement();
        img.onLoad.listen((_) {
          try {
            int width = img.naturalWidth;
            int height = img.naturalHeight;
            const maxDimension = 600;

            if (width > maxDimension || height > maxDimension) {
              if (width > height) {
                height = (height * maxDimension / width).round();
                width = maxDimension;
              } else {
                width = (width * maxDimension / height).round();
                height = maxDimension;
              }
            }

            final canvas = html.CanvasElement(width: width, height: height);
            final ctx = canvas.context2D;
            ctx.drawImageScaled(img, 0, 0, width, height);
            final compressedDataUrl = canvas.toDataUrl('image/jpeg', 0.82);
            completer.complete(compressedDataUrl);
          } catch (_) {
            completer.complete(rawDataUrl);
          }
        });
        img.onError.listen((_) {
          completer.complete(rawDataUrl);
        });
        img.src = rawDataUrl;
      });
      reader.onError.listen((e) {
        completer.complete(null);
      });
      reader.readAsDataUrl(file);
    } else {
      completer.complete(null);
    }
  });

  return completer.future;
}

