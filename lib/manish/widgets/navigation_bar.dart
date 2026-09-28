import 'package:flutter/material.dart';
import '../models/profile_config_model.dart';
import '../theme/app_colors.dart';
import 'brand_logo_badge.dart';

class PortfolioNavBar extends StatelessWidget {
  final bool isDark;
  final String currentTab;
  final ProfileConfigModel config;
  final VoidCallback onToggleTheme;
  final VoidCallback onOpenCms;
  final Function(String sectionKey) onNavigate;

  const PortfolioNavBar({
    super.key,
    required this.isDark,
    this.currentTab = 'home',
    required this.config,
    required this.onToggleTheme,
    required this.onOpenCms,
    required this.onNavigate,
  });

  static const List<Map<String, dynamic>> _navTabs = [
    {'key': 'home', 'label': 'Home', 'icon': Icons.home_rounded},
    {'key': 'about', 'label': 'About', 'icon': Icons.person_rounded},
    {'key': 'services', 'label': 'Services', 'icon': Icons.miscellaneous_services_rounded},
    {'key': 'projects', 'label': 'Projects', 'icon': Icons.rocket_launch_rounded},
    {'key': 'contact', 'label': 'Contact', 'icon': Icons.mail_outline_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 880;

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  // Logo / Branding
                  InkWell(
                    onTap: () => onNavigate('home'),
                    borderRadius: BorderRadius.circular(12),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BrandLogoBadge(config: config, size: 38, borderRadius: 10),
                        const SizedBox(width: 10),
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
                                fontSize: 15,
                                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                              ),
                            ),
                            Text(
                              config.locationShort,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.primaryLight,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Desktop Center Nav Links
                  if (isDesktop) ...[
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _navTabs.map((tab) {
                        final isSelected = currentTab == tab['key'];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: InkWell(
                            onTap: () => onNavigate(tab['key'] as String),
                            borderRadius: BorderRadius.circular(20),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary.withValues(alpha: isDark ? 0.25 : 0.12)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primary.withValues(alpha: 0.5)
                                      : Colors.transparent,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    tab['icon'] as IconData,
                                    size: 16,
                                    color: isSelected
                                        ? AppColors.primary
                                        : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    tab['label'] as String,
                                    style: TextStyle(
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                      fontSize: 13.5,
                                      color: isSelected
                                          ? (isDark ? Colors.white : AppColors.primary)
                                          : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],

                  const Spacer(),

                  // Theme Toggle
                  IconButton(
                    onPressed: onToggleTheme,
                    icon: Icon(
                      isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                      color: isDark ? const Color(0xFFFBBF24) : const Color(0xFF475569),
                    ),
                    tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                  ),

                  // Admin / CMS Shortcut
                  IconButton(
                    onPressed: onOpenCms,
                    icon: Icon(Icons.tune_rounded, color: AppColors.primary),
                    tooltip: 'Admin Panel (Customize Everything)',
                  ),
                ],
              ),
            ),

            // Mobile / Tablet Tab Selector Row
            if (!isDesktop)
              Container(
                height: 42,
                padding: const EdgeInsets.only(bottom: 6),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: _navTabs.map((tab) {
                    final isSelected = currentTab == tab['key'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: () => onNavigate(tab['key'] as String),
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : (isDark ? AppColors.darkCard : const Color(0xFFE2E8F0)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                tab['icon'] as IconData,
                                size: 14,
                                color: isSelected
                                    ? Colors.white
                                    : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                tab['label'] as String,
                                style: TextStyle(
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                  fontSize: 12,
                                  color: isSelected
                                      ? Colors.white
                                      : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
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
