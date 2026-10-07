import '../models/profile_config_model.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../models/why_work_model.dart';

class PortfolioData {
  static const ProfileConfigModel defaultConfig = ProfileConfigModel();

  // 9 Core Default Services
  static final List<ServiceModel> defaultServices = [
    const ServiceModel(
      id: 'gmb_setup',
      titleHindi: 'GMB Setup',
      titleEnglish: 'Google My Business & Map Ranking',
      shortDesc: 'Complete Google Business Profile setup, instant verification, local 3-Pack Map dominance, and 5-star review growth.',
      detailedDesc:
          'Get your local business to rank #1 in Google Maps and local 3-Pack search results. We manage Google Business Profile (GBP) creation, verification, category optimization, local NAP citations, geo-tagged photos, and review campaigns.',
      iconCodePoint: 0xe3ab, // Icons.location_on_rounded
      accentColorValue: 0xFF22C55E,
      imageUrl: 'assets/images/services/service_gmb_setup.jpg',
      subOfferings: [
        'Google Business Profile (GBP) Setup & Verification',
        'Google Maps 3-Pack Local Ranking Optimization',
        'Local Citations & NAP Consistency Building',
        '5-Star Review Generation & Response Strategy',
        'Geo-Tagged Photos & Weekly Google Posts Management',
      ],
      benefits: [
        'Massive surge in direct customer phone calls & visits',
        'Dominate local competitors in your city or area',
        'Build unmatched local credibility & customer trust',
        '100% Google policy compliant verification process',
      ],
    ),
    const ServiceModel(
      id: 'meta_ads',
      titleHindi: 'Meta Ads',
      titleEnglish: 'Facebook & Instagram Advertising',
      shortDesc: 'Run laser-targeted Facebook & Instagram campaigns to generate maximum qualified leads at optimal cost.',
      detailedDesc:
          'Advanced demographic and interest-based targeting combined with custom retargeting funnels that deliver high-intent buyers directly into your WhatsApp or CRM.',
      iconCodePoint: 0xe133, // Icons.campaign_rounded
      accentColorValue: 0xFFEC4899,
      imageUrl: 'assets/images/services/service_meta_ads.jpg',
      subOfferings: [
        'Facebook Ads Campaign Setup & Management',
        'Instagram Reels & Feed Sponsored Ads',
        'Direct WhatsApp Message Lead Ads',
        'Retargeting & Lookalike Audience Building',
        'High-Converting Ad Copy & Creative Strategy',
      ],
      benefits: [
        'Optimized low Cost-Per-Lead (CPL)',
        'Direct customer conversations on WhatsApp',
        'Continuous A/B testing for maximum Return on Ad Spend (ROAS)',
        'Immediate customer engagement and conversions',
      ],
    ),
    const ServiceModel(
      id: 'google_ads',
      titleHindi: 'Google Ads (PPC)',
      titleEnglish: 'Google Search, Display & YouTube Ads',
      shortDesc: 'Position your business at the top of Google when high-intent customers search for your services.',
      detailedDesc:
          'High-intent Google Search PPC Ads, Display Network Banners, and YouTube Video promotions specifically tailored to capture ready-to-buy customers.',
      iconCodePoint: 0xf525, // Icons.ads_click_rounded
      accentColorValue: 0xFFF59E0B,
      imageUrl: 'assets/images/services/service_google_ads.jpg',
      subOfferings: [
        'Google Search Pay-Per-Click (PPC) Ads',
        'High-Impact Display Network Banner Ads',
        'YouTube Video Advertisement Campaigns',
        'Call-Only Ads for Instant Direct Phone Inquiries',
        'Negative Keyword Optimization & Strict Budget Control',
      ],
      benefits: [
        'Instant direct phone calls and inquiries from Day 1',
        'Pay-Per-Click model ensuring budget efficiency',
        'Laser-targeted buyer intent traffic',
        'Precise geo-fencing for local and national campaigns',
      ],
    ),
    const ServiceModel(
      id: 'email_marketing',
      titleHindi: 'Email Marketing',
      titleEnglish: 'Email Marketing & Drip Automation',
      shortDesc: 'High-converting email sequences, newsletters, retention funnels, and automated drip workflows.',
      detailedDesc:
          'Turn subscribers into high-ticket paying customers with automated email funnels, cold outreach sequences, weekly newsletters, and abandoned cart recovery workflows with 99% inbox deliverability.',
      iconCodePoint: 0xe3e3, // Icons.mark_email_read_rounded
      accentColorValue: 0xFF8B5CF6,
      imageUrl: 'assets/images/services/service_email_marketing.jpg',
      subOfferings: [
        'Automated Lead Nurturing & Drip Email Sequences',
        'High-Converting Sales Newsletters & Product Campaigns',
        'Responsive Mobile-Optimized Email Template Design',
        'Spam-Free High Deliverability & Domain Authentication',
        'Subscriber List Segmentation & Behaviour Tracking',
      ],
      benefits: [
        'Highest ROI digital marketing channel with repeat sales',
        'Automated recurring revenue from existing client list',
        'Build long-term customer relationships and brand loyalty',
        'Transparent analytics on open rates, clicks & conversions',
      ],
    ),
    const ServiceModel(
      id: 'chart_ads',
      titleHindi: 'Chart Ads',
      titleEnglish: 'Performance Chart & Conversion Ads',
      shortDesc: 'Data-driven growth ads, real-time ROI chart analytics, conversion tracking funnels, and budget scaling.',
      detailedDesc:
          'Laser-focused performance marketing backed by real-time conversion charts, deep analytics dashboards, multi-touch attribution, and algorithmic scaling to maximize Return On Ad Spend (ROAS).',
      iconCodePoint: 0xe08f, // Icons.analytics_rounded
      accentColorValue: 0xFF06B6D4,
      imageUrl: 'assets/images/services/service_chart_ads.jpg',
      subOfferings: [
        'Data-Driven Performance Growth & Scaling Ads',
        'Real-Time ROI & Conversion Analytics Dashboards',
        'Google Analytics 4 & Server-Side Pixel Tracking',
        'Multi-Channel Attribution & Custom Conversion Funnels',
        'A/B Split Testing & Budget Optimization for Max ROAS',
      ],
      benefits: [
        'Crystal clear visibility into every rupee spent and earned',
        'Predictable customer acquisition cost (CAC) scaling',
        'Eliminate wasted ad spend with negative keyword filtering',
        'Comprehensive weekly performance chart reports',
      ],
    ),
    const ServiceModel(
      id: 'seo',
      titleHindi: 'Search Engine Optimization (SEO)',
      titleEnglish: 'SEO & Google Ranking',
      shortDesc: 'Rank on Google Page 1 and generate sustainable organic traffic, map citations, and regular customer inquiries.',
      detailedDesc:
          'Full-cycle Search Engine Optimization process covering on-page optimization, technical audits, Google Business Profile supremacy, and high-intent keyword strategies.',
      iconCodePoint: 0xe567, // Icons.search_rounded
      accentColorValue: 0xFF10B981,
      imageUrl: 'assets/images/services/service_seo_ranking.jpg',
      subOfferings: [
        'On-Page SEO & Content Optimization',
        'Technical SEO & Core Web Vitals Fixes',
        'High-Intent Keyword Research & Competitor Analysis',
        'Authority Backlink Building & Technical Audits',
        'Google Search Console & Analytics Setup',
      ],
      benefits: [
        'Sustainable organic Google traffic without ongoing ad spend',
        'Top rank on Google for high-value business keywords',
        'Long-term sustainable business growth & authority',
        'High search visibility & trustworthy brand reputation',
      ],
    ),
    const ServiceModel(
      id: 'digital_marketing',
      titleHindi: 'Digital Marketing',
      titleEnglish: 'Digital Marketing & Growth',
      shortDesc: 'Drive continuous qualified leads, elevate brand awareness, and scale your online business presence.',
      detailedDesc:
          'Comprehensive performance marketing strategies including social media marketing, targeted audience acquisition, brand positioning, and high-converting lead funnels to ensure your business dominates its market.',
      iconCodePoint: 0xf0174, // Icons.trending_up_rounded
      accentColorValue: 0xFF6366F1,
      imageUrl: 'assets/images/services/service_digital_marketing.jpg',
      subOfferings: [
        'Social Media Marketing (SMM)',
        'High-Converting Lead Generation',
        'Online Business Promotion & Branding',
        'Audience Research & Growth Strategies',
        'Brand Awareness & Content Planning',
      ],
      benefits: [
        'High volume of genuine, qualified inquiries',
        'Enhanced brand credibility and online presence',
        'Laser-targeted local and national audience reach',
        'Transparent analytics and periodic performance reports',
      ],
    ),
    const ServiceModel(
      id: 'web_dev',
      titleHindi: 'Website Development',
      titleEnglish: 'Fast & Modern Responsive Websites',
      shortDesc: 'Ultra-fast, responsive, modern websites and digital platforms optimized for conversions and search engines.',
      detailedDesc:
          'Custom modern business websites, e-commerce stores, portfolio showcases, and high-converting landing pages built with clean code and blazing fast loading speeds.',
      iconCodePoint: 0xe370, // Icons.laptop_mac_rounded
      accentColorValue: 0xFF38BDF8,
      imageUrl: 'assets/images/services/service_web_app_dev.jpg',
      subOfferings: [
        'Professional Business & Corporate Websites',
        'Full E-Commerce Stores with Payment Gateway',
        'Personal Portfolio & Freelancer Showcase',
        '100% Mobile Responsive & Fast Loading Speed',
        'Clean, Modern UI/UX Architecture',
      ],
      benefits: [
        '24/7 online storefront for your business',
        'Modern aesthetics designed to impress and convert visitors',
        'SSL secure, fast hosting, and clean code standards',
        'SEO-friendly structure for superior Google rank',
      ],
    ),
    const ServiceModel(
      id: 'app_dev',
      titleHindi: 'App Development',
      titleEnglish: 'Android & iOS Mobile Applications',
      shortDesc: 'Feature-rich, smooth, and scalable mobile apps for Android & iOS with robust cloud backends.',
      detailedDesc:
          'Cross-platform Flutter mobile applications delivering lightweight, fast, secure, and intuitive user experiences with real-time capabilities.',
      iconCodePoint: 0xe4a2, // Icons.phone_android_rounded
      accentColorValue: 0xFF8B5CF6,
      imageUrl: 'assets/images/services/service_app_dev.jpg',
      subOfferings: [
        'Custom Android & iOS Cross-Platform Apps',
        'Business Management & Customer Service Apps',
        'E-Commerce & Service Booking Mobile Applications',
        'Real-time Firebase Backend & Push Notifications',
        'Play Store & App Store Deployment Support',
      ],
      benefits: [
        'Direct channel to customers via their mobile screen',
        'Instant push notifications for offers and updates',
        'Offline capabilities and ultra-smooth UI animations',
        'Scalable and secure cloud infrastructure',
      ],
    ),
  ];

