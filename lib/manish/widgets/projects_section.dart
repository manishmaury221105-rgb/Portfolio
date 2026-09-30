import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/app_localization.dart';
import '../utils/url_helper.dart';
import 'app_smart_image.dart';
import 'project_detail_dialog.dart';

class ProjectsSection extends StatefulWidget {
  final List<ProjectModel> projects;
  final bool isDark;
  final AppLanguage language;
  final VoidCallback? onOpenCms;

  const ProjectsSection({
    super.key,
    required this.projects,
    required this.isDark,
    this.language = AppLanguage.hinglish,
    this.onOpenCms,
  });

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String _selectedCategoryKey = 'All';

  final List<Map<String, String>> _categories = [
    {'key': 'All', 'icon': '🎯'},
    {'key': 'Website', 'icon': '💻'},
    {'key': 'App', 'icon': '📱'},
    {'key': 'Meta Ads', 'icon': '📢'},
    {'key': 'SEO', 'icon': '🔍'},
  ];

  String _getCategoryLabel(String key, AppLocalization loc) {
    switch (key) {
      case 'Website':
        return loc.filterWebsites;
      case 'App':
        return loc.filterApps;
      case 'Meta Ads':
        return loc.filterMetaAds;
      case 'SEO':
        return loc.filterSeo;
      case 'All':
      default:
        return loc.filterAll;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 950;
    final isTablet = width > 600 && width <= 950;
    final crossAxisCount = isDesktop ? 3 : (isTablet ? 2 : 1);
    final loc = AppLocalization(widget.language);

    final filteredProjects = _selectedCategoryKey == 'All'
        ? widget.projects
        : widget.projects
            .where((p) => p.category.toLowerCase().contains(_selectedCategoryKey.toLowerCase()))
            .toList();

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
              // Badge & Add Project CTA
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      loc.projectsBadge,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                loc.projectsHeading,
                textAlign: TextAlign.center,
                style: AppTypography.displayMedium(context, isDark: widget.isDark),
              ),
              const SizedBox(height: 8),
              Text(
                loc.projectsSubtitle,
                textAlign: TextAlign.center,
                style: AppTypography.bodyLarge(context, isDark: widget.isDark),
              ),
              const SizedBox(height: 24),

              // Category Filter Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _categories.map((cat) {
                    final isSelected = _selectedCategoryKey == cat['key'];
                    final label = _getCategoryLabel(cat['key']!, loc);

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: () => setState(() => _selectedCategoryKey = cat['key']!),
                        borderRadius: BorderRadius.circular(20),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : (widget.isDark ? AppColors.darkCard : const Color(0xFFF1F5F9)),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : (widget.isDark ? AppColors.darkCardBorder : const Color(0xFFE2E8F0)),
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: AppColors.primary.withValues(alpha: 0.35),
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Text(
                            label,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : (widget.isDark
                                      ? AppColors.darkTextSecondary
                                      : AppColors.lightTextSecondary),
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 36),

              // Grid of Projects
              filteredProjects.isEmpty
                  ? Container(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          const Icon(Icons.rocket_launch_rounded, size: 48, color: Colors.grey),
                          const SizedBox(height: 12),
                          Text('No projects found in this category.',
                              style: AppTypography.bodyLarge(context, isDark: widget.isDark)),
                          if (widget.onOpenCms != null) ...[
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: widget.onOpenCms,
                              icon: const Icon(Icons.add_rounded),
                              label: const Text('Add Project in Admin Panel'),
                            ),
                          ],
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
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            mainAxisExtent: isDesktop ? 420 : (isTablet ? 410 : 380),
                          ),
                          itemCount: filteredProjects.length,
                          itemBuilder: (context, i) {
                            final project = filteredProjects[i];
                            return _ProjectCard(
                              project: project,
                              isDark: widget.isDark,
                              language: widget.language,
                              loc: loc,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => ProjectDetailDialog(
                                    project: project,
                                    isDark: widget.isDark,
                                    language: widget.language,
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

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final bool isDark;
  final AppLanguage language;
  final AppLocalization loc;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.project,
    required this.isDark,
    required this.language,
    required this.loc,
    required this.onTap,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textPrimary = widget.isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textSecondary = widget.isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

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
                ? AppColors.primary
                : (widget.isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.primary.withValues(alpha: 0.18)
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
              // Project Image / Banner
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppSmartImage(
                      imageUrl: widget.project.imageUrl,
                      fit: BoxFit.cover,
                      errorWidget: Container(
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                        ),
                        child: const Center(
                          child: Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 36),
                        ),
                      ),
                    ),
                    // Category Badge
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: Text(
                          widget.project.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (widget.project.resultsMetric != null && widget.project.resultsMetric!.isNotEmpty)
                      Positioned(
                        bottom: 10,
                        right: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.success,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            widget.project.resultsMetric!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Content Area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.loc.getProjectTitle(widget.project),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.loc.getProjectShortDesc(widget.project),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: textSecondary,
                          height: 1.4,
                        ),
                      ),
                      const Spacer(),

                      // Tech stack chips preview
                      if (widget.project.techStack.isNotEmpty)
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: widget.project.techStack.take(3).map((tech) {
                              return Container(
                                margin: const EdgeInsets.only(right: 6),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: widget.isDark
                                      ? const Color(0xFF1E293B)
                                      : const Color(0xFFF1F5F9),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  tech,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: textSecondary,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                      const SizedBox(height: 12),

                      // Action Row
                      Row(
                        children: [
                          Text(
                            widget.loc.viewDetailsBtn,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primary),
                          const Spacer(),
                          if (widget.project.liveDemoUrl != null && widget.project.liveDemoUrl!.isNotEmpty)
                            IconButton(
                              onPressed: () =>
                                  UrlHelper.openLink(widget.project.liveDemoUrl!, context: context),
                              icon: Icon(Icons.open_in_new_rounded, size: 18, color: AppColors.primary),
                              tooltip: widget.loc.liveDemoBtn,
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
