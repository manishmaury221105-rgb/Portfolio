/**
 * DIGITAL MANISH PORTFOLIO - HIGH-PERFORMANCE JAVASCRIPT ENGINE
 * Ultra-lightweight, zero external dependencies, 60fps animations.
 * Features: Dark/Light Mode, Live Category Filtering, Details Modals,
 * IntersectionObserver Active Nav Tracking, and WhatsApp Form Processing.
 */

// ============================================================================
// 1. DATA SOURCES & CONFIGURATION
// ============================================================================

const ProfileData = {
  name: 'Digital Manish',
  phone: '9214468818',
  whatsappNumber: '9214468818',
  email: 'manishdigital99@gmail.com',
  website: 'https://digitalmanish.online',
  location: 'Varanasi, Uttar Pradesh, India',
  locationShort: 'Varanasi (UP)'
};

const ServicesData = [
  {
    id: 'gmb_setup',
    title: 'Google My Business & Map Ranking',
    subTitle: 'GMB Setup & Local 3-Pack SEO',
    shortDesc: 'Complete Google Business Profile setup, instant verification, local 3-Pack Map dominance, and 5-star review growth.',
    detailedDesc: 'Get your local business to rank #1 in Google Maps and local 3-Pack search results. We manage Google Business Profile (GBP) creation, verification, category optimization, local NAP citations, geo-tagged photos, and review campaigns.',
    accentColor: '#22c55e',
    imageUrl: 'assets/images/services/service_gmb_setup.jpg',
    icon: 'location',
    subOfferings: [
      'Google Business Profile (GBP) Setup & Verification',
      'Google Maps 3-Pack Local Ranking Optimization',
      'Local Citations & NAP Consistency Building',
      '5-Star Review Generation & Response Strategy',
      'Geo-Tagged Photos & Weekly Google Posts Management'
    ],
    benefits: [
      'Massive surge in direct customer phone calls & visits',
      'Dominate local competitors in your city or area',
      'Build unmatched local credibility & customer trust',
      '100% Google policy compliant verification process'
    ]
  },
  {
    id: 'meta_ads',
    title: 'Facebook & Instagram Advertising',
    subTitle: 'Meta Ads & Sponsored Campaigns',
    shortDesc: 'Run laser-targeted Facebook & Instagram campaigns to generate maximum qualified leads at optimal cost.',
    detailedDesc: 'Advanced demographic and interest-based targeting combined with custom retargeting funnels that deliver high-intent buyers directly into your WhatsApp or CRM.',
    accentColor: '#ec4899',
    imageUrl: 'assets/images/services/service_meta_ads.jpg',
    icon: 'campaign',
    subOfferings: [
      'Facebook Ads Campaign Setup & Management',
      'Instagram Reels & Feed Sponsored Ads',
      'Direct WhatsApp Message Lead Ads',
      'Retargeting & Lookalike Audience Building',
      'High-Converting Ad Copy & Creative Strategy'
    ],
    benefits: [
      'Optimized low Cost-Per-Lead (CPL)',
      'Direct customer conversations on WhatsApp',
      'Continuous A/B testing for maximum Return on Ad Spend (ROAS)',
      'Immediate customer engagement and conversions'
    ]
  },
  {
    id: 'google_ads',
    title: 'Google Search, Display & YouTube Ads',
    subTitle: 'Google Ads & PPC Campaigns',
    shortDesc: 'Position your business at the top of Google when high-intent customers search for your services.',
    detailedDesc: 'High-intent Google Search PPC Ads, Display Network Banners, and YouTube Video promotions specifically tailored to capture ready-to-buy customers.',
    accentColor: '#f59e0b',
    imageUrl: 'assets/images/services/service_google_ads.jpg',
    icon: 'ads_click',
    subOfferings: [
      'Google Search Pay-Per-Click (PPC) Ads',
      'High-Impact Display Network Banner Ads',
      'YouTube Video Advertisement Campaigns',
      'Call-Only Ads for Instant Direct Phone Inquiries',
      'Negative Keyword Optimization & Strict Budget Control'
    ],
    benefits: [
      'Instant direct phone calls and inquiries from Day 1',
      'Pay-Per-Click model ensuring budget efficiency',
      'Laser-targeted buyer intent traffic',
      'Precise geo-fencing for local and national campaigns'
    ]
  },
  {
    id: 'email_marketing',
    title: 'Email Marketing & Drip Automation',
    subTitle: 'Funnels & Retention Workflows',
    shortDesc: 'High-converting email sequences, newsletters, retention funnels, and automated drip workflows.',
    detailedDesc: 'Turn subscribers into high-ticket paying customers with automated email funnels, cold outreach sequences, weekly newsletters, and abandoned cart recovery workflows with 99% inbox deliverability.',
    accentColor: '#8b5cf6',
    imageUrl: 'assets/images/services/service_email_marketing.jpg',
    icon: 'mail',
    subOfferings: [
      'Automated Lead Nurturing & Drip Email Sequences',
      'High-Converting Sales Newsletters & Product Campaigns',
      'Responsive Mobile-Optimized Email Template Design',
      'Spam-Free High Deliverability & Domain Authentication',
      'Subscriber List Segmentation & Behaviour Tracking'
    ],
    benefits: [
      'Highest ROI digital marketing channel with repeat sales',
      'Automated recurring revenue from existing client list',
      'Build long-term customer relationships and brand loyalty',
      'Transparent analytics on open rates, clicks & conversions'
    ]
  },
  {
    id: 'chart_ads',
    title: 'Performance Chart & Conversion Ads',
    subTitle: 'Analytics & ROAS Scaling',
    shortDesc: 'Data-driven growth ads, real-time ROI chart analytics, conversion tracking funnels, and budget scaling.',
    detailedDesc: 'Laser-focused performance marketing backed by real-time conversion charts, deep analytics dashboards, multi-touch attribution, and algorithmic scaling to maximize Return On Ad Spend (ROAS).',
    accentColor: '#06b6d4',
    imageUrl: 'assets/images/services/service_chart_ads.jpg',
    icon: 'analytics',
    subOfferings: [
      'Data-Driven Performance Growth & Scaling Ads',
      'Real-Time ROI & Conversion Analytics Dashboards',
      'Google Analytics 4 & Server-Side Pixel Tracking',
      'Multi-Channel Attribution & Custom Conversion Funnels',
      'A/B Split Testing & Budget Optimization for Max ROAS'
    ],
    benefits: [
      'Crystal clear visibility into every rupee spent and earned',
      'Predictable customer acquisition cost (CAC) scaling',
      'Eliminate wasted ad spend with negative keyword filtering',
      'Comprehensive weekly performance chart reports'
    ]
  },
  {
    id: 'seo',
    title: 'SEO & Google Ranking',
    subTitle: 'Search Engine Optimization',
    shortDesc: 'Rank on Google Page 1 and generate sustainable organic traffic, map citations, and regular customer inquiries.',
    detailedDesc: 'Full-cycle Search Engine Optimization process covering on-page optimization, technical audits, Google Business Profile supremacy, and high-intent keyword strategies.',
    accentColor: '#10b981',
    imageUrl: 'assets/images/services/service_seo_ranking.jpg',
    icon: 'search',
    subOfferings: [
      'On-Page SEO & Content Optimization',
      'Technical SEO & Core Web Vitals Fixes',
      'High-Intent Keyword Research & Competitor Analysis',
      'Authority Backlink Building & Technical Audits',
      'Google Search Console & Analytics Setup'
    ],
    benefits: [
      'Sustainable organic Google traffic without ongoing ad spend',
      'Top rank on Google for high-value business keywords',
      'Long-term sustainable business growth & authority',
      'High search visibility & trustworthy brand reputation'
    ]
  },
  {
    id: 'digital_marketing',
    title: 'Digital Marketing & Growth',
    subTitle: 'Social Media & Brand Strategy',
    shortDesc: 'Drive continuous qualified leads, elevate brand awareness, and scale your online business presence.',
    detailedDesc: 'Comprehensive performance marketing strategies including social media marketing, targeted audience acquisition, brand positioning, and high-converting lead funnels to ensure your business dominates its market.',
    accentColor: '#6366f1',
    imageUrl: 'assets/images/services/service_digital_marketing.jpg',
    icon: 'trending_up',
    subOfferings: [
      'Social Media Marketing (SMM)',
      'High-Converting Lead Generation',
      'Online Business Promotion & Branding',
      'Audience Research & Growth Strategies',
      'Brand Awareness & Content Planning'
    ],
    benefits: [
      'High volume of genuine, qualified inquiries',
      'Enhanced brand credibility and online presence',
      'Laser-targeted local and national audience reach',
      'Transparent analytics and periodic performance reports'
    ]
  },
  {
    id: 'web_dev',
    title: 'Fast & Modern Responsive Websites',
    subTitle: 'Clean Code & High Conversion',
    shortDesc: 'Ultra-fast, responsive, modern websites and digital platforms optimized for conversions and search engines.',
    detailedDesc: 'Custom modern business websites, e-commerce stores, portfolio showcases, and high-converting landing pages built with clean code and blazing fast loading speeds.',
    accentColor: '#38bdf8',
    imageUrl: 'assets/images/services/service_web_app_dev.jpg',
    icon: 'laptop',
    subOfferings: [
      'Professional Business & Corporate Websites',
      'Full E-Commerce Stores with Payment Gateway',
      'Personal Portfolio & Freelancer Showcase',
      '100% Mobile Responsive & Fast Loading Speed',
      'Clean, Modern UI/UX Architecture'
    ],
    benefits: [
      '24/7 online storefront for your business',
      'Modern aesthetics designed to impress and convert visitors',
      'SSL secure, fast hosting, and clean code standards',
      'SEO-friendly structure for superior Google rank'
    ]
  },
  {
    id: 'app_dev',
    title: 'Android & iOS Mobile Applications',
    subTitle: 'Cross-Platform App Development',
    shortDesc: 'Feature-rich, smooth, and scalable mobile apps for Android & iOS with robust cloud backends.',
    detailedDesc: 'Cross-platform mobile applications delivering lightweight, fast, secure, and intuitive user experiences with real-time capabilities.',
    accentColor: '#8b5cf6',
    imageUrl: 'assets/images/services/service_app_dev.jpg',
    icon: 'phone',
    subOfferings: [
      'Custom Android & iOS Cross-Platform Apps',
      'Business Management & Customer Service Apps',
      'E-Commerce & Service Booking Mobile Applications',
      'Real-time Firebase Backend & Push Notifications',
      'Play Store & App Store Deployment Support'
    ],
    benefits: [
      'Direct channel to customers via their mobile screen',
      'Instant push notifications for offers and updates',
      'Offline capabilities and ultra-smooth UI animations',
      'Scalable and secure cloud infrastructure'
    ]
  }
];

