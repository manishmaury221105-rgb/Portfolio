import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/app_localization.dart';
import '../utils/url_helper.dart';
import 'app_smart_image.dart';
import 'service_detail_dialog.dart';

class ServicesSection extends StatelessWidget {
  final bool isDark;
  final List<ServiceModel> services;
  final AppLanguage language;

  const ServicesSection({
    super.key,
    required this.isDark,
    required this.services,
    this.language = AppLanguage.hinglish,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 950;
    final isTablet = width > 600 && width <= 950;
    final crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);
    final loc = AppLocalization(language);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 64 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  loc.servicesBadge,
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
                loc.servicesHeading,
                textAlign: TextAlign.center,
                style: AppTypography.displayMedium(context, isDark: isDark),
              ),
              const SizedBox(height: 8),
              Text(
                loc.servicesSubtitle,
                textAlign: TextAlign.center,
                style: AppTypography.bodyLarge(context, isDark: isDark),
              ),
              const SizedBox(height: 40),

              // Grid of Services
              services.isEmpty
                  ? Container(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          const Icon(Icons.miscellaneous_services_rounded, size: 48, color: Colors.grey),
                          const SizedBox(height: 12),
                          Text('No services added yet.', style: AppTypography.bodyLarge(context, isDark: isDark)),
                        ],
                      ),
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: 24,
                            crossAxisSpacing: 24,
                            mainAxisExtent: isDesktop ? 450 : (isTablet ? 440 : 420),
                          ),
                          itemCount: services.length,
                          itemBuilder: (context, i) {
                            final service = services[i];
                            return _ServiceCard(
                              service: service,
                              isDark: isDark,
                              language: language,
                              loc: loc,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => ServiceDetailDialog(
                                    service: service,
                                    isDark: isDark,
                                    language: language,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final ServiceModel service;
  final bool isDark;
  final AppLanguage language;
  final AppLocalization loc;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.service,
    required this.isDark,
    required this.language,
    required this.loc,
    required this.onTap,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textPrimary = widget.isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textSecondary = widget.isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final serviceTitle = widget.loc.getServiceTitle(widget.service);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: widget.isDark ? AppColors.darkCard : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered
                ? widget.service.accentColor
                : (widget.isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? widget.service.accentColor.withValues(alpha: 0.22)
                  : Colors.black.withValues(alpha: widget.isDark ? 0.2 : 0.04),
              blurRadius: _isHovered ? 24 : 16,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Header (if present) or Colored Header
              if (widget.service.imageUrl.isNotEmpty)
                SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AppSmartImage(
                        imageUrl: widget.service.imageUrl,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              (widget.isDark ? AppColors.darkCard : Colors.white).withValues(alpha: 0.85),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 14,
                        left: 14,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: widget.service.accentColor,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.35),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(widget.service.icon, color: Colors.white, size: 22),
                        ),
                      ),
                    ],
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: widget.service.accentColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(widget.service.icon, color: widget.service.accentColor, size: 28),
                  ),
                ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serviceTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.service.titleEnglish.isNotEmpty
                            ? widget.service.titleEnglish
                            : widget.service.titleHindi,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: widget.service.accentColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.loc.getServiceShortDesc(widget.service),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: textSecondary,
                          height: 1.45,
                        ),
                      ),
                      const Spacer(),

                      // Action Row
                      Row(
                        children: [
                          Text(
                            widget.loc.viewDetailsBtn,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: widget.service.accentColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_forward_rounded, size: 16, color: widget.service.accentColor),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              final msg = widget.language == AppLanguage.hindi
                                  ? 'नमस्ते मनीष जी! मुझे "$serviceTitle" सेवा के बारे में जानकारी चाहिए।'
                                  : (widget.language == AppLanguage.english
                                      ? 'Hello Manish! I would like to inquire about your "$serviceTitle" service.'
                                      : 'Namaste Manish ji! Mujhe "$serviceTitle" service ke bare me jankari chahiye.');
                              UrlHelper.openWhatsApp(
                                phone: UrlHelper.phoneNumber,
                                message: msg,
                                context: context,
                              );
                            },
                            icon: const Icon(Icons.chat_bubble_rounded, size: 18, color: Color(0xFF25D366)),
                            tooltip: widget.loc.inquireOnWhatsApp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
