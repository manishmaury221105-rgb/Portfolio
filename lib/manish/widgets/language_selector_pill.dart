import 'package:flutter/material.dart';
import '../utils/app_localization.dart';

class LanguageSelectorPill extends StatelessWidget {
  final AppLanguage currentLanguage;
  final Function(AppLanguage lang) onLanguageChanged;
  final bool isDark;
  final bool isCompact;

  const LanguageSelectorPill({
    super.key,
    required this.currentLanguage,
    required this.onLanguageChanged,
    this.isDark = true,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final showDropdownMode = isCompact || screenWidth < 600;

    // Colors matching user requested mockup
    final containerBg = isDark ? const Color(0xFF101726) : const Color(0xFFF1F5F9);
    final borderColor = isDark ? const Color(0xFF243048) : const Color(0xFFCBD5E1);
    final activePillColor = const Color(0xFF5B67F6); // Vibrant Purple-Indigo from screenshot
    final unselectedTextColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569);

    final languages = [
      {'lang': AppLanguage.hindi, 'label': 'हिंदी', 'flag': '🇮🇳'},
      {'lang': AppLanguage.hinglish, 'label': 'Hinglish', 'flag': '🇮🇳'},
      {'lang': AppLanguage.english, 'label': 'English', 'flag': '🇬🇧'},
    ];

    // 1. Dropdown Mode for small screens
    if (showDropdownMode) {
      final curItem = languages.firstWhere(
        (e) => e['lang'] == currentLanguage,
        orElse: () => languages[1],
      );

      return Theme(
        data: Theme.of(context).copyWith(
          popupMenuTheme: PopupMenuThemeData(
            color: isDark ? const Color(0xFF101726) : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: borderColor, width: 1.2),
            ),
            elevation: 12,
          ),
        ),
        child: PopupMenuButton<AppLanguage>(
          initialValue: currentLanguage,
          onSelected: onLanguageChanged,
          tooltip: 'Select Language',
          offset: const Offset(0, 42),
          itemBuilder: (context) => languages.map((item) {
            final lang = item['lang'] as AppLanguage;
            final isSelected = currentLanguage == lang;
            return PopupMenuItem<AppLanguage>(
              value: lang,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? activePillColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(item['flag'] as String, style: const TextStyle(fontSize: 14)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        item['label'] as String,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? Colors.white : unselectedTextColor,
                        ),
                      ),
                    ),
                    if (isSelected)
                      const Icon(Icons.check_rounded, color: Colors.white, size: 16),
                  ],
                ),
              ),
            );
          }).toList(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: containerBg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: borderColor, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(curItem['flag'] as String, style: const TextStyle(fontSize: 13.5)),
                const SizedBox(width: 5),
                Text(
                  curItem['label'] as String,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 18,
                  color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // 2. Full Segmented Pill Mode (Exact match with user screenshot)
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: containerBg,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: languages.map((item) {
          final lang = item['lang'] as AppLanguage;
          final isSelected = currentLanguage == lang;
          final label = item['label'] as String;
          final flag = item['flag'] as String;

          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onLanguageChanged(lang),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? activePillColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: activePillColor.withValues(alpha: 0.45),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      flag,
                      style: const TextStyle(fontSize: 13.5),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                        letterSpacing: 0.1,
                        color: isSelected ? Colors.white : unselectedTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