const ProjectsData = [
  {
    id: 'p_school',
    title: 'School Management & Academia Portal',
    category: 'Website',
    shortDesc: 'Complete modern school management web app for student admissions, attendance, fees, exams, and teacher schedules.',
    detailedDesc: 'An end-to-end educational management platform featuring interactive student profile records, real-time attendance analytics, automated fee management, exam grade reports, course scheduling, and teacher-parent communication dashboards.',
    techStack: ['React', 'Next.js', 'Node.js', 'PostgreSQL', 'Tailwind CSS', 'Vercel'],
    liveDemoUrl: 'https://school-management-system-xi-two-52.vercel.app/',
    imageUrl: 'assets/images/projects/project_school_management.jpg',
    keyFeatures: [
      'Student admissions & digital records management',
      'Real-time attendance & exam grade analytics',
      'Automated fee collection & receipt generation',
      'Teacher schedules & class analytics dashboard'
    ],
    resultsMetric: '100% Paperless School Management'
  },
  {
    id: 'p_ecommerce',
    title: 'Full-Stack E-Commerce & Order Store',
    category: 'Website',
    shortDesc: 'Ultra-fast online shopping store with dynamic product catalog, persistent cart, and instant order checkout.',
    detailedDesc: 'High-conversion online shopping application featuring lightning-fast product filtering, responsive mobile-first UI, secure multi-gateway checkout, order confirmation, and real-time inventory management.',
    techStack: ['Next.js', 'React', 'Node.js', 'Stripe/Razorpay', 'Tailwind CSS', 'Vercel'],
    liveDemoUrl: 'https://e-commerse-flax-eight.vercel.app/',
    imageUrl: 'assets/images/projects/project_ecommerce_platform.jpg',
    keyFeatures: [
      'Instant product search & category filters',
      'Persistent cart & frictionless checkout funnel',
      'Responsive UI with order payment confirmation',
      'High-speed page load score 98+'
    ],
    resultsMetric: '3.2x Higher Sales Conversion'
  },
  {
    id: 'p_meta_ads',
    title: 'Local Business Lead Generation Engine',
    category: 'Meta Ads',
    shortDesc: 'Targeted Meta ads and automated WhatsApp funnel generating high-intent client inquiries.',
    detailedDesc: 'Designed high-converting video and carousel ads targeting regional demographics. Integrated automated WhatsApp chat responses that qualify leads instantly within 60 seconds.',
    techStack: ['Meta Ads Manager', 'WhatsApp API', 'Canva Pro', 'Zapier Automation'],
    liveDemoUrl: 'https://digitalmanish.online',
    imageUrl: 'assets/images/services/service_meta_ads.jpg',
    keyFeatures: [
      'Geo-targeted radius ads for target cities and surrounding regions',
      'Direct WhatsApp click-to-chat funnel',
      'Automated instant message response',
      'Continuous CPL reduction strategy'
    ],
    resultsMetric: '450+ Qualified Leads at ₹18/Lead'
  },
  {
    id: 'p_seo_gmb',
    title: 'Local SEO & Google Map Pack Domination',
    category: 'SEO',
    shortDesc: 'Optimized Google Business Profile and local keywords to rank in top 3 Google search results.',
    detailedDesc: 'Conducted full on-page keyword optimization, technical site speed tuning, Google Map citations, local schema markup, and authentic review acquisition strategy.',
    techStack: ['Google Search Console', 'Google My Business', 'Ahrefs', 'Technical SEO'],
    liveDemoUrl: 'https://digitalmanish.online',
    imageUrl: 'assets/images/services/service_seo_gmb.jpg',
    keyFeatures: [
      'Ranked #1 for local high-intent keyword searches',
      'Google Business Profile 100% verified & optimized',
      '300% boost in direct phone call clicks',
      'Clean metadata and JSON-LD schema'
    ],
    resultsMetric: 'Top 3 Google Rank & 3x Calls'
  }
];

