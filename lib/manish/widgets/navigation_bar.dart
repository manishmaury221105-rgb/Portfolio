import 'package:flutter/material.dart';
import '../models/profile_config_model.dart';
import '../theme/app_colors.dart';
import 'brand_logo_badge.dart';

class PortfolioNavBar extends StatelessWidget {
  final bool isDark;
  final String activePage;
  final ProfileConfigModel config;
  final VoidCallback onToggleTheme;
  final Function(String pageKey) onNavigate;
  final VoidCallback? onOpenAdmin;

  const PortfolioNavBar({
    super.key,
    required this.isDark,
    required this.activePage,
    required this.config,
    required this.onToggleTheme,
    required this.onNavigate,
    this.onOpenAdmin,
  });

  static const List<Map<String, dynamic>> _pages = [
    {'key': 'home', 'label': 'Home', 'icon': Icons.home_rounded},
    {'key': 'about', 'label': 'About', 'icon': Icons.person_rounded},
    {'key': 'services', 'label': 'Services', 'icon': Icons.miscellaneous_services_rounded},
    {'key': 'projects', 'label': 'Projects', 'icon': Icons.rocket_launch_rounded},
    {'key': 'contact', 'label': 'Contact', 'icon': Icons.mail_outline_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 860;

    return Container(
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBg : AppColors.lightBg).withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.darkCardBorder.withValues(alpha: 0.6) : AppColors.lightCardBorder,
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  // Logo / Branding (Double tap / Long press opens Admin Panel)
                  InkWell(
                    onTap: () => onNavigate('home'),
                    onDoubleTap: onOpenAdmin,
                    onLongPress: onOpenAdmin,
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BrandLogoBadge(config: config, size: 40, borderRadius: 10),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              config.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: -0.2,
                                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                              ),
                            ),
                            Text(
                              config.locationShort.isNotEmpty ? config.locationShort : 'Flutter & Web Dev',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11.5,
                                color: AppColors.primaryLight,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Desktop Center Navigation Links
                  if (isDesktop) ...[
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkCard.withValues(alpha: 0.7) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: isDark ? AppColors.darkCardBorder : const Color(0xFFE2E8F0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: _pages.map((page) {
                          final isSelected = activePage == page['key'];
                          return InkWell(
                            onTap: () => onNavigate(page['key'] as String),
                            borderRadius: BorderRadius.circular(24),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primary : Colors.transparent,
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: AppColors.primary.withValues(alpha: 0.35),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    page['icon'] as IconData,
                                    size: 15,
                                    color: isSelected
                                        ? Colors.white
                                        : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    page['label'] as String,
                                    style: TextStyle(
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                      fontSize: 13.5,
                                      color: isSelected
                                          ? Colors.white
                                          : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],

                  const Spacer(),

                  // Theme Toggle Button
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkCard : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDark ? AppColors.darkCardBorder : const Color(0xFFE2E8F0),
                      ),
                    ),
                    child: IconButton(
                      onPressed: onToggleTheme,
                      icon: Icon(
                        isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                        color: isDark ? const Color(0xFFFBBF24) : const Color(0xFF475569),
                        size: 20,
                      ),
                      tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                    ),
                  ),
                ],
              ),
            ),

            // Mobile / Tablet Clean Nav Tabs Row
            if (!isDesktop)
              Container(
                height: 44,
                padding: const EdgeInsets.only(bottom: 8),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: _pages.map((page) {
                    final isSelected = activePage == page['key'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: () => onNavigate(page['key'] as String),
                        borderRadius: BorderRadius.circular(20),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : (isDark ? AppColors.darkCard : const Color(0xFFE2E8F0)),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: AppColors.primary.withValues(alpha: 0.3),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                page['icon'] as IconData,
                                size: 14,
                                color: isSelected
                                    ? Colors.white
                                    : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                page['label'] as String,
                                style: TextStyle(
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                  fontSize: 12.5,
                                  color: isSelected
                                      ? Colors.white
                                      : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