  // Default Showcase Projects (Real Live Vercel Projects & Case Studies)
  static final List<ProjectModel> defaultProjects = [
    const ProjectModel(
      id: 'p_school',
      title: 'School Management & Academia Portal',
      category: 'Web Application',
      shortDesc: 'Complete modern school management web app for student admissions, attendance, fees, exams, and teacher schedules.',
      detailedDesc:
          'An end-to-end educational management platform featuring interactive student profile records, real-time attendance analytics, automated fee management, exam grade reports, course scheduling, and teacher-parent communication dashboards.',
      techStack: ['React', 'Next.js', 'Node.js', 'PostgreSQL', 'Tailwind CSS', 'Vercel'],
      liveDemoUrl: 'https://school-management-system-xi-two-52.vercel.app/',
      imageUrl: 'assets/images/projects/project_school_management.jpg',
      keyFeatures: [
        'Student admissions & digital records management',
        'Real-time attendance & exam grade analytics',
        'Automated fee collection & receipt generation',
        'Teacher schedules & class analytics dashboard',
      ],
      resultsMetric: '100% Paperless School Management',
      isFeatured: true,
    ),
    const ProjectModel(
      id: 'p_ecommerce',
      title: 'Full-Stack E-Commerce & Order Store',
      category: 'E-Commerce',
      shortDesc: 'Ultra-fast online shopping store with dynamic product catalog, persistent cart, and instant order checkout.',
      detailedDesc:
          'High-conversion online shopping application featuring lightning-fast product filtering, responsive mobile-first UI, secure multi-gateway checkout, order confirmation, and real-time inventory management.',
      techStack: ['Next.js', 'React', 'Node.js', 'Stripe/Razorpay', 'Tailwind CSS', 'Vercel'],
      liveDemoUrl: 'https://e-commerse-flax-eight.vercel.app/',
      imageUrl: 'assets/images/projects/project_ecommerce_platform.jpg',
      keyFeatures: [
        'Instant product search & category filters',
        'Persistent cart & frictionless checkout funnel',
        'Responsive UI with order payment confirmation',
        'High-speed page load score 98+',
      ],
      resultsMetric: '3.2x Higher Sales Conversion',
      isFeatured: true,
    ),
    const ProjectModel(
      id: 'p_meta_ads',
      title: 'Local Business Lead Generation Engine',
      category: 'Meta Ads',
      shortDesc: 'Targeted Meta ads and automated WhatsApp funnel generating high-intent client inquiries.',
      detailedDesc:
          'Designed high-converting video and carousel ads targeting regional demographics. Integrated automated WhatsApp chat responses that qualify leads instantly within 60 seconds.',
      techStack: ['Meta Ads Manager', 'WhatsApp API', 'Canva Pro', 'Zapier Automation'],
      liveDemoUrl: 'https://manishdigital.in',
      imageUrl: 'assets/images/services/service_meta_ads.jpg',
      keyFeatures: [
        'Geo-targeted radius ads for target cities and surrounding regions',
        'Direct WhatsApp click-to-chat funnel',
        'Automated instant message response',
        'Continuous CPL reduction strategy',
      ],
      resultsMetric: '450+ Qualified Leads at ₹18/Lead',
      isFeatured: true,
    ),
    const ProjectModel(
      id: 'p_seo_gmb',
      title: 'Local SEO & Google Map Pack Domination',
      category: 'Local SEO & GMB',
      shortDesc: 'Optimized Google Business Profile and local keywords to rank in top 3 Google search results.',
      detailedDesc:
          'Conducted full on-page keyword optimization, technical site speed tuning, Google Map citations, local schema markup, and authentic review acquisition strategy.',
      techStack: ['Google Search Console', 'Google My Business', 'Ahrefs', 'Technical SEO'],
      liveDemoUrl: 'https://manishdigital.in',
      imageUrl: 'assets/images/services/service_seo_gmb.jpg',
      keyFeatures: [
        'Ranked #1 for local high-intent keyword searches',
        'Google Business Profile 100% verified & optimized',
        '300% boost in direct phone call clicks',
        'Clean metadata and JSON-LD schema',
      ],
      resultsMetric: 'Top 3 Google Rank & 3x Calls',
      isFeatured: true,
    ),
  ];