const WhyWorkData = [
  {
    id: 'w1',
    title: 'User-Friendly Solutions',
    subtitle: 'Intuitive and modern design that makes customer interaction seamless and enjoyable.',
    color: '#6366f1',
    icon: 'sentiment',
    badge: 'Pillar 01',
    imageUrlWebp: 'assets/images/services/service_web_app_dev.webp',
    imageUrlJpg: 'assets/images/services/service_web_app_dev.jpg'
  },
  {
    id: 'w2',
    title: 'Modern Technology',
    subtitle: 'Built with cutting-edge frameworks (HTML5, Next.js, Firebase) for lightning speed and reliability.',
    color: '#38bdf8',
    icon: 'bolt',
    badge: 'Pillar 02',
    imageUrlWebp: 'assets/images/projects/project_school_management.webp',
    imageUrlJpg: 'assets/images/projects/project_school_management.jpg'
  },
  {
    id: 'w3',
    title: 'Responsive Design',
    subtitle: 'Pixel-perfect responsiveness and flawless performance across mobile, tablet, and desktop screens.',
    color: '#10b981',
    icon: 'devices',
    badge: 'Pillar 03',
    imageUrlWebp: 'assets/images/services/service_app_dev.webp',
    imageUrlJpg: 'assets/images/services/service_app_dev.jpg'
  },
  {
    id: 'w4',
    title: 'Business-Focused Approach',
    subtitle: 'Engineered for real business results, qualified leads, and measurable Return on Investment (ROI).',
    color: '#f59e0b',
    icon: 'chart',
    badge: 'Pillar 04',
    imageUrlWebp: 'assets/images/services/service_chart_ads.webp',
    imageUrlJpg: 'assets/images/services/service_chart_ads.jpg'
  },
  {
    id: 'w5',
    title: 'Fast Communication',
    subtitle: 'Direct phone & WhatsApp support with prompt updates, clear milestones, and dedicated assistance.',
    color: '#ec4899',
    icon: 'chat',
    badge: 'Pillar 05',
    imageUrlWebp: 'assets/images/services/service_email_marketing.webp',
    imageUrlJpg: 'assets/images/services/service_email_marketing.jpg'
  },
  {
    id: 'w6',
    title: 'Customized Solutions',
    subtitle: 'Tailor-made packages and execution strategies aligned with your specific business goals.',
    color: '#8b5cf6',
    icon: 'sparkles',
    badge: 'Pillar 06',
    imageUrlWebp: 'assets/images/services/service_digital_marketing.webp',
    imageUrlJpg: 'assets/images/services/service_digital_marketing.jpg'
  }
];

