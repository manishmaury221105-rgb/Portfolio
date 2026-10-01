import 'package:flutter/material.dart';
import '../models/profile_config_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/app_localization.dart';
import 'app_smart_image.dart';

class HeroSection extends StatelessWidget {
  final bool isDark;
  final ProfileConfigModel config;
  final AppLanguage language;
  final Function(String key)? onNavigate;

  const HeroSection({
    super.key,
    required this.isDark,
    required this.config,
    required this.language,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 900;
    final loc = AppLocalization(language);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: isDark
            ? const LinearGradient(
                colors: [Color(0xFF0B0F19), Color(0xFF131A2E), Color(0xFF0B0F19)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : const LinearGradient(
                colors: [Color(0xFFEEF2FF), Color(0xFFF8FAFC), Color(0xFFFFFFFF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 64 : 36,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: _buildHeroContent(context, isDesktop, loc)),
                    const SizedBox(width: 40),
                    Expanded(flex: 5, child: _buildHeroProfileCard(context, isDesktop)),
                  ],
                )
              : Column(
                  children: [
                    _buildHeroProfileCard(context, isDesktop),
                    const SizedBox(height: 28),
                    _buildHeroContent(context, isDesktop, loc),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildHeroContent(BuildContext context, bool isDesktop, AppLocalization loc) {
    final displayTagline = loc.getHeroTagline(config.tagline);
    final displaySubtitle = loc.getHeroSubtitle(config.heroSubtitle);

    return Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        // Name
        Text(
          config.name,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: AppTypography.displayLarge(context, isDark: isDark),
        ),
        const SizedBox(height: 8),

        // Headline / Tagline
        ShaderMask(
          shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
          child: Text(
            displayTagline,
            textAlign: isDesktop ? TextAlign.start : TextAlign.center,
            style: AppTypography.displayMedium(context, isDark: isDark).copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Intro / Subtitle
        Text(
          displaySubtitle,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: AppTypography.bodyLarge(context, isDark: isDark).copyWith(
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildHeroProfileCard(BuildContext context, bool isDesktop) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Glowing background aura
          Container(
            width: isDesktop ? 340 : 260,
            height: isDesktop ? 340 : 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.35),
                  AppColors.primary.withValues(alpha: 0.0),
                ],
              ),
            ),
          ),

          // Main Avatar Card (Full Circular Photo)
          Container(
            width: isDesktop ? 280 : 220,
            height: isDesktop ? 280 : 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            padding: const EdgeInsets.all(5),
            child: ClipOval(
              child: config.avatarUrl.isNotEmpty
                  ? AppSmartImage(
                      imageUrl: config.avatarUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorWidget: Container(
                        color: isDark ? AppColors.darkSurface : Colors.white,
                        child: Icon(
                          Icons.person_outline_rounded,
                          size: 80,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  : Container(
                      color: isDark ? AppColors.darkSurface : Colors.white,
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 80,
                        color: AppColors.primary,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
