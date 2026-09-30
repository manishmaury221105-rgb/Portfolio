import 'package:flutter/material.dart';
import '../models/profile_config_model.dart';
import '../theme/app_colors.dart';
import '../utils/app_localization.dart';
import '../utils/url_helper.dart';
import 'brand_logo_badge.dart';
import 'whatsapp_icon.dart';

class FooterSection extends StatelessWidget {
  final bool isDark;
  final ProfileConfigModel config;
  final AppLanguage language;
  final Function(String key) onNavigate;
  final VoidCallback? onOpenAdmin;

  const FooterSection({
    super.key,
    required this.isDark,
    required this.config,
    this.language = AppLanguage.hinglish,
    required this.onNavigate,
    this.onOpenAdmin,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;
    final loc = AppLocalization(language);

    return Container(
      color: isDark ? const Color(0xFF070A10) : const Color(0xFF0F172A),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Top Columns
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 4, child: _buildBrandColumn(context)),
                        const SizedBox(width: 36),
                        Expanded(flex: 2, child: _buildQuickLinksColumn(loc.footerQuickLinks, ['home', 'about'], loc)),
                        const SizedBox(width: 24),
                        Expanded(flex: 2, child: _buildQuickLinksColumn(loc.navServices, ['services', 'projects'], loc)),
                        const SizedBox(width: 24),
                        Expanded(flex: 4, child: _buildContactColumn(context, loc)),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandColumn(context),
                        const SizedBox(height: 28),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: _buildQuickLinksColumn(loc.footerQuickLinks, ['home', 'about'], loc),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              flex: 3,
                              child: _buildQuickLinksColumn(loc.navServices, ['services', 'projects'], loc),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              flex: 4,
                              child: _buildContactColumn(context, loc),
                            ),
                          ],
                        ),
                      ],
                    ),

              const Divider(color: Color(0xFF1E293B), height: 48),

              // Bottom Copyright & Credits
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                runSpacing: 12,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 12,
                    runSpacing: 6,
                    children: [
                      Text(
                        '© ${DateTime.now().year} ${config.name}. ${config.copyrightText.isNotEmpty ? config.copyrightText : loc.footerCopyright}',
                        style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                      ),
                      if (onOpenAdmin != null)
                        InkWell(
                          onTap: onOpenAdmin,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.06),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.primaryLight.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.lock_outline_rounded, size: 14, color: AppColors.primaryLight),
                                const SizedBox(width: 6),
                                Text(
                                  loc.footerAdminPanel,
                                  style: TextStyle(
                                    color: AppColors.primaryLight,
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _buildFooterSocialButton(
                        customChild: const WhatsAppIcon(size: 24, color: AppColors.whatsappGreen),
                        color: AppColors.whatsappGreen,
                        tooltip: 'WhatsApp',
                        size: 24,
                        onPressed: () => UrlHelper.openWhatsApp(
                          phone: config.whatsappNumber,
                          message: config.whatsappDefaultMessage,
                          context: context,
                        ),
                      ),
                      _buildFooterSocialButton(
                        icon: Icons.phone_rounded,
                        color: AppColors.callBlue,
                        tooltip: 'Call',
                        size: 24,
                        onPressed: () => UrlHelper.makePhoneCall(phone: config.phone, context: context),
                      ),
                      if (config.youtubeUrl.isNotEmpty)
                        _buildFooterSocialButton(
                          icon: Icons.play_circle_fill_rounded,
                          color: const Color(0xFFFF0000),
                          tooltip: 'YouTube',
                          size: 26,
                          onPressed: () => UrlHelper.openLink(config.youtubeUrl, context: context),
                        ),
                      if (config.instagramUrl.isNotEmpty)
                        _buildFooterSocialButton(
                          icon: Icons.camera_alt_rounded,
                          color: const Color(0xFFE4405F),
                          tooltip: 'Instagram',
                          size: 24,
                          onPressed: () => UrlHelper.openLink(config.instagramUrl, context: context),
                        ),
                      if (config.facebookUrl.isNotEmpty)
                        _buildFooterSocialButton(
                          icon: Icons.facebook_rounded,
                          color: const Color(0xFF1877F2),
                          tooltip: 'Facebook',
                          size: 24,
                          onPressed: () => UrlHelper.openLink(config.facebookUrl, context: context),
                        ),
                      if (config.linkedinUrl.isNotEmpty)
                        _buildFooterSocialButton(
                          icon: Icons.business_rounded,
                          color: const Color(0xFF0A66C2),
                          tooltip: 'LinkedIn',
                          size: 24,
                          onPressed: () => UrlHelper.openLink(config.linkedinUrl, context: context),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BrandLogoBadge(config: config, size: 40, borderRadius: 20),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  config.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  config.locationShort,
                  style: TextStyle(
                    color: AppColors.primaryLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          config.footerAbout.isNotEmpty
              ? config.footerAbout
              : 'Helping modern brands, local businesses, and startups dominate with high-converting marketing campaigns, responsive websites, and custom Flutter mobile apps.',
          style: const TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 13,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinksColumn(String title, List<String> pageKeys, AppLocalization loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 14),
        ...pageKeys.map((key) {
          String label;
          switch (key) {
            case 'home':
              label = loc.navHome;
              break;
            case 'about':
              label = loc.navAbout;
              break;
            case 'services':
              label = loc.navServices;
              break;
            case 'projects':
              label = loc.navProjects;
              break;
            case 'contact':
              label = loc.navContact;
              break;
            default:
              label = key;
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              onTap: () => onNavigate(key),
              borderRadius: BorderRadius.circular(4),
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 13.5,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildContactColumn(BuildContext context, AppLocalization loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.footerContactInfo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 14),
        InkWell(
          onTap: () => UrlHelper.makePhoneCall(phone: config.phone, context: context),
          child: Row(
            children: [
              const Icon(Icons.phone_rounded, size: 16, color: AppColors.callBlue),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  config.phone,
                  style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => UrlHelper.sendEmail(email: config.email, context: context),
          child: Row(
            children: [
              const Icon(Icons.mail_rounded, size: 16, color: AppColors.mailRed),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  config.email,
                  style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.location_on_rounded, size: 16, color: AppColors.accent),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                config.location,
                style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterSocialButton({
    IconData? icon,
    Widget? customChild,
    required Color color,
    required String tooltip,
    required double size,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: IconButton(
        onPressed: onPressed,
        tooltip: tooltip,
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
        icon: customChild ?? Icon(icon, color: color, size: size),
      ),
    );
  }
}