// SVG Icons
const SvgIcons = {
  location: '<svg viewBox="0 0 24 24"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>',
  campaign: '<svg viewBox="0 0 24 24"><path d="M18 11v2h4v-2h-4zm-2 6.61c.96.71 2.21 1.65 3.2 2.39.4-.53.8-1.07 1.2-1.6-.99-.74-2.24-1.68-3.2-2.4-.4.54-.8 1.08-1.2 1.61zM20.4 5.6c-.4-.53-.8-1.07-1.2-1.6-.99.74-2.24 1.68-3.2 2.4.4.53.8 1.07 1.2 1.6.96-.72 2.21-1.65 3.2-2.4zM4 9c-1.1 0-2 .9-2 2v2c0 1.1.9 2 2 2h1v4c0 .55.45 1 1 1h2c.55 0 1-.45 1-1v-4h2l5 3V6L9 9H4z"/></svg>',
  ads_click: '<svg viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.4z"/></svg>',
  mail: '<svg viewBox="0 0 24 24"><path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg>',
  analytics: '<svg viewBox="0 0 24 24"><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zM9 17H7v-7h2v7zm4 0h-2V7h2v10zm4 0h-2v-4h2v4z"/></svg>',
  search: '<svg viewBox="0 0 24 24"><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/></svg>',
  trending_up: '<svg viewBox="0 0 24 24"><path d="M16 6l2.29 2.29-4.88 4.88-4-4L2 16.59 3.41 18l6-6 4 4 6.3-6.29L22 12V6z"/></svg>',
  laptop: '<svg viewBox="0 0 24 24"><path d="M20 18c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2H4c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2H0v2h24v-2h-4zM4 6h16v10H4V6z"/></svg>',
  phone: '<svg viewBox="0 0 24 24"><path d="M17 1.01L7 1c-1.1 0-2 .9-2 2v18c0 1.1.9 2 2 2h10c1.1 0 2-.9 2-2V3c0-1.1-.9-1.99-2-1.99zM17 19H7V5h10v14z"/></svg>',
  whatsapp: '<svg viewBox="0 0 24 24"><path d="M12.04 2c-5.46 0-9.91 4.45-9.91 9.91 0 1.75.46 3.45 1.32 4.95L2.05 22l5.25-1.38c1.45.79 3.08 1.21 4.74 1.21 5.46 0 9.91-4.45 9.91-9.91 0-2.65-1.03-5.14-2.9-7.01A9.816 9.816 0 0 0 12.04 2m.01 1.67c2.2 0 4.26.86 5.82 2.42a8.225 8.225 0 0 1 2.41 5.83c0 4.54-3.7 8.24-8.24 8.24-1.48 0-2.93-.4-4.2-1.15l-.3-.18-3.12.82.83-3.04-.2-.31a8.196 8.196 0 0 1-1.26-4.38c0-4.54 3.7-8.24 8.24-8.24m4.52 11.66c-.25-.13-1.47-.72-1.7-.81-.23-.08-.39-.13-.56.13-.17.25-.64.81-.79.97-.14.17-.29.19-.54.06-.25-.13-1.06-.39-2.03-1.25-.75-.67-1.26-1.5-1.41-1.75-.15-.25-.02-.39.11-.51.11-.11.25-.29.37-.44.13-.15.17-.25.25-.42.08-.17.04-.31-.02-.44s-.56-1.35-.77-1.85c-.2-.48-.41-.42-.56-.43h-.48c-.17 0-.44.06-.67.31-.23.25-.88.86-.88 2.1 0 1.24.9 2.44 1.03 2.61.13.17 1.77 2.7 4.29 3.79.6.26 1.07.41 1.44.53.61.19 1.16.17 1.6.1.49-.07 1.47-.6 1.68-1.18.21-.58.21-1.07.15-1.18-.06-.1-.23-.17-.48-.29z"/></svg>',
  arrow_forward: '<svg viewBox="0 0 24 24"><path d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z"/></svg>',
  open_link: '<svg viewBox="0 0 24 24"><path d="M19 19H5V5h7V3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2v-7h-2v7zM14 3v2h3.59l-9.83 9.83 1.41 1.41L19 6.41V10h2V3h-7z"/></svg>',
  check: '<svg viewBox="0 0 24 24"><path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z"/></svg>',
  star: '<svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>',
  sentiment: '<svg viewBox="0 0 24 24"><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm3.5-9c.83 0 1.5-.67 1.5-1.5S16.33 8 15.5 8 14 8.67 14 9.5s.67 1.5 1.5 1.5zm-7 0c.83 0 1.5-.67 1.5-1.5S9.33 8 8.5 8 7 8.67 7 9.5 7.67 11 8.5 11zm3.5 6.5c2.33 0 4.31-1.46 5.11-3.5H6.89c.8 2.04 2.78 3.5 5.11 3.5z"/></svg>',
  bolt: '<svg viewBox="0 0 24 24"><path d="M11 21h-1l1-7H7.5c-.88 0-.33-.75-.31-.78C8.48 10.94 10.42 7.54 13 3h1l-1 7h3.5c.49 0 .56.33.47.51l-.07.15C12.96 17.55 11 21 11 21z"/></svg>',
  devices: '<svg viewBox="0 0 24 24"><path d="M4 6h18V4H4c-1.1 0-2 .9-2 2v11H0v3h14v-3H4V6zm19 2h-6c-.55 0-1 .45-1 1v10c0 .55.45 1 1 1h6c.55 0 1-.45 1-1V9c0-.55-.45-1-1-1zm-1 9h-4v-7h4v7z"/></svg>',
  chart: '<svg viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.4z"/></svg>',
  chat: '<svg viewBox="0 0 24 24"><path d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM6 9h12v2H6V9zm8 5H6v-2h8v2zm4-6H6V6h12v2z"/></svg>',
  sparkles: '<svg viewBox="0 0 24 24"><path d="M19 9l1.25-2.75L23 5l-2.75-1.25L19 1l-1.25 2.75L15 5l2.75 1.25L19 9zm-7.5.5L9 4 6.5 9.5 1 12l5.5 2.5L9 20l2.5-5.5L17 12l-5.5-2.5zM19 15l-1.25 2.75L15 19l2.75 1.25L19 23l1.25-2.75L23 19l-2.75-1.25L19 15z"/></svg>',
  sun: '<svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 7c-2.76 0-5 2.24-5 5s2.24 5 5 5 5-2.24 5-5-2.24-5-5-5zM2 13h2c.55 0 1-.45 1-1s-.45-1-1-1H2c-.55 0-1 .45-1 1s.45 1 1 1zm18 0h2c.55 0 1-.45 1-1s-.45-1-1-1h-2c-.55 0-1 .45-1 1s.45 1 1 1zM11 2v2c0 .55.45 1 1 1s1-.45 1-1V2c0-.55-.45-1-1-1s-1 .45-1 1zm0 18v2c0 .55.45 1 1 1s1-.45 1-1v-2c0-.55-.45-1-1-1s-1 .45-1 1zM5.99 4.58c-.39-.39-1.03-.39-1.41 0s-.39 1.03 0 1.41l1.06 1.06c.39.39 1.03.39 1.41 0s.39-1.03 0-1.41L5.99 4.58zm12.37 12.37c-.39-.39-1.03-.39-1.41 0s-.39 1.03 0 1.41l1.06 1.06c.39.39 1.03.39 1.41 0s.39-1.03 0-1.41l-1.06-1.06zm1.06-10.96c.39-.39.39-1.03 0-1.41s-1.03-.39-1.41 0l-1.06 1.06c-.39.39-.39 1.03 0 1.41s1.03.39 1.41 0l1.06-1.06zM7.05 18.36c.39-.39.39-1.03 0-1.41s-1.03-.39-1.41 0l-1.06 1.06c-.39.39-.39 1.03 0 1.41s1.03.39 1.41 0l1.06-1.06z"/></svg>',
  moon: '<svg viewBox="0 0 24 24" fill="currentColor"><path d="M12.3 2a10 10 0 0 0-.19 20 10.04 10.04 0 0 0 9.95-8.8 1 1 0 0 0-1.17-1.12 8 8 0 1 1-9.71-9.71 1 1 0 0 0-1.12-1.17c.75.26 1.54.55 2.24.8z"/></svg>'
};