  // Default Why Work With Me (6 Value Pillars)
  static final List<WhyWorkModel> defaultWhyWorkList = [
    const WhyWorkModel(
      id: 'w1',
      title: 'User-Friendly Solutions',
      subtitleHindi: 'Intuitive and modern design that makes customer interaction seamless and enjoyable.',
      iconCodePoint: 0xe59c, // Icons.sentiment_very_satisfied_rounded
      colorValue: 0xFF6366F1,
    ),
    const WhyWorkModel(
      id: 'w2',
      title: 'Modern Technology',
      subtitleHindi: 'Built with cutting-edge frameworks (Flutter, Next.js, Firebase) for lightning speed and reliability.',
      iconCodePoint: 0xe0e9, // Icons.bolt_rounded
      colorValue: 0xFF38BDF8,
    ),
    const WhyWorkModel(
      id: 'w3',
      title: 'Responsive Design',
      subtitleHindi: 'Pixel-perfect responsiveness and flawless performance across mobile, tablet, and desktop screens.',
      iconCodePoint: 0xe1e0, // Icons.devices_rounded
      colorValue: 0xFF10B981,
    ),
    const WhyWorkModel(
      id: 'w4',
      title: 'Business-Focused Approach',
      subtitleHindi: 'Engineered for real business results, qualified leads, and measurable Return on Investment (ROI).',
      iconCodePoint: 0xe4b6, // Icons.pie_chart_outline_rounded
      colorValue: 0xFFF59E0B,
    ),
    const WhyWorkModel(
      id: 'w5',
      title: 'Fast Communication',
      subtitleHindi: 'Direct phone & WhatsApp support with prompt updates, clear milestones, and dedicated assistance.',
      iconCodePoint: 0xe3ce, // Icons.mark_chat_read_rounded
      colorValue: 0xFFEC4899,
    ),
    const WhyWorkModel(
      id: 'w6',
      title: 'Customized Solutions',
      subtitleHindi: 'Tailor-made packages and execution strategies aligned with your specific business goals.',
      iconCodePoint: 0xe0b1, // Icons.auto_awesome_rounded
      colorValue: 0xFF8B5CF6,
    ),
  ];
}
