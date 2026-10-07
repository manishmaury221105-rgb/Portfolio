import 'dart:convert';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppSmartImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  const AppSmartImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });

  int? _calcCacheWidth() {
    if (width != null && width!.isFinite && width! > 0) {
      return (width! * 1.5).clamp(80, 800).toInt();
    }
    return 600;
  }

  int? _calcCacheHeight() {
    if (height != null && height!.isFinite && height! > 0) {
      return (height! * 1.5).clamp(80, 800).toInt();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final cleanUrl = imageUrl.trim();
    final cacheW = _calcCacheWidth();
    final cacheH = _calcCacheHeight();

    Widget content;

    if (cleanUrl.isEmpty) {
      content = placeholder ?? _defaultPlaceholder();
    } else if (cleanUrl.startsWith('data:image') || cleanUrl.startsWith('data:application')) {
      try {
        final commaIdx = cleanUrl.indexOf(',');
        final base64Data = commaIdx != -1 ? cleanUrl.substring(commaIdx + 1).trim() : cleanUrl;
        final bytes = base64Decode(base64Data);
        content = Image.memory(
          bytes,
          width: width,
          height: height,
          fit: fit,
          cacheWidth: cacheW,
          cacheHeight: cacheH,
          gaplessPlayback: true,
          filterQuality: FilterQuality.low,
          errorBuilder: (context, error, stackTrace) => errorWidget ?? _defaultError(),
        );
      } catch (e) {
        content = errorWidget ?? _defaultError();
      }
    } else if (cleanUrl.startsWith('http://') || cleanUrl.startsWith('https://') || cleanUrl.startsWith('blob:')) {
      content = Image.network(
        cleanUrl,
        width: width,
        height: height,
        fit: fit,
        cacheWidth: cacheW,
        cacheHeight: cacheH,
        gaplessPlayback: true,
        filterQuality: FilterQuality.low,
        errorBuilder: (context, error, stackTrace) => errorWidget ?? _defaultError(),
      );
    } else if (cleanUrl.startsWith('assets/')) {
      content = Image.asset(
        cleanUrl,
        width: width,
        height: height,
        fit: fit,
        cacheWidth: cacheW,
        cacheHeight: cacheH,
        gaplessPlayback: true,
        filterQuality: FilterQuality.low,
        errorBuilder: (context, error, stackTrace) => errorWidget ?? _defaultError(),
      );
    } else {
      // Attempt raw base64 decode if string length > 50 and has no URI scheme
      try {
        final bytes = base64Decode(cleanUrl);
        content = Image.memory(
          bytes,
          width: width,
          height: height,
          fit: fit,
          cacheWidth: cacheW,
          cacheHeight: cacheH,
          gaplessPlayback: true,
          filterQuality: FilterQuality.low,
          errorBuilder: (context, error, stackTrace) => errorWidget ?? _defaultError(),
        );
      } catch (e) {
        content = Image.network(
          cleanUrl,
          width: width,
          height: height,
          fit: fit,
          cacheWidth: cacheW,
          cacheHeight: cacheH,
          gaplessPlayback: true,
          filterQuality: FilterQuality.low,
          errorBuilder: (context, error, stackTrace) => errorWidget ?? _defaultError(),
        );
      }
    }

    if (borderRadius != null) {
      content = ClipRRect(
        borderRadius: borderRadius!,
        child: content,
      );
    }

    return RepaintBoundary(child: content);
  }

  Widget _defaultPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: AppColors.primary.withValues(alpha: 0.12),
      child: Center(
        child: Icon(Icons.image_outlined, color: AppColors.primary, size: 28),
      ),
    );
  }

  Widget _defaultError() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.withValues(alpha: 0.15),
      child: const Center(
        child: Icon(Icons.broken_image_rounded, color: Colors.grey, size: 28),
      ),
    );
  }
}