// ============================================================================
// 2. STATE & INITIALIZATION
// ============================================================================

const AppState = {
  theme: localStorage.getItem('dm_theme') || 'dark',
  projectFilter: 'All'
};

function bootApp() {
  initTheme();
  initActivePageNav();
  initSmoothNavigation();
  initInteractiveAvatar();
  initYearText();
  renderServices();
  renderProjects();
  renderWhyWork();
  initContactForm();
  initModals();
  initScrollListeners();
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', bootApp);
} else {
  bootApp();
}

function initYearText() {
  const yearEl = document.getElementById('year-text');
  if (yearEl) {
    yearEl.textContent = new Date().getFullYear();
  }
}

// ============================================================================
// 3. THEME TOGGLE
// ============================================================================

function initTheme() {
  const isLightTheme = AppState.theme === 'light';
  document.documentElement.classList.toggle('light-theme', isLightTheme);
  document.body.classList.toggle('light-theme', isLightTheme);
  updateThemeIcon();

  const toggleBtn = document.getElementById('theme-toggle-btn');
  if (toggleBtn) {
    toggleBtn.addEventListener('click', () => {
      const isLight = document.body.classList.toggle('light-theme');
      document.documentElement.classList.toggle('light-theme', isLight);
      AppState.theme = isLight ? 'light' : 'dark';
      localStorage.setItem('dm_theme', AppState.theme);
      updateThemeIcon();
    });
  }
}

function updateThemeIcon() {
  const toggleBtn = document.getElementById('theme-toggle-btn');
  if (!toggleBtn) return;
  const isLight = document.body.classList.contains('light-theme');
  toggleBtn.innerHTML = isLight ? SvgIcons.moon : SvgIcons.sun;
  toggleBtn.setAttribute('title', isLight ? 'Switch to Dark Mode' : 'Switch to Light Mode');
}

// ============================================================================
// 4. MULTI-PAGE NAVIGATION & ACTIVE NAV INDICATOR
// ============================================================================

function initActivePageNav() {
  const currentPath = window.location.pathname.toLowerCase();
  let currentPage = 'home';
  if (currentPath.includes('services')) currentPage = 'services';
  else if (currentPath.includes('projects')) currentPage = 'projects';
  else if (currentPath.includes('why-work')) currentPage = 'why-work';
  else if (currentPath.includes('about')) currentPage = 'about';
  else if (currentPath.includes('contact')) currentPage = 'contact';

  document.querySelectorAll('.nav-pill, .mobile-nav-pill').forEach(pill => {
    const pageAttr = pill.getAttribute('data-page');
    if (pageAttr === currentPage) {
      pill.classList.add('active');
    } else if (pageAttr) {
      pill.classList.remove('active');
    }
  });
}

function initSmoothNavigation() {
  const navLinks = document.querySelectorAll('.nav-pill, .mobile-nav-pill, .footer-links a');
  
  navLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      const href = link.getAttribute('href');
      if (href && href.startsWith('#')) {
        const targetSection = document.querySelector(href);
        if (targetSection) {
          e.preventDefault();
          const navHeight = document.getElementById('navbar-header')?.offsetHeight || 72;
          const targetPosition = targetSection.getBoundingClientRect().top + window.scrollY - navHeight + 2;
          
          window.scrollTo({
            top: targetPosition,
            behavior: 'smooth'
          });
          
          history.pushState(null, null, href);
        }
      }
    });
  });

  // Track active section as user scrolls using IntersectionObserver only when multiple section[id] exist
  const sections = document.querySelectorAll('main > section[id]');
  if (sections.length > 1) {
    const observerOptions = {
      root: null,
      rootMargin: '-20% 0px -70% 0px',
      threshold: 0
    };

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const id = entry.target.getAttribute('id');
          updateActiveNav(id);
        }
      });
    }, observerOptions);

    sections.forEach(sec => observer.observe(sec));
  }
}

