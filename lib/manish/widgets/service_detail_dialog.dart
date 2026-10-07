import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/app_localization.dart';
import '../utils/url_helper.dart';
import 'app_smart_image.dart';

class ServiceDetailDialog extends StatelessWidget {
  final ServiceModel service;
  final bool isDark;
  final AppLanguage language;

  const ServiceDetailDialog({
    super.key,
    required this.service,
    required this.isDark,
    this.language = AppLanguage.hinglish,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textSecondary = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final loc = AppLocalization(language);
    final serviceTitle = loc.getServiceTitle(service);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Banner (if available)
                if (service.imageUrl.isNotEmpty)
                  SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                          child: AppSmartImage(
                            imageUrl: service.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                bg.withValues(alpha: 0.8),
                              ],
                              stops: const [0.6, 1.0],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Header Banner
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: service.accentColor.withValues(alpha: 0.12),
                    borderRadius: service.imageUrl.isNotEmpty
                        ? BorderRadius.zero
                        : const BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: service.accentColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: service.accentColor.withValues(alpha: 0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(service.icon, color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              serviceTitle,
                              style: AppTypography.displayMedium(context, isDark: isDark).copyWith(fontSize: 22),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              service.titleEnglish.isNotEmpty ? service.titleEnglish : service.titleHindi,
                              style: TextStyle(
                                color: service.accentColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.close_rounded, color: textSecondary),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Detailed Description
                      Text(
                        loc.getServiceDetailedDesc(service),
                        style: AppTypography.bodyLarge(context, isDark: isDark).copyWith(
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // What is included / Sub-offerings
                      if (service.subOfferings.isNotEmpty) ...[
                        Text(
                          loc.includedServicesTitle,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...service.subOfferings.map((item) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: service.accentColor.withValues(alpha: 0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.check, size: 13, color: service.accentColor),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: textSecondary,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 24),
                      ],

                      // Key Benefits
                      if (loc.getServiceBenefits(service).isNotEmpty) ...[
                        Text(
                          loc.keyBenefitsTitle,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...loc.getServiceBenefits(service).map((benefit) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.star_rounded, size: 18, color: service.accentColor),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      benefit,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: textSecondary,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 28),
                      ],

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).pop();
                                final message = language == AppLanguage.hindi
                                    ? 'नमस्ते मनीष जी! मुझे "$serviceTitle" सेवा के बारे में जानकारी चाहिए।'
                                    : (language == AppLanguage.english
                                        ? 'Hello Manish! I am interested in discussing your "$serviceTitle" service.'
                                        : 'Namaste Manish ji! Mujhe "$serviceTitle" service ke baare me discuss karna hai. Details provide karein.');
                                UrlHelper.openWhatsApp(
                                  phone: UrlHelper.phoneNumber,
                                  message: message,
                                  context: context,
                                );
                              },
                              icon: const Icon(Icons.chat_bubble_rounded, size: 18, color: Colors.white),
                              label: Text(
                                loc.bookConsultationBtn,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: service.accentColor,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
