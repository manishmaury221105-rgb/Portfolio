import '../models/profile_config_model.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../models/why_work_model.dart';

class PortfolioData {
  static const ProfileConfigModel defaultConfig = ProfileConfigModel();

  // 6 Core Default Services
  static final List<ServiceModel> defaultServices = [
    const ServiceModel(
      id: 'digital_marketing',
      titleHindi: 'Digital Marketing',
      titleEnglish: 'Digital Marketing & Growth',
      shortDesc: 'Drive continuous qualified leads, elevate brand awareness, and scale your online business presence.',
      detailedDesc:
          'Comprehensive performance marketing strategies including social media marketing, targeted audience acquisition, brand positioning, and high-converting lead funnels to ensure your business dominates its market.',
      iconCodePoint: 0xf0174, // Icons.trending_up_rounded
      accentColorValue: 0xFF6366F1,
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
      id: 'meta_ads',
      titleHindi: 'Meta Ads',
      titleEnglish: 'Facebook & Instagram Advertising',
      shortDesc: 'Run laser-targeted Facebook & Instagram campaigns to generate maximum qualified leads at optimal cost.',
      detailedDesc:
          'Advanced demographic and interest-based targeting combined with custom retargeting funnels that deliver high-intent buyers directly into your WhatsApp or CRM.',
      iconCodePoint: 0xe133, // Icons.campaign_rounded
      accentColorValue: 0xFFEC4899,
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
      id: 'seo',
      titleHindi: 'Search Engine Optimization (SEO)',
      titleEnglish: 'SEO & Google Ranking',
      shortDesc: 'Rank on Google Page 1 and generate sustainable organic traffic, map citations, and regular customer inquiries.',
      detailedDesc:
          'Full-cycle Search Engine Optimization process covering on-page optimization, technical audits, Google Business Profile (Map Pack) supremacy, and high-intent keyword strategies.',
      iconCodePoint: 0xe567, // Icons.search_rounded
      accentColorValue: 0xFF10B981,
      subOfferings: [
        'On-Page SEO & Content Optimization',
        'Technical SEO & Core Web Vitals Fixes',
        'Local SEO & Google Business Profile (Map Pack)',
        'High-Intent Keyword Research & Competitor Analysis',
        'Google Search Console & Analytics Setup',
      ],
      benefits: [
        'Sustainable organic Google traffic without ongoing ad spend',
        'Local map pack dominance in target cities and regions',
        'Long-term sustainable business growth & authority',
        'High search visibility & trustworthy brand reputation',
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
      id: 'web_dev',
      titleHindi: 'Website Development',
      titleEnglish: 'Fast & Modern Responsive Websites',
      shortDesc: 'Ultra-fast, responsive, modern websites and digital platforms optimized for conversions and search engines.',
      detailedDesc:
          'Custom modern business websites, e-commerce stores, portfolio showcases, and high-converting landing pages built with clean code and blazing fast loading speeds.',
      iconCodePoint: 0xe370, // Icons.laptop_mac_rounded
      accentColorValue: 0xFF38BDF8,
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

  // Default Showcase Projects
  static final List<ProjectModel> defaultProjects = [
    const ProjectModel(
      id: 'p1',
      title: 'E-Commerce Store & Order Management',
      category: 'Website',
      shortDesc: 'Modern shopping web app with cart, online payments, live order tracking, and inventory management.',
      detailedDesc:
          'A complete digital store built with responsive UI, instant product search, category filters, multi-gateway checkout, and real-time order status tracking with automated WhatsApp notifications.',
      techStack: ['React', 'Next.js', 'Node.js', 'Firebase', 'Tailwind/CSS'],
      liveDemoUrl: 'https://ecommerce-store-demo.vercel.app',
      imageUrl: 'https://images.unsplash.com/photo-1557821552-17105176677c?w=800&auto=format&fit=crop&q=60',
      keyFeatures: [
        'Fast product catalog with instant search',
        'Cart & wishlist persistence',
        'Secure multi-gateway payment integration',
        'Inventory management architecture',
      ],
      resultsMetric: '2.4x Conversion Increase',
      isFeatured: true,
    ),
    const ProjectModel(
      id: 'p2',
      title: 'Local Business Lead Generation Engine',
      category: 'Meta Ads',
      shortDesc: 'Targeted Meta ads and automated WhatsApp funnel generating high-intent client inquiries.',
      detailedDesc:
          'Designed high-converting video and carousel ads targeting regional demographics. Integrated automated WhatsApp chat responses that qualify leads instantly within 60 seconds.',
      techStack: ['Meta Ads Manager', 'WhatsApp API', 'Canva Pro', 'Zapier Automation'],
      liveDemoUrl: '',
      imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=800&auto=format&fit=crop&q=60',
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
      id: 'p3',
      title: 'Service & Booking Mobile App',
      category: 'App',
      shortDesc: 'Cross-platform Flutter application for booking local services with real-time slots and customer reviews.',
      detailedDesc:
          'A smooth, responsive Flutter mobile app with dark/light themes, Google Sign-in, slot reservation calendar, push notifications, and customer rating system.',
      techStack: ['Flutter', 'Dart', 'Firebase Auth', 'Cloud Firestore', 'Cloud Functions'],
      liveDemoUrl: 'https://github.com',
      imageUrl: 'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=800&auto=format&fit=crop&q=60',
      keyFeatures: [
        'Interactive slot booking calendar',
        'Push notifications for appointment reminders',
        'Customer reviews & star ratings',
        'User profile and order history',
      ],
      resultsMetric: '4.8 Star Rating & 1.2k+ Users',
      isFeatured: true,
    ),
    const ProjectModel(
      id: 'p4',
      title: 'Local SEO & Google Map Pack Domination',
      category: 'SEO',
      shortDesc: 'Optimized Google Business Profile and local keywords to rank in top 3 Google search results.',
      detailedDesc:
          'Conducted full on-page keyword optimization, technical site speed tuning, Google Map citations, local schema markup, and authentic review acquisition strategy.',
      techStack: ['Google Search Console', 'Google My Business', 'Ahrefs', 'Technical SEO'],
      liveDemoUrl: '',
      imageUrl: 'https://images.unsplash.com/photo-1562577309-4932fdd64cd1?w=800&auto=format&fit=crop&q=60',
      keyFeatures: [
        'Ranked #1 for local high-intent keyword searches',
        'Google Business Profile 100% verified & optimized',
        '300% boost in direct phone call clicks',
        'Clean metadata and JSON-LD schema',
      ],
      resultsMetric: 'Top 3 Google Rank & 3x Calls',
      isFeatured: true,
    ),
    const ProjectModel(
      id: 'p5',
      title: 'Real Estate & Property Showcase Portal',
      category: 'Website',
      shortDesc: 'Elegant property listing portal with virtual tour embeds, dynamic filters, and direct agent chat.',
      detailedDesc:
          'High-performance property catalog featuring interactive location maps, image galleries, EMI calculators, and instant WhatsApp inquiry connectors.',
      techStack: ['Next.js', 'React', 'Node.js', 'Google Maps API', 'Vercel'],
      liveDemoUrl: 'https://property-demo.vercel.app',
      imageUrl: 'https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=800&auto=format&fit=crop&q=60',
      keyFeatures: [
        'Location & price range dynamic filtering',
        'Property image galleries with lightbox',
        'Instant WhatsApp chat with property consultant',
        'Mobile-first responsive speed score 95+',
      ],
      resultsMetric: '150+ Direct Property Enquiries',
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