const PageSEOMap = {
  home: {
    title: 'Digital Manish | Best Digital Marketing Agency in Varanasi',
    description: 'Digital Manish: Premier Digital Marketing Agency in Varanasi. Expert Meta & Google Ads, Local GMB 3-Pack SEO, and fast Websites. Call +91 9214468818 today!'
  },
  services: {
    title: 'Digital Marketing & Web Services in Varanasi | Digital Manish',
    description: 'Explore ROI-driven digital services by Digital Manish in Varanasi: Meta Ads, Google PPC, GMB Map Ranking, SEO, Web & App Development. Get a free proposal!'
  },
  projects: {
    title: 'Client Projects & Case Studies Portfolio | Digital Manish',
    description: 'See live case studies: E-commerce stores, School management portals, ₹18/lead Meta ad campaigns & Google #1 local SEO ranking projects by Digital Manish.'
  },
  'why-work': {
    title: 'Why Choose Digital Manish | Trusted Digital Partner Varanasi',
    description: 'Discover why Varanasi businesses trust Digital Manish: Transparent ROI reporting, modern technology, direct WhatsApp support & tailored business growth.'
  },
  about: {
    title: 'About Digital Manish | Digital Growth Specialist in Varanasi',
    description: 'Meet Digital Manish, leading digital marketing strategist & developer in Varanasi (UP), driving business growth through modern tech, SEO and ads.'
  },
  contact: {
    title: 'Contact Digital Manish | Free Consultation in Varanasi',
    description: 'Ready to scale your business? Contact Digital Manish for a free 1-on-1 strategy consultation. Direct WhatsApp: +91 9214468818 or submit your project inquiry.'
  }
};

function updatePageSEO(pageKey) {
  const seo = PageSEOMap[pageKey];
  if (!seo) return;

  document.title = seo.title;

  const descMeta = document.querySelector('meta[name="description"]');
  if (descMeta) descMeta.setAttribute('content', seo.description);

  const ogTitle = document.querySelector('meta[property="og:title"]');
  if (ogTitle) ogTitle.setAttribute('content', seo.title);

  const ogDesc = document.querySelector('meta[property="og:description"]');
  if (ogDesc) ogDesc.setAttribute('content', seo.description);
}

function updateActiveNav(activeId) {
  // If we are on a multi-page site, only switch active pill if an in-page anchor matches
  const matchingPill = document.querySelector(`.nav-pill[href="#${activeId}"], .mobile-nav-pill[href="#${activeId}"]`);
  if (matchingPill) {
    document.querySelectorAll('.nav-pill, .mobile-nav-pill').forEach(pill => {
      pill.classList.remove('active');
    });
    matchingPill.classList.add('active');
  }
}

// ============================================================================
// ============================================================================
// 5. RENDER SERVICES
// ============================================================================

function renderServices() {
  const container = document.getElementById('services-grid-container');
  if (!container || container.children.length > 0) return;

  container.innerHTML = ServicesData.map(s => {
    const iconSvg = SvgIcons[s.icon] || SvgIcons.location;
    const webpUrl = s.imageUrl.replace(/\.(jpg|png)$/, '.webp');

    return `
      <div class="service-card" style="--service-color: ${s.accentColor};" onclick="openServiceModal('${s.id}')">
        <div class="service-image-box">
          <picture>
            <source srcset="${webpUrl}" type="image/webp">
            <img src="${s.imageUrl}" alt="${s.title}" width="400" height="240" loading="lazy">
          </picture>
          <div class="service-image-overlay"></div>
          <div class="service-icon-floating">${iconSvg}</div>
        </div>
        <div class="service-body">
          <h3 class="service-title-hindi">${s.title}</h3>
          <span class="service-title-english">${s.subTitle}</span>
          <p class="service-desc">${s.shortDesc}</p>
          <div class="service-actions-row">
            <span class="btn-service-details">View Details ${SvgIcons.arrow_forward}</span>
            <button type="button" class="btn-service-whatsapp" onclick="event.stopPropagation(); inquireServiceWhatsApp('${s.id}')" title="Inquire on WhatsApp" aria-label="WhatsApp Inquiry">
              ${SvgIcons.whatsapp}
            </button>
          </div>
        </div>
      </div>
    `;
  }).join('');
}

// ============================================================================
// 6. RENDER PROJECTS & FILTERING
// ============================================================================

function renderProjects() {
  const container = document.getElementById('projects-grid-container');
  if (!container) return;

  const filterCards = () => {
    const cards = container.querySelectorAll('.project-card');
    cards.forEach(card => {
      const cat = card.getAttribute('data-category') || '';
      if (AppState.projectFilter === 'All' || cat.toLowerCase().includes(AppState.projectFilter.toLowerCase())) {
        card.style.display = '';
      } else {
        card.style.display = 'none';
      }
    });
  };

  document.querySelectorAll('.project-filter-btn').forEach(btn => {
    btn.onclick = () => {
      document.querySelectorAll('.project-filter-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      AppState.projectFilter = btn.getAttribute('data-category');
      filterCards();
    };
  });
}

// ============================================================================
// 7. RENDER WHY WORK PILLARS
// ============================================================================

function renderWhyWork() {
  const containers = document.querySelectorAll('.why-grid-container');
  if (!containers.length) return;

  containers.forEach(container => {
    if (container.children.length > 0) return;
    container.innerHTML = WhyWorkData.map(w => {
      const iconSvg = SvgIcons[w.icon] || SvgIcons.sparkles;

      return `
        <div class="why-card" style="--card-accent: ${w.color};">
          <div class="why-card-image-box">
            <picture>
              <source srcset="${w.imageUrlWebp}" type="image/webp">
              <img src="${w.imageUrlJpg}" alt="${w.title}" loading="lazy" width="400" height="200">
            </picture>
            <div class="why-card-image-overlay"></div>
            <div class="why-card-icon-floating" style="background: ${w.color};">
              ${iconSvg}
            </div>
            <span class="why-card-badge-floating">${w.badge}</span>
          </div>
          <div class="why-card-body">
            <h3 class="why-title">${w.title}</h3>
            <p class="why-desc">${w.subtitle}</p>
          </div>
        </div>
      `;
    }).join('');
  });
}

// ============================================================================
// 8. MODAL DIALOGS
// ============================================================================

function initModals() {
  document.querySelectorAll('.modal-close-btn').forEach(btn => {
    btn.onclick = closeAllModals;
  });

  window.addEventListener('click', (e) => {
    if (e.target.classList.contains('modal-overlay')) {
      closeAllModals();
    }
  });

  window.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
      closeAllModals();
    }
  });
}

