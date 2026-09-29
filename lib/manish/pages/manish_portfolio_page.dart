import 'package:flutter/material.dart';
import '../data/cms_storage_service.dart';
import '../models/profile_config_model.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../pages/admin_panel_page.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../utils/url_helper.dart';
import '../widgets/about_section.dart';
import '../widgets/app_smart_image.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/project_detail_dialog.dart';
import '../widgets/projects_section.dart';
import '../widgets/service_detail_dialog.dart';
import '../widgets/services_section.dart';
import '../widgets/whatsapp_icon.dart';
import '../widgets/why_work_with_me.dart';

class ManishPortfolioPage extends StatefulWidget {
  final bool initialDarkMode;

  const ManishPortfolioPage({
    super.key,
    this.initialDarkMode = true,
  });

  @override
  State<ManishPortfolioPage> createState() => _ManishPortfolioPageState();
}

class _ManishPortfolioPageState extends State<ManishPortfolioPage> {
  late bool _isDark;
  final CmsStorageService _cmsService = CmsStorageService();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTop = false;
  String _activePage = 'home';

  @override
  void initState() {
    super.initState();
    _isDark = widget.initialDarkMode;
    _cmsService.addListener(_onCmsUpdate);
    _scrollController.addListener(_onScroll);
  }

  void _onCmsUpdate() {
    if (mounted) setState(() {});
  }

  void _onScroll() {
    if (_scrollController.offset > 400 && !_showScrollToTop) {
      setState(() => _showScrollToTop = true);
    } else if (_scrollController.offset <= 400 && _showScrollToTop) {
      setState(() => _showScrollToTop = false);
    }
  }

