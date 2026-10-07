import 'package:flutter/material.dart';
import '../models/profile_config_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/app_localization.dart';
import '../utils/url_helper.dart';
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
        const SizedBox(height: 28),

        // CTA Buttons Row
        Wrap(
          spacing: 16,
          runSpacing: 14,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => onNavigate?.call('services'),
              icon: const Icon(Icons.rocket_launch_rounded, size: 18, color: Colors.white),
              label: const Text(
                'Explore All Services',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                shadowColor: AppColors.primary.withValues(alpha: 0.4),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                UrlHelper.openWhatsApp(
                  phone: UrlHelper.phoneNumber,
                  message: 'Hello Manish! I visited your portfolio and would like to discuss a project for my business.',
                  context: context,
                );
              },
              icon: const Icon(Icons.chat_bubble_rounded, size: 18, color: Color(0xFF25D366)),
              label: Text(
                'Chat on WhatsApp',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.5,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                side: BorderSide(
                  color: const Color(0xFF25D366).withValues(alpha: 0.7),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Trust Badges Pill Row
        Wrap(
          spacing: 12,
          runSpacing: 10,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            _buildTrustBadge('⭐️ 5.0 Star Client Rating', AppColors.accent),
            _buildTrustBadge('📍 Varanasi & Pan-India', AppColors.success),
            _buildTrustBadge('🚀 100% ROI Focused', AppColors.primary),
          ],
        ),
      ],
    );
  }

  Widget _buildTrustBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildHeroProfileCard(BuildContext context, bool isDesktop) {
    final avatarPath = config.avatarUrl.isNotEmpty
        ? config.avatarUrl
        : 'assets/images/digital_manish_logo_circle.png';

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
              child: AppSmartImage(
                imageUrl: avatarPath,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