let originalDocumentPageTitle = '';

function closeAllModals() {
  document.querySelectorAll('.modal-overlay').forEach(m => m.classList.remove('active'));
  document.body.style.overflow = '';
  if (originalDocumentPageTitle) {
    document.title = originalDocumentPageTitle;
    originalDocumentPageTitle = '';
  }
}

function openServiceModal(serviceId) {
  const s = ServicesData.find(item => item.id === serviceId);
  if (!s) return;
  const modal = document.getElementById('service-modal');
  const modalContent = document.getElementById('service-modal-content');
  if (!modal || !modalContent) {
    window.location.href = 'services.html';
    return;
  }

  if (!originalDocumentPageTitle) originalDocumentPageTitle = document.title;
  document.title = `${s.title} | Digital Manish Varanasi`;
  const iconSvg = SvgIcons[s.icon] || SvgIcons.location;

  const subOfferingsHtml = s.subOfferings.map(sub => `
    <li>
      <span class="check-icon">${SvgIcons.check}</span>
      <span>${sub}</span>
    </li>
  `).join('');

  const benefitsHtml = s.benefits.map(b => `
    <li>
      <span class="star-icon">${SvgIcons.star}</span>
      <span>${b}</span>
    </li>
  `).join('');

  modalContent.innerHTML = `
    <div class="modal-banner">
      <picture>
        <source srcset="${s.imageUrl.replace(/\.(jpg|png)$/, '.webp')}" type="image/webp">
        <img src="${s.imageUrl}" alt="${s.title}" loading="lazy">
      </picture>
      <div class="modal-banner-gradient"></div>
    </div>
    <div class="modal-header-info" style="--modal-color: ${s.accentColor};">
      <div class="modal-icon-badge">${iconSvg}</div>
      <div class="modal-title-wrap">
        <h3 id="service-modal-title">${s.title}</h3>
        <p>${s.subTitle}</p>
      </div>
    </div>
    <div class="modal-body" style="--modal-color: ${s.accentColor};">
      <p class="modal-desc-full">${s.detailedDesc}</p>

      <h4 class="modal-section-title">Included Services & Capabilities</h4>
      <ul class="modal-checklist">${subOfferingsHtml}</ul>

      <h4 class="modal-section-title">Key Business Benefits</h4>
      <ul class="modal-checklist">${benefitsHtml}</ul>

      <div class="modal-action-row">
        <button type="button" class="btn-modal-cta" onclick="inquireServiceWhatsApp('${s.id}')">
          ${SvgIcons.whatsapp} Book Free Consultation on WhatsApp
        </button>
      </div>
    </div>
  `;

  modal.classList.add('active');
  document.body.style.overflow = 'hidden';
}

function openProjectModal(projectId) {
  const p = ProjectsData.find(item => item.id === projectId);
  if (!p) return;
  const modal = document.getElementById('project-modal');
  const modalContent = document.getElementById('project-modal-content');
  if (!modal || !modalContent) {
    window.location.href = 'projects.html';
    return;
  }

  if (!originalDocumentPageTitle) originalDocumentPageTitle = document.title;
  document.title = `${p.title} | Digital Manish Projects`;

  const featuresHtml = p.keyFeatures.map(feat => `
    <li>
      <span class="check-icon">${SvgIcons.check}</span>
      <span>${feat}</span>
    </li>
  `).join('');

  const techStackHtml = p.techStack.map(tech => `
    <span class="tech-tag" style="font-size: 0.85rem; padding: 6px 12px;">${tech}</span>
  `).join('');

  modalContent.innerHTML = `
    <div class="modal-banner">
      <picture>
        <source srcset="${p.imageUrl.replace(/\.(jpg|png)$/, '.webp')}" type="image/webp">
        <img src="${p.imageUrl}" alt="${p.title}" loading="lazy">
      </picture>
      <div class="modal-banner-gradient"></div>
    </div>
    <div class="modal-header-info">
      <div class="modal-title-wrap">
        <h3 id="project-modal-title">${p.title}</h3>
        <div style="display: flex; gap: 8px; margin-top: 6px;">
          <span class="project-tag-pill" style="position: static;">${p.category}</span>
          ${p.resultsMetric ? `<span class="project-metric-pill" style="position: static;">${p.resultsMetric}</span>` : ''}
        </div>
      </div>
    </div>
    <div class="modal-body">
      <p class="modal-desc-full">${p.detailedDesc}</p>

      <h4 class="modal-section-title">Key Architectural Features</h4>
      <ul class="modal-checklist">${featuresHtml}</ul>

      <h4 class="modal-section-title">Technology Stack</h4>
      <div style="display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 24px;">${techStackHtml}</div>

      <div class="modal-action-row">
        ${p.liveDemoUrl ? `
          <a href="${p.liveDemoUrl}" target="_blank" rel="noopener" class="btn-modal-cta" style="background: var(--primary);">
            ${SvgIcons.open_link} Open Live Website Demo
          </a>
        ` : ''}
        <button type="button" class="btn-modal-cta" style="background: var(--whatsapp);" onclick="inquireProjectWhatsApp('${p.id}')">
          ${SvgIcons.whatsapp} Discuss Similar Project
        </button>
      </div>
    </div>
  `;

  modal.classList.add('active');
  document.body.style.overflow = 'hidden';
}

// ============================================================================
// 9. WHATSAPP INQUIRY GENERATORS
// ============================================================================

function inquireServiceWhatsApp(serviceId) {
  const s = ServicesData.find(item => item.id === serviceId);
  const serviceName = s ? s.title : 'Digital Marketing';
  const text = `Hello Manish! I visited your website DigitalManish.online and would like to discuss your "${serviceName}" service for my business.`;
  const url = `https://wa.me/91${ProfileData.whatsappNumber}?text=${encodeURIComponent(text)}`;
  window.open(url, '_blank');
}

