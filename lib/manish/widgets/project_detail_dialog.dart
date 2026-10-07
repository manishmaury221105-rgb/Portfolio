import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/app_localization.dart';
import '../utils/url_helper.dart';
import 'app_smart_image.dart';

class ProjectDetailDialog extends StatelessWidget {
  final ProjectModel project;
  final bool isDark;
  final AppLanguage language;

  const ProjectDetailDialog({
    super.key,
    required this.project,
    required this.isDark,
    this.language = AppLanguage.hinglish,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textSecondary = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final loc = AppLocalization(language);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 680),
        child: Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
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
                // Header Image / Mockup Banner
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                        ),
                        child: AppSmartImage(
                          imageUrl: project.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorWidget: _buildPlaceholderHeader(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          icon: const Icon(Icons.close_rounded, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.4),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Text(
                          project.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        loc.getProjectTitle(project),
                        style: AppTypography.displayMedium(context, isDark: isDark).copyWith(fontSize: 22),
                      ),
                      const SizedBox(height: 12),

                      // Results Metric Pill (if any)
                      if (project.resultsMetric != null && project.resultsMetric!.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.success.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.trending_up_rounded, color: AppColors.success, size: 18),
                              const SizedBox(width: 8),
                              Text(
                                project.resultsMetric!,
                                style: const TextStyle(
                                  color: AppColors.success,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Detailed Description
                      Text(
                        loc.getProjectDetailedDesc(project),
                        style: AppTypography.bodyLarge(context, isDark: isDark).copyWith(
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Key Features
                      if (loc.getProjectKeyFeatures(project).isNotEmpty) ...[
                        Text(
                          loc.keyFeaturesTitle,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...loc.getProjectKeyFeatures(project).map((feat) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(alpha: 0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.check, size: 12, color: AppColors.primary),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      feat,
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

                      // Tech Stack Chips
                      if (project.techStack.isNotEmpty) ...[
                        Text(
                          loc.techStackTitle,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textPrimary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.techStack
                              .map((tech) => Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: isDark ? AppColors.darkCard : const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: isDark ? AppColors.darkCardBorder : const Color(0xFFE2E8F0),
                                      ),
                                    ),
                                    child: Text(
                                      tech,
                                      style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w500,
                                        color: textPrimary,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(height: 28),
                      ],

                      // Live Demo & Inquire Actions
                      Row(
                        children: [
                          if (project.liveDemoUrl != null && project.liveDemoUrl!.isNotEmpty) ...[
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => UrlHelper.openLink(project.liveDemoUrl!, context: context),
                                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                                label: Text(
                                  loc.liveDemoBtn,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                          ],
                          IconButton.filled(
                            onPressed: () {
                              final msg = language == AppLanguage.hindi
                                  ? 'नमस्ते मनीष जी! मुझे आपके "${project.title}" प्रोजेक्ट के बारे में बात करनी है।'
                                  : (language == AppLanguage.english
                                      ? 'Hello Manish! I saw your "${project.title}" project and would like to build something similar.'
                                      : 'Namaste Manish ji! Maine aapka "${project.title}" project dekha, mujhe similar solution develop karwana hai.');
                              UrlHelper.openWhatsApp(
                                phone: UrlHelper.phoneNumber,
                                message: msg,
                                context: context,
                              );
                            },
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFF25D366),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(14),
                            ),
                            icon: const Icon(Icons.chat_bubble_rounded, size: 20),
                            tooltip: 'Inquire on WhatsApp',
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

  Widget _buildPlaceholderHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: const Center(
        child: Icon(Icons.rocket_launch_rounded, size: 56, color: Colors.white),
      ),
    );
  }
}
