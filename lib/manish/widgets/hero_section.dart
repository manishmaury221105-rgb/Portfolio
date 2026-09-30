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
        // Availability & Location Badge
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on_rounded, color: AppColors.primary, size: 15),
                  const SizedBox(width: 5),
                  Text(
                    config.locationShort.isNotEmpty ? config.locationShort : 'Varanasi & Pan India',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.success.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    loc.heroAvailableBadge,
                    style: const TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),

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

        // CTA Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => UrlHelper.openWhatsApp(
                phone: config.whatsappNumber,
                message: config.whatsappDefaultMessage,
                context: context,
              ),
              icon: const Icon(Icons.chat_bubble_rounded, size: 18, color: Colors.white),
              label: Text(
                loc.heroCtaWhatsApp,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF25D366),
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                elevation: 4,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => onNavigate?.call('services'),
              icon: const Icon(Icons.miscellaneous_services_rounded, size: 18),
              label: Text(
                loc.heroCtaServices,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: isDark ? Colors.white : AppColors.lightTextPrimary,
                side: BorderSide(
                  color: isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
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
