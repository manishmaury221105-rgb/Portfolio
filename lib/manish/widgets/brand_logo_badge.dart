import 'package:flutter/material.dart';
import '../models/profile_config_model.dart';
import '../theme/app_colors.dart';
import 'app_smart_image.dart';

class BrandLogoBadge extends StatelessWidget {
  final ProfileConfigModel config;
  final double size;
  final double borderRadius;
  final double? fontSize;
  final bool hasShadow;

  const BrandLogoBadge({
    super.key,
    required this.config,
    this.size = 38,
    this.borderRadius = 10,
    this.fontSize,
    this.hasShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final customUrl = config.logoImageUrl.trim();
    final effectiveImageUrl = customUrl.isNotEmpty
        ? customUrl
        : 'assets/images/digital_manish_logo.png';

    final text = config.logoText.trim().isNotEmpty ? config.logoText.trim() : 'DM';
    final effectiveFontSize = fontSize ?? (text.length <= 2 ? (size * 0.44) : (size * 0.32));

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: AppSmartImage(
        imageUrl: effectiveImageUrl,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorWidget: _buildFallback(text, effectiveFontSize),
      ),
    );
  }

  Widget _buildFallback(String text, double effectiveFontSize) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: effectiveFontSize,
                letterSpacing: text.length <= 2 ? 1.0 : 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
