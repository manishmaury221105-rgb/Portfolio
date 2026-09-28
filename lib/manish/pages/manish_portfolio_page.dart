import 'package:flutter/material.dart';
import '../data/cms_storage_service.dart';
import '../theme/app_colors.dart';
import '../utils/url_helper.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/projects_section.dart';
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

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _whyWorkKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

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

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _onNavigate(String sectionKey) {
    switch (sectionKey) {
      case 'about':
        _scrollToSection(_aboutKey);
        break;
      case 'services':
        _scrollToSection(_servicesKey);
        break;
      case 'projects':
        _scrollToSection(_projectsKey);
        break;
      case 'why_work':
        _scrollToSection(_whyWorkKey);
        break;
      case 'contact':
        _scrollToSection(_contactKey);
        break;
      case 'home':
      default:
        _scrollToSection(_heroKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bg = _isDark ? AppColors.darkBg : AppColors.lightBg;
    final config = _cmsService.config;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            // Clean Minimalist Top Navigation Bar
            PortfolioNavBar(
              isDark: _isDark,
              config: config,
              onToggleTheme: () => setState(() => _isDark = !_isDark),
              onContactTap: () => _scrollToSection(_contactKey),
              onLogoTap: () => _scrollToSection(_heroKey),
            ),

            // Continuous Single-Page Smooth Scrolling View
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    // Hero Section
                    KeyedSubtree(
                      key: _heroKey,
                      child: HeroSection(
                        isDark: _isDark,
                        config: config,
                        onNavigate: _onNavigate,
                      ),
                    ),

                    // Why Work With Me Highlights
                    KeyedSubtree(
                      key: _whyWorkKey,
                      child: WhyWorkWithMeSection(
                        isDark: _isDark,
                        items: _cmsService.whyWorkList,
                        config: config,
                      ),
                    ),

                    // Services Section
                    KeyedSubtree(
                      key: _servicesKey,
                      child: ServicesSection(
                        isDark: _isDark,
                        services: _cmsService.services,
                      ),
                    ),

                    // Projects Section
                    KeyedSubtree(
                      key: _projectsKey,
                      child: ProjectsSection(
                        projects: _cmsService.projects,
                        isDark: _isDark,
                      ),
                    ),

                    // About Section
                    KeyedSubtree(
                      key: _aboutKey,
                      child: AboutSection(
                        isDark: _isDark,
                        config: config,
                      ),
                    ),

                    // Contact Section
                    KeyedSubtree(
                      key: _contactKey,
                      child: ContactSection(
                        isDark: _isDark,
                        config: config,
                      ),
                    ),

                    // Footer Section
                    FooterSection(
                      isDark: _isDark,
                      config: config,
                      onNavigate: _onNavigate,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating Action Buttons for WhatsApp & Scroll To Top
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
          // Unified Floating WhatsApp Button with Motivation Text
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
}
