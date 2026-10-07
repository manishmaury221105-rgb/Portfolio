import 'package:flutter/material.dart';
import '../models/profile_config_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/app_localization.dart';
import 'app_smart_image.dart';

class AboutSection extends StatelessWidget {
  final bool isDark;
  final ProfileConfigModel config;
  final AppLanguage language;

  const AboutSection({
    super.key,
    required this.isDark,
    required this.config,
    this.language = AppLanguage.hinglish,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 860;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final loc = AppLocalization(language);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 64 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              // Section Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  loc.aboutBadge,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                loc.aboutHeading,
                textAlign: TextAlign.center,
                style: AppTypography.displayMedium(context, isDark: isDark),
              ),
              const SizedBox(height: 36),

              // Responsive Content Card
              Container(
                padding: EdgeInsets.all(isDesktop ? 36 : 20),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkCard : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bio Row
                    isDesktop
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildProfileBadge(context),
                              const SizedBox(width: 32),
                              Expanded(child: _buildBioDetails(context, textPrimary, loc)),
                            ],
                          )
                        : Column(
                            children: [
                              _buildProfileBadge(context),
                              const SizedBox(height: 24),
                              _buildBioDetails(context, textPrimary, loc),
                            ],
                          ),

                    const Divider(height: 48),

                    // Core Pillars Cards
                    Text(
                      loc.aboutMissionTitle,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      loc.getAboutMission(config.aboutMission),
                      style: AppTypography.bodyLarge(context, isDark: isDark).copyWith(
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Technical Skills Grid
                    Text(
                      loc.skillsHeading,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSkillsGrid(isDesktop),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileBadge(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.35),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(4),
          child: ClipOval(
            child: AppSmartImage(
              imageUrl: config.avatarUrl.isNotEmpty
                  ? config.avatarUrl
                  : 'assets/images/digital_manish_logo_circle.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          config.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          config.locationShort,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.primaryLight,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildBioDetails(BuildContext context, Color textPrimary, AppLocalization loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.getAboutBio(config.aboutBio, config.heroSubtitle),
          style: AppTypography.bodyLarge(context, isDark: isDark).copyWith(
            height: 1.65,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildStatChip(
              icon: Icons.workspace_premium_rounded,
              label: loc.statExperienceLabel,
              value: '3+ Years',
              color: const Color(0xFF6366F1),
            ),
            _buildStatChip(
              icon: Icons.rocket_launch_rounded,
              label: loc.statProjectsLabel,
              value: '50+ Done',
              color: const Color(0xFF10B981),
            ),
            _buildStatChip(
              icon: Icons.sentiment_satisfied_alt_rounded,
              label: loc.statClientsLabel,
              value: '98% Happy',
              color: const Color(0xFFF59E0B),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatChip({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: color,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid(bool isDesktop) {
    final skills = [
      {'title': 'GMB Setup & Local SEO', 'techs': 'Google Business Profile, Google 3-Pack Maps, Citations, 5-Star Reviews'},
      {'title': 'Meta & Social Ads', 'techs': 'Facebook Ads, Instagram Sponsored Reels, Meta Pixel, Retargeting Funnels'},
      {'title': 'Google Ads & PPC', 'techs': 'Google Search PPC, YouTube Video Ads, Display Network, Direct Call Ads'},
      {'title': 'Email Marketing & CRM', 'techs': 'Drip Sequences, Automated Lead Nurturing, High Deliverability, Newsletters'},
      {'title': 'Performance Chart Ads', 'techs': 'Google Analytics 4, ROI Dashboards, Conversion Funnels, A/B Split Testing'},
      {'title': 'Web & App Development', 'techs': 'Flutter Web & Mobile, Next.js, React, Responsive UI/UX, Cloud Architecture'},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: skills.map((s) {
        return Container(
          width: isDesktop ? 300 : double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B).withValues(alpha: 0.6) : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark ? AppColors.darkCardBorder : const Color(0xFFE2E8F0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s['title']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                s['techs']!,
                style: TextStyle(
                  fontSize: 12.5,
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