  @override
  void dispose() {
    _cmsService.removeListener(_onCmsUpdate);
    _cmsService.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onNavigate(String pageKey) {
    setState(() {
      _activePage = pageKey;
    });

    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _openAdminPanel() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AdminPanelPage(
          cmsService: _cmsService,
          isDark: _isDark,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bg = _isDark ? AppColors.darkBg : AppColors.lightBg;
    final config = _cmsService.config;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 860;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            // Top Multi-Page Navigation Bar
            PortfolioNavBar(
              isDark: _isDark,
              activePage: _activePage,
              config: config,
              onToggleTheme: () => setState(() => _isDark = !_isDark),
              onNavigate: _onNavigate,
            ),

                // Main Page Content with smooth transition
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      child: KeyedSubtree(
                        key: ValueKey<String>(_activePage),
                        child: _buildCurrentPageContent(config, isDesktop),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Floating WhatsApp & Scroll To Top Buttons
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (_showScrollToTop) ...[
                FloatingActionButton.small(
                  heroTag: 'scroll_top',
                  onPressed: () {
                    _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
                  },
                  backgroundColor: _isDark ? AppColors.darkCard : Colors.white,
                  foregroundColor: _isDark ? Colors.white : AppColors.lightTextPrimary,
                  child: const Icon(Icons.keyboard_arrow_up_rounded),
                ),
                const SizedBox(height: 10),
              ],
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => UrlHelper.openWhatsApp(
                    phone: config.whatsappNumber,
                    message: config.whatsappDefaultMessage,
                    context: context,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 340),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF25D366), Color(0xFF128C7E)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF25D366).withValues(alpha: 0.5),
                          blurRadius: 18,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                        BoxShadow(
                          color: Colors.black.withValues(alpha: _isDark ? 0.4 : 0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const WhatsAppIcon(
                          size: 28,
                          color: Colors.white,
                        ),
                        if (config.whatsappMotivationText.isNotEmpty) ...[
                          const SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              config.whatsappMotivationText,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }

  Widget _buildCurrentPageContent(ProfileConfigModel config, bool isDesktop) {
    switch (_activePage) {
      case 'about':
        return _buildAboutPage(config, isDesktop);
      case 'services':
        return _buildServicesPage(config, isDesktop);
      case 'projects':
        return _buildProjectsPage(config, isDesktop);
      case 'contact':
        return _buildContactPage(config, isDesktop);
      case 'home':
      default:
        return _buildHomePage(config, isDesktop);
    }
  }

  // ==================== 1. HOME PAGE ====================
  Widget _buildHomePage(ProfileConfigModel config, bool isDesktop) {
    return Column(
      children: [
        // Hero Section
        HeroSection(
          isDark: _isDark,
          config: config,
          onNavigate: _onNavigate,
        ),

        // Why Work With Me Highlights
        WhyWorkWithMeSection(
          isDark: _isDark,
          items: _cmsService.whyWorkList,
          config: config,
        ),

        // Featured Services Preview
        _buildHomeFeaturedServices(isDesktop),

        // Featured Projects Preview
        _buildHomeFeaturedProjects(isDesktop),

        // Quick Consultation CTA Banner
        _buildHomeContactCta(config, isDesktop),

        // Footer
        FooterSection(
          isDark: _isDark,
          config: config,
          onNavigate: _onNavigate,
          onOpenAdmin: _openAdminPanel,
        ),
      ],
    );
  }

  // ==================== 2. ABOUT PAGE ====================
  Widget _buildAboutPage(ProfileConfigModel config, bool isDesktop) {
    return Column(
      children: [
        // Full About Section
        AboutSection(
          isDark: _isDark,
          config: config,
        ),

        // Why Work With Me Breakdown
        WhyWorkWithMeSection(
          isDark: _isDark,
          items: _cmsService.whyWorkList,
          config: config,
        ),

        // Bottom CTA
        _buildPageBottomCta(
          title: 'Ready to collaborate on your next project?',
          subtitle: 'Let\'s turn your ideas into high-converting digital realities.',
          buttonText: 'Contact Digital Manish',
          targetPage: 'contact',
        ),

        // Footer
        FooterSection(
          isDark: _isDark,
          config: config,
          onNavigate: _onNavigate,
          onOpenAdmin: _openAdminPanel,
        ),
      ],
    );
  }

  // ==================== 3. SERVICES PAGE ====================
  Widget _buildServicesPage(ProfileConfigModel config, bool isDesktop) {
    return Column(
      children: [
        // Full Services Section
        ServicesSection(
          isDark: _isDark,
          services: _cmsService.services,
        ),

        // Custom Requirements CTA
        _buildPageBottomCta(
          title: 'Need a Custom Marketing or Dev Strategy?',
          subtitle: 'I craft custom end-to-end solutions tailored specifically for your business growth.',
          buttonText: 'Discuss Your Requirements',
          targetPage: 'contact',
        ),

        // Footer
        FooterSection(
          isDark: _isDark,
          config: config,
          onNavigate: _onNavigate,
          onOpenAdmin: _openAdminPanel,
        ),
      ],
    );
  }

  // ==================== 4. PROJECTS PAGE ====================
  Widget _buildProjectsPage(ProfileConfigModel config, bool isDesktop) {
    return Column(
      children: [
        // Full Projects Section with Category Filters
        ProjectsSection(
          projects: _cmsService.projects,
          isDark: _isDark,
        ),

        // Project Proposal CTA
        _buildPageBottomCta(
          title: 'Have a project or website in mind?',
          subtitle: 'Get top quality development with fast turnaround and modern tech stack.',
          buttonText: 'Start Your Project Today',
          targetPage: 'contact',
        ),

        // Footer
        FooterSection(
          isDark: _isDark,
          config: config,
          onNavigate: _onNavigate,
          onOpenAdmin: _openAdminPanel,
        ),
      ],
    );
  }

  // ==================== 5. CONTACT PAGE ====================
  Widget _buildContactPage(ProfileConfigModel config, bool isDesktop) {
    return Column(
      children: [
        // Full Contact Section
        ContactSection(
          isDark: _isDark,
          config: config,
        ),

        // Footer
        FooterSection(
          isDark: _isDark,
          config: config,
          onNavigate: _onNavigate,
          onOpenAdmin: _openAdminPanel,
        ),
      ],
    );
  }

  // ==================== HOME PAGE PREVIEWS ====================
  Widget _buildHomeFeaturedServices(bool isDesktop) {
    final services = _cmsService.services.take(3).toList();
    if (services.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 60 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final isCompact = constraints.maxWidth < 500;
                  final titleCol = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Services Overview',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'What I Specialize In',
                        style: AppTypography.displayMedium(context, isDark: _isDark),
                      ),
                    ],
                  );

                  final viewAllBtn = TextButton.icon(
                    onPressed: () => _onNavigate('services'),
                    icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                    label: const Text('View All Services', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      padding: EdgeInsets.zero,
                    ),
                  );

                  if (isCompact) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleCol,
                        const SizedBox(height: 12),
                        viewAllBtn,
                      ],
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: titleCol),
                      const SizedBox(width: 16),
                      viewAllBtn,
                    ],
                  );
                },
              ),
              const SizedBox(height: 28),

              // 3 Cards Layout
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = constraints.maxWidth;
                  final crossCount = cardWidth > 900 ? 3 : (cardWidth > 600 ? 2 : 1);

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossCount,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: isDesktop ? 360 : 340,
                    ),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final s = services[index];
                      return _buildFeaturedServiceCard(s);
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

  Widget _buildFeaturedServiceCard(ServiceModel service) {
    final textPrimary = _isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final hasImage = service.imageUrl.trim().isNotEmpty;

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => ServiceDetailDialog(service: service, isDark: _isDark),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: _isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isDark ? 0.2 : 0.04),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image with dark gradient overlay if present
            if (hasImage) ...[
              AppSmartImage(
                imageUrl: service.imageUrl,
                fit: BoxFit.cover,
                errorWidget: Container(color: service.accentColor.withValues(alpha: 0.15)),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.35),
                      Colors.black.withValues(alpha: 0.70),
                      Colors.black.withValues(alpha: 0.95),
                    ],
                    stops: const [0.0, 0.45, 1.0],
                  ),
                ),
              ),
            ],

            // Content
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: hasImage
                          ? service.accentColor.withValues(alpha: 0.95)
                          : service.accentColor.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: hasImage
                          ? [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : null,
                    ),
                    child: Icon(
                      service.icon,
                      color: hasImage ? Colors.white : service.accentColor,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    service.titleHindi,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: hasImage ? Colors.white : textPrimary,
                      shadows: hasImage
                          ? const [Shadow(color: Colors.black87, blurRadius: 8, offset: Offset(0, 2))]
                          : null,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service.titleEnglish,
                    style: TextStyle(
                      color: hasImage
                          ? Colors.white70
                          : (_isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      shadows: hasImage
                          ? const [Shadow(color: Colors.black87, blurRadius: 6, offset: Offset(0, 1))]
                          : null,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      service.shortDesc,
                      style: TextStyle(
                        color: hasImage
                            ? Colors.white.withValues(alpha: 0.85)
                            : (_isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                        fontSize: 13,
                        height: 1.5,
                        shadows: hasImage
                            ? const [Shadow(color: Colors.black87, blurRadius: 6, offset: Offset(0, 1))]
                            : null,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Know Details',
                        style: TextStyle(
                          color: hasImage ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 14,
                        color: hasImage ? Colors.white : AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeFeaturedProjects(bool isDesktop) {
    final projects = _cmsService.projects.take(3).toList();
    if (projects.isEmpty) return const SizedBox.shrink();

    return Container(
      color: _isDark ? const Color(0xFF0D1322) : const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: isDesktop ? 60 : 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final isCompact = constraints.maxWidth < 500;
                  final titleCol = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Recent Works',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Featured Case Studies',
                        style: AppTypography.displayMedium(context, isDark: _isDark),
                      ),
                    ],
                  );

                  final viewAllBtn = TextButton.icon(
                    onPressed: () => _onNavigate('projects'),
                    icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                    label: const Text('View All Projects', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      padding: EdgeInsets.zero,
                    ),
                  );

                  if (isCompact) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleCol,
                        const SizedBox(height: 12),
                        viewAllBtn,
                      ],
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: titleCol),
                      const SizedBox(width: 16),
                      viewAllBtn,
                    ],
                  );
                },
              ),
              const SizedBox(height: 28),

              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = constraints.maxWidth;
                  final crossCount = cardWidth > 900 ? 3 : (cardWidth > 600 ? 2 : 1);

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossCount,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 410,
                    ),
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final p = projects[index];
                      return _buildFeaturedProjectCard(p);
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

  Widget _buildFeaturedProjectCard(ProjectModel project) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => ProjectDetailDialog(project: project, isDark: _isDark),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: _isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isDark ? AppColors.darkCardBorder : AppColors.lightCardBorder,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppSmartImage(
                    imageUrl: project.imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: Container(
                      color: AppColors.primary.withValues(alpha: 0.15),
                      child: Center(
                        child: Icon(Icons.rocket_launch_rounded, size: 48, color: AppColors.primary),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        project.category,
                        style: const TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        project.shortDesc,
                        style: TextStyle(
                          color: _isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                          fontSize: 12.5,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (project.resultsMetric != null && project.resultsMetric!.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF10B981).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.trending_up_rounded, color: Color(0xFF10B981), size: 14),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                project.resultsMetric!,
                                style: const TextStyle(
                                  color: Color(0xFF10B981),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11.5,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContactCta(ProfileConfigModel config, bool isDesktop) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60 : 20,
        vertical: 40,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 48 : 24,
              vertical: isDesktop ? 44 : 32,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  const Color(0xFF4F46E5),
                  const Color(0xFF7C3AED),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.35),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: isDesktop
                ? Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Let\'s Build Something Extraordinary',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Ready to launch your project, run high-converting ad campaigns, or optimize your tech?',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      ElevatedButton.icon(
                        onPressed: () => _onNavigate('contact'),
                        icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                        label: const Text('Start Discussion', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const Text(
                        'Let\'s Build Something Extraordinary',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Ready to launch your project or run high-converting ads?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () => _onNavigate('contact'),
                        icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                        label: const Text('Start Discussion', style: TextStyle(fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageBottomCta({
    required String title,
    required String subtitle,
    required String buttonText,
    required String targetPage,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: _isDark ? AppColors.darkCard : const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _isDark ? AppColors.darkCardBorder : const Color(0xFFC7D2FE),
              ),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => _onNavigate(targetPage),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                  label: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