function inquireProjectWhatsApp(projectId) {
  const p = ProjectsData.find(item => item.id === projectId);
  const projectName = p ? p.title : 'Project';
  const text = `Hello Manish! I visited DigitalManish.online and checked your "${projectName}" project. I would like to build a similar solution for my business.`;
  const url = `https://wa.me/91${ProfileData.whatsappNumber}?text=${encodeURIComponent(text)}`;
  window.open(url, '_blank');
}

// ============================================================================
// 10. CONTACT FORM HANDLER
// ============================================================================

function initContactForm() {
  const form = document.getElementById('project-contact-form');
  if (!form) return;

  form.addEventListener('submit', (e) => {
    e.preventDefault();

    const name = document.getElementById('form-name')?.value.trim() || '';
    const phone = document.getElementById('form-phone')?.value.trim() || '';
    const email = document.getElementById('form-email')?.value.trim() || '';
    const service = document.getElementById('form-service')?.value || '';
    const message = document.getElementById('form-message')?.value.trim() || '';

    const cleanPhone = phone.replace(/\D/g, '');
    if (!name || cleanPhone.length < 10 || !message) {
      alert('Please fill out all required fields with a valid 10-digit phone number.');
      return;
    }

    const whatsappMessage = `*Hello Digital Manish, New Project Enquiry from DigitalManish.online:*
👤 *Name:* ${name}
📞 *Phone:* ${phone}
📧 *Email:* ${email || 'Not provided'}
🎯 *Service Needed:* ${service}
💬 *Message:* ${message}`;

    const url = `https://wa.me/91${ProfileData.whatsappNumber}?text=${encodeURIComponent(whatsappMessage)}`;
    window.open(url, '_blank');
    form.reset();
  });
}

// ============================================================================
// 11. SCROLL & FLOATING BUTTON CONTROLLER
// ============================================================================

function initScrollListeners() {
  const scrollTopBtn = document.getElementById('scroll-top-btn');
  const floatingWhatsApp = document.getElementById('floating-whatsapp');
  const footer = document.querySelector('.footer');

  let ticking = false;

  window.addEventListener('scroll', () => {
    if (!ticking) {
      window.requestAnimationFrame(() => {
        const scrollY = window.scrollY;

        if (scrollTopBtn) {
          if (scrollY > 350) {
            scrollTopBtn.classList.add('visible');
          } else {
            scrollTopBtn.classList.remove('visible');
          }
        }

        if (floatingWhatsApp && footer) {
          const footerRect = footer.getBoundingClientRect();
          if (footerRect.top <= window.innerHeight - 50) {
            floatingWhatsApp.classList.add('hidden-footer');
          } else {
            floatingWhatsApp.classList.remove('hidden-footer');
          }
        }

        ticking = false;
      });
      ticking = true;
    }
  }, { passive: true });

  if (scrollTopBtn) {
    scrollTopBtn.onclick = () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    };
  }
}

// ============================================================================
// 12. INTERACTIVE AVATAR - AMBIENT PROFESSIONAL MOTION & LIGHT COLOR SHIFT
// ============================================================================

const AVATAR_COLOR_THEMES = [
  { id: '0', name: 'Executive Azure & Ice' },
  { id: '1', name: 'Subtle Sage & Pearl' },
  { id: '2', name: 'Modern Lavender & Indigo' },
  { id: '3', name: 'Soft Champagne & Gold' },
  { id: '4', name: 'Nordic Silver & Frost' },
  { id: '5', name: 'Royal Slate & Light Cobalt' },
  { id: '6', name: 'Clean Sky & Soft Cyan' }
];

let currentAvatarThemeIdx = 0;
let lastAvatarTouchTime = 0;

function cycleAvatarTheme() {
  const avatarWrapper = document.getElementById('hero-avatar-wrapper');
  const avatarCard = document.getElementById('hero-avatar-card');

  currentAvatarThemeIdx = (currentAvatarThemeIdx + 1) % AVATAR_COLOR_THEMES.length;
  const theme = AVATAR_COLOR_THEMES[currentAvatarThemeIdx];

  if (avatarWrapper) avatarWrapper.setAttribute('data-color-theme', theme.id);
  if (avatarCard) {
    avatarCard.setAttribute('data-color-theme', theme.id);
    avatarCard.classList.remove('theme-pop');
    void avatarCard.offsetWidth; // Force reflow
    avatarCard.classList.add('theme-pop');
  }

  if (typeof navigator !== 'undefined' && navigator.vibrate) {
    try {
      navigator.vibrate(30);
    } catch (err) {
      // Ignored
    }
  }
}

function initInteractiveAvatar() {
  const avatarWrapper = document.getElementById('hero-avatar-wrapper');
  const avatarCard = document.getElementById('hero-avatar-card');
  const heroSection = document.getElementById('home');

  if (!avatarCard && !avatarWrapper) return;

  function handleTrigger(e) {
    const now = Date.now();
    if (now - lastAvatarTouchTime < 180) return;
    lastAvatarTouchTime = now;
    cycleAvatarTheme();
  }

  // Touch and click on the avatar wrapper & card
  if (avatarWrapper) {
    avatarWrapper.addEventListener('click', handleTrigger);
    avatarWrapper.addEventListener('touchend', (e) => {
      handleTrigger(e);
    }, { passive: true });
  }

  // Keyboard accessibility (Enter / Space on avatar)
  if (avatarCard) {
    avatarCard.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        handleTrigger(e);
      }
    });
  }

  // Tap anywhere on the hero section background (excluding links/buttons/inputs)
  if (heroSection) {
    heroSection.addEventListener('click', (e) => {
      if (e.target.closest('a, button, input, select, textarea, .nav-pill, .mobile-nav-pill')) {
        return;
      }
      handleTrigger(e);
    });
  }
}

// Global window bindings for inline HTML handlers
window.openServiceModal = openServiceModal;
window.openProjectModal = openProjectModal;
window.inquireServiceWhatsApp = inquireServiceWhatsApp;
window.inquireProjectWhatsApp = inquireProjectWhatsApp;
window.closeAllModals = closeAllModals;
window.cycleAvatarTheme = cycleAvatarTheme;
