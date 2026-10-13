/**
 * DIGITAL MANISH PORTFOLIO - CORE JAVASCRIPT ENGINE
 * Full features: Dark/Light Theme, Tri-lingual Engine (English, Hindi, Hinglish),
 * Tab Navigation & Hash Routing, Project Filtering, Interactive Modals,
 * WhatsApp Form Processing, and Smooth Micro-interactions.
 */

// ============================================================================
// 1. DATA SOURCES & CONFIGURATION
// ============================================================================

const ProfileData = {
  name: 'Digital Manish',
  tagline: 'Best Digital Marketing Agency in Varanasi | Web & App Development',
  phone: '9214468818',
  whatsappNumber: '9214468818',
  email: 'manishdigital99@gmail.com',
  location: 'Varanasi, Uttar Pradesh, India',
  locationShort: 'Varanasi (UP)',
  avatarUrl: 'assets/images/digital_manish_logo_circle.png',
  logoUrl: 'assets/images/digital_manish_logo.png',
  mapsEmbedQuery: 'Varanasi, Uttar Pradesh, India',
  youtubeUrl: 'https://www.youtube.com/@DigitalManish-s8i',
  instagramUrl: 'https://www.instagram.com/digitalmanish.online/',
  facebookUrl: 'https://www.facebook.com/share/1HR3JDm7oZ/',
  linkedinUrl: 'https://linkedin.com',
  githubUrl: 'https://github.com'
};

const ServicesData = [
  {
    id: 'gmb_setup',
    titleHindi: 'GMB Setup',
    titleEnglish: 'Google My Business & Map Ranking',
    titleHinglish: 'Google My Business & Map Ranking',
    shortDesc: 'Complete Google Business Profile setup, instant verification, local 3-Pack Map dominance, and 5-star review growth.',
    shortDescHindi: 'गूगल बिजनेस प्रोफाइल सेटअप, इंस्टेंट वेरिफिकेशन, लोकल मैप्स 3-पैक रैंकिंग और 5-स्टार रिव्यूज में बढ़ोतरी।',
    detailedDesc: 'Get your local business to rank #1 in Google Maps and local 3-Pack search results. We manage Google Business Profile (GBP) creation, verification, category optimization, local NAP citations, geo-tagged photos, and review campaigns.',
    detailedDescHindi: 'अपने स्थानीय व्यवसाय को Google Maps और लोकल 3-Pack सर्च परिणामों में #1 पर लाएँ। हम GBP क्रिएशन, वेरिफिकेशन, कैटेगरी ऑप्टिमाइज़ेशन, लोकल साइटेशन्स और रिव्यू कैंपेन को पूरी तरह से संभालते हैं।',
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
    titleHindi: 'Meta Ads',
    titleEnglish: 'Facebook & Instagram Advertising',
    titleHinglish: 'Facebook & Instagram Sponsored Ads',
    shortDesc: 'Run laser-targeted Facebook & Instagram campaigns to generate maximum qualified leads at optimal cost.',
    shortDescHindi: 'फेसबुक और इंस्टाग्राम पर लेज़र-टार्गेटेड विज्ञापन चलाकर न्यूनतम लागत पर अधिक से अधिक क्वालिफाइड लीड्स प्राप्त करें।',
    detailedDesc: 'Advanced demographic and interest-based targeting combined with custom retargeting funnels that deliver high-intent buyers directly into your WhatsApp or CRM.',
    detailedDescHindi: 'एडवांस्ड डेमोग्राफिक और इंटरेस्ट टार्गेटिंग के साथ कस्टम री-टार्गेटिंग फनल जो हाई-इंटेंट बायर्स को सीधे आपके व्हाट्सएप या सीआरएम में डिलीवर करते हैं।',
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
    titleHindi: 'Google Ads (PPC)',
    titleEnglish: 'Google Search, Display & YouTube Ads',
    titleHinglish: 'Google Search, Display & Video PPC Ads',
    shortDesc: 'Position your business at the top of Google when high-intent customers search for your services.',
    shortDescHindi: 'जब ग्राहक आपकी सेवाओं की खोज करें, तब अपने बिजनेस को Google के शीर्ष पर प्रदर्शित करें।',
    detailedDesc: 'High-intent Google Search PPC Ads, Display Network Banners, and YouTube Video promotions specifically tailored to capture ready-to-buy customers.',
    detailedDescHindi: 'हाई-इंटेंट गूगल सर्च पीपीसी एड्स, डिस्प्ले बैनर्स और यूट्यूब वीडियो प्रमोशन्स जो विशेष रूप से खरीदारी के लिए तैयार ग्राहकों को आकर्षित करते हैं।',
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
    titleHindi: 'Email Marketing',
    titleEnglish: 'Email Marketing & Drip Automation',
    titleHinglish: 'Email Marketing & Retention Funnels',
    shortDesc: 'High-converting email sequences, newsletters, retention funnels, and automated drip workflows.',
    shortDescHindi: 'उच्च-रूपांतरण ईमेल सीक्वेंसेस, न्यूज़लेटर्स, रिटेंशन फ़नल्स और ऑटोमेटेड ड्रिप वर्कफ़्लोज़।',
    detailedDesc: 'Turn subscribers into high-ticket paying customers with automated email funnels, cold outreach sequences, weekly newsletters, and abandoned cart recovery workflows with 99% inbox deliverability.',
    detailedDescHindi: 'ऑटोमेटेड ईमेल फ़नल्स और 99% इनबॉक्स डिलीवरेबिलिटी के साथ सब्सक्राइबर्स को हाई-वैल्यू पेइंग कस्टमर्स में बदलें।',
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
    titleHindi: 'Chart Ads',
    titleEnglish: 'Performance Chart & Conversion Ads',
    titleHinglish: 'Analytics & ROI Driven Ads',
    shortDesc: 'Data-driven growth ads, real-time ROI chart analytics, conversion tracking funnels, and budget scaling.',
    shortDescHindi: 'डेटा-ड्रिवेन ग्रोथ एड्स, रियल-टाइम आरओआई चार्ट एनालिटिक्स और कन्वर्जन ट्रैकिंग फ़नल्स।',
    detailedDesc: 'Laser-focused performance marketing backed by real-time conversion charts, deep analytics dashboards, multi-touch attribution, and algorithmic scaling to maximize Return On Ad Spend (ROAS).',
    detailedDescHindi: 'रियल-टाइम कन्वर्जन चार्ट्स और डीप एनालिटिक्स डैशबोर्ड्स द्वारा समर्थित लेज़र-फ़ोकस्ड परफॉर्मेंस मार्केटिंग।',
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
    titleHindi: 'Search Engine Optimization (SEO)',
    titleEnglish: 'SEO & Google Ranking',
    titleHinglish: 'SEO & Organic Google Growth',
    shortDesc: 'Rank on Google Page 1 and generate sustainable organic traffic, map citations, and regular customer inquiries.',
    shortDescHindi: 'Google के पेज 1 पर रैंक करें और स्थायी ऑर्गेनिक ट्रैफ़िक व नियमित कस्टमर इनक्वायरी प्राप्त करें।',
    detailedDesc: 'Full-cycle Search Engine Optimization process covering on-page optimization, technical audits, Google Business Profile supremacy, and high-intent keyword strategies.',
    detailedDescHindi: 'ऑन-पेज ऑप्टिमाइज़ेशन, टेक्निकल ऑडिट्स, बैकलिंक्स और हाई-इंटेंट कीवर्ड रणनीतियों को कवर करने वाली सम्पूर्ण SEO प्रक्रिया।',
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
    titleHindi: 'Digital Marketing',
    titleEnglish: 'Digital Marketing & Growth',
    titleHinglish: 'Full-Funnel Digital Marketing',
    shortDesc: 'Drive continuous qualified leads, elevate brand awareness, and scale your online business presence.',
    shortDescHindi: 'लगातार योग्य लीड्स आकर्षित करें, ब्रांड जागरूकता बढ़ाएं और ऑनलाइन बिजनेस को स्केल करें।',
    detailedDesc: 'Comprehensive performance marketing strategies including social media marketing, targeted audience acquisition, brand positioning, and high-converting lead funnels to ensure your business dominates its market.',
    detailedDescHindi: 'सोशल मीडिया मार्केटिंग, टार्गेटेड ऑडियंस एक्विजिशन और हाई-कन्वर्जन लीड फ़नल्स सहित सम्पूर्ण डिजिटल मार्केटिंग रणनीति।',
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
    titleHindi: 'Website Development',
    titleEnglish: 'Fast & Modern Responsive Websites',
    titleHinglish: 'Modern Responsive Websites',
    shortDesc: 'Ultra-fast, responsive, modern websites and digital platforms optimized for conversions and search engines.',
    shortDescHindi: 'अल्ट्रा-फास्ट, रिस्पॉन्सिव और आधुनिक वेबसाइटें जो कन्वर्जन और सर्च इंजन के लिए अनुकूलित हैं।',
    detailedDesc: 'Custom modern business websites, e-commerce stores, portfolio showcases, and high-converting landing pages built with clean code and blazing fast loading speeds.',
    detailedDescHindi: 'कस्टम मॉडर्न बिज़नेस वेबसाइट्स, ई-कॉमर्स स्टोर्स और हाई-कन्वर्टिंग लैंडिंग पेज जो क्लीन कोड और बिजली जैसी तेज़ स्पीड से तैयार किए जाते हैं।',
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
    titleHindi: 'App Development',
    titleEnglish: 'Android & iOS Mobile Applications',
    titleHinglish: 'Cross-Platform Mobile Apps',
    shortDesc: 'Feature-rich, smooth, and scalable mobile apps for Android & iOS with robust cloud backends.',
    shortDescHindi: 'मजबूत क्लाउड बैकएंड के साथ एंड्रॉइड और आईओएस के लिए सुगम और स्केलेबल मोबाइल ऐप्स।',
    detailedDesc: 'Cross-platform mobile applications delivering lightweight, fast, secure, and intuitive user experiences with real-time capabilities.',
    detailedDescHindi: 'क्रॉस-प्लेटफ़ॉर्म मोबाइल ऐप्स जो सुरक्षित, तेज़ और रियल-टाइम क्षमताओं के साथ सहज यूज़र अनुभव प्रदान करते हैं।',
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
    liveDemoUrl: 'https://manishdigital.in',
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
    liveDemoUrl: 'https://manishdigital.in',
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
    titleHindi: 'यूज़र-फ्रेंडली समाधान',
    subtitle: 'Intuitive and modern design that makes customer interaction seamless and enjoyable.',
    subtitleHindi: 'सहज और आधुनिक डिज़ाइन जो ग्राहक बातचीत को आसान और सुखद बनाता है।',
    color: '#6366f1',
    icon: 'sentiment'
  },
  {
    id: 'w2',
    title: 'Modern Technology',
    titleHindi: 'आधुनिक टेक्नोलॉजी',
    subtitle: 'Built with cutting-edge frameworks (HTML5, Next.js, Firebase) for lightning speed and reliability.',
    subtitleHindi: 'बिजली जैसी स्पीड और विश्वसनीयता के लिए नवीनतम तकनीकों से निर्मित।',
    color: '#38bdf8',
    icon: 'bolt'
  },
  {
    id: 'w3',
    title: 'Responsive Design',
    titleHindi: '100% रिस्पॉन्सिव डिज़ाइन',
    subtitle: 'Pixel-perfect responsiveness and flawless performance across mobile, tablet, and desktop screens.',
    subtitleHindi: 'मोबाइल, टैबलेट और डेस्कटॉप स्क्रीन पर पिक्सेल-परफेक्ट रिस्पॉन्सिवनेस।',
    color: '#10b981',
    icon: 'devices'
  },
  {
    id: 'w4',
    title: 'Business-Focused Approach',
    titleHindi: 'बिज़नेस-ओरिएंटेड विज़न',
    subtitle: 'Engineered for real business results, qualified leads, and measurable Return on Investment (ROI).',
    subtitleHindi: 'वास्तविक व्यावसायिक परिणामों, योग्य लीड्स और मापन योग्य ROI के लिए निर्मित।',
    color: '#f59e0b',
    icon: 'chart'
  },
  {
    id: 'w5',
    title: 'Fast Communication',
    titleHindi: 'त्वरित और सीधी बातचीत',
    subtitle: 'Direct phone & WhatsApp support with prompt updates, clear milestones, and dedicated assistance.',
    subtitleHindi: 'त्वरित अपडेट, स्पष्ट मील के पत्थर और समर्पित सहायता के साथ सीधा फोन व व्हाट्सएप सपोर्ट।',
    color: '#ec4899',
    icon: 'chat'
  },
  {
    id: 'w6',
    title: 'Customized Solutions',
    titleHindi: 'अनुकूलित समाधान',
    subtitle: 'Tailor-made packages and execution strategies aligned with your specific business goals.',
    subtitleHindi: 'आपके विशिष्ट व्यावसायिक लक्ष्यों के अनुरूप कस्टम पैकेज और निष्पादन रणनीतियाँ।',
    color: '#8b5cf6',
    icon: 'sparkles'
  }
];

// ============================================================================
// 2. SVG ICONS REPOSITORY
// ============================================================================

const SvgIcons = {
  home: '<svg viewBox="0 0 24 24"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/></svg>',
  about: '<svg viewBox="0 0 24 24"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>',
  services: '<svg viewBox="0 0 24 24"><path d="M19.14 12.94c.04-.3.06-.61.06-.94 0-.32-.02-.64-.07-.94l2.03-1.58c.18-.14.23-.41.12-.61l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.05.3-.09.63-.09.94s.02.64.07.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.01-1.58zM12 15.6c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z"/></svg>',
  projects: '<svg viewBox="0 0 24 24"><path d="M13.13 2.51c.2-.2.53-.22.75-.04l2.84 2.37c.23.19.26.53.07.75l-4.25 5.09-2.91-2.42 3.5-5.75zm-6.8 14.88c-.19-.24-.16-.59.08-.78l7.24-6.05 2.91 2.42-7.46 6.23c-.23.2-.58.18-.77-.06l-2-1.76zm12.3-8.8l-1.42-1.18 1.42-1.42 1.41 1.42-1.41 1.18zm-14.85 9.38l2.83 2.36-4.61.68 1.78-3.04z"/></svg>',
  contact: '<svg viewBox="0 0 24 24"><path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg>',
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
  close: '<svg viewBox="0 0 24 24"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/></svg>',
  sun: '<svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 7c-2.76 0-5 2.24-5 5s2.24 5 5 5 5-2.24 5-5-2.24-5-5-5zM2 13h2c.55 0 1-.45 1-1s-.45-1-1-1H2c-.55 0-1 .45-1 1s.45 1 1 1zm18 0h2c.55 0 1-.45 1-1s-.45-1-1-1h-2c-.55 0-1 .45-1 1s.45 1 1 1zM11 2v2c0 .55.45 1 1 1s1-.45 1-1V2c0-.55-.45-1-1-1s-1 .45-1 1zm0 18v2c0 .55.45 1 1 1s1-.45 1-1v-2c0-.55-.45-1-1-1s-1 .45-1 1zM5.99 4.58c-.39-.39-1.03-.39-1.41 0s-.39 1.03 0 1.41l1.06 1.06c.39.39 1.03.39 1.41 0s.39-1.03 0-1.41L5.99 4.58zm12.37 12.37c-.39-.39-1.03-.39-1.41 0s-.39 1.03 0 1.41l1.06 1.06c.39.39 1.03.39 1.41 0s.39-1.03 0-1.41l-1.06-1.06zm1.06-10.96c.39-.39.39-1.03 0-1.41s-1.03-.39-1.41 0l-1.06 1.06c-.39.39-.39 1.03 0 1.41s1.03.39 1.41 0l1.06-1.06zM7.05 18.36c.39-.39.39-1.03 0-1.41s-1.03-.39-1.41 0l-1.06 1.06c-.39.39-.39 1.03 0 1.41s1.03.39 1.41 0l1.06-1.06z"/></svg>',
  moon: '<svg viewBox="0 0 24 24" fill="currentColor"><path d="M12.3 2a10 10 0 0 0-.19 20 10.04 10.04 0 0 0 9.95-8.8 1 1 0 0 0-1.17-1.12 8 8 0 1 1-9.71-9.71 1 1 0 0 0-1.12-1.17c.75.26 1.54.55 2.24.8z"/></svg>'
};

// ============================================================================
// 3. MULTILINGUAL TRANSLATION ENGINE
// ============================================================================

const Translations = {
  english: {
    navHome: 'Home',
    navAbout: 'About',
    navServices: 'Services',
    navProjects: 'Projects',
    navContact: 'Contact',
    heroTagline: 'Best Digital Marketing Agency in Varanasi | Web & App Development',
    heroSubtitle: 'I am Digital Manish, the Best Digital Marketing Agency in Varanasi and Full-Stack Web & Mobile App Developer. I help businesses scale online through high-converting Meta & Google Ads campaigns, result-driven SEO, modern responsive websites, custom mobile applications, and high-performance digital solutions.',
    btnExploreServices: 'Explore All Services',
    btnChatWhatsApp: 'Chat on WhatsApp',
    badgeRating: '⭐️ 5.0 Star Client Rating',
    badgeLocation: '📍 Varanasi & Pan-India',
    badgeRoi: '🚀 100% ROI Focused',
    whyWorkBadge: 'WHY CHOOSE DIGITAL MANISH',
    whyWorkHeading: 'Why Work With Digital Manish?',
    whyWorkSubtitle: 'A dedicated, transparent, and results-focused digital growth partner for your business.',
    ctaReadyTitle: 'Ready to grow your business online?',
    ctaReadySubtitle: 'Connect today on WhatsApp or call directly for a free consultation and project roadmap.',
    servicesBadge: 'SPECIALIZED SERVICES',
    servicesHeading: 'My Specialized Services',
    servicesSubtitle: 'Comprehensive digital solutions engineered to scale your business with modern technology and results-oriented marketing.',
    btnViewDetails: 'View Details',
    projectsBadge: 'PORTFOLIO SHOWCASE',
    projectsHeading: 'Featured Projects Showcase',
    projectsSubtitle: 'High-impact digital marketing campaigns, modern responsive websites, and dynamic cross-platform mobile apps.',
    filterAll: '🎯 All',
    filterWebsites: '💻 Websites',
    filterApps: '📱 Apps',
    filterMetaAds: '📢 Meta Ads',
    filterSeo: '🔍 SEO',
    aboutBadge: 'ABOUT ME',
    aboutHeading: 'About Digital Manish',
    aboutSubtitle: 'Best Digital Marketing Agency in Varanasi',
    aboutBio: 'Hello! I am Digital Manish from Varanasi (UP), India, leading the Best Digital Marketing Agency in Varanasi. My mission is to empower businesses, local enterprises, and digital entrepreneurs with a commanding online presence. I specialize in ROI-driven Digital Marketing, Google & Meta Ads, targeted SEO strategies, and scalable Web & App Development. Delivering highest-grade quality on schedule is always my top priority.',
    aboutMissionTitle: 'My Core Mission & Vision',
    aboutMission: 'Delivering customized digital blueprints, ROI-driven growth campaigns, and scalable digital execution for every business.',
    skillsHeading: 'Key Technical & Strategic Skills',
    statExperience: '3+ Years',
    statExpLabel: 'Experience',
    statProjects: '50+ Done',
    statProjLabel: 'Projects',
    statClients: '98% Happy',
    statClientLabel: 'Clients',
    contactBadge: 'GET IN TOUCH',
    contactHeading: "Let's Discuss Your Next Big Project",
    contactSubtitle: 'Get a customized proposal and strategic guidance tailored to your business requirements.',
    directCall: 'Direct Phone Call',
    chatWhatsAppTitle: 'WhatsApp Chat',
    emailTitle: 'Email Address',
    locationTitle: 'Office & City',
    quickInquiryTitle: 'Send a Quick Project Inquiry',
    formNameLabel: 'Your Name *',
    formPhoneLabel: 'Phone / WhatsApp *',
    formEmailLabel: 'Email (Optional)',
    formServiceLabel: 'Service Needed *',
    formMessageLabel: 'Project Requirements *',
    formSubmitBtn: 'Send Inquiry via WhatsApp',
    footerQuickLinks: 'Quick Links',
    footerCopyright: 'Digital Manish. All rights reserved.',
    floatingWhatsAppText: '🚀 Ready to grow your business? Chat on WhatsApp now!'
  },
  hindi: {
    navHome: 'होम',
    navAbout: 'परिचय',
    navServices: 'सेवाएँ',
    navProjects: 'प्रोजेक्ट्स',
    navContact: 'संपर्क',
    heroTagline: 'वाराणसी की सर्वश्रेष्ठ डिजिटल मार्केटिंग एजेंसी | वेब और ऐप डेवलपमेंट',
    heroSubtitle: 'मैं हूँ डिजिटल मनीष, वाराणसी में सर्वश्रेष्ठ डिजिटल मार्केटिंग एजेंसी एवं फुल-स्टैक वेब और मोबाइल ऐप डेवलपर। हम व्यवसायों को हाई-कन्वर्जन मेटा व गूगल एड्स, परिणाम-उन्मुख SEO, आधुनिक उत्तरदायी वेबसाइट्स और कस्टम मोबाइल ऐप्स के माध्यम से तेज़ी से आगे बढ़ाते हैं।',
    btnExploreServices: 'सभी सेवाएँ देखें',
    btnChatWhatsApp: 'व्हाट्सएप पर चैट करें',
    badgeRating: '⭐️ 5.0 स्टार क्लाइंट रेटिंग',
    badgeLocation: '📍 वाराणसी और सम्पूर्ण भारत',
    badgeRoi: '🚀 100% परिणाम उन्मुख',
    whyWorkBadge: 'डिजिटल मनीष ही क्यों?',
    whyWorkHeading: 'डिजिटल मनीष के साथ काम क्यों करें?',
    whyWorkSubtitle: 'आपके व्यवसाय के लिए एक समर्पित, पारदर्शी और परिणाम-केंद्रित डिजिटल विकास साझेदार।',
    ctaReadyTitle: 'क्या आप अपने व्यवसाय को ऑनलाइन बढ़ाना चाहते हैं?',
    ctaReadySubtitle: 'मुफ्त परामर्श और प्रोजेक्ट रोडमैप के लिए आज ही व्हाट्सएप पर जुड़ें या सीधे कॉल करें।',
    servicesBadge: 'हमारी विशेष सेवाएँ',
    servicesHeading: 'मेरी विशेष डिजिटल सेवाएँ',
    servicesSubtitle: 'आधुनिक तकनीक और परिणाम-उन्मुख मार्केटिंग के साथ आपके व्यवसाय को बढ़ाने के लिए डिज़ाइन किए गए व्यापक समाधान।',
    btnViewDetails: 'विस्तार से देखें',
    projectsBadge: 'प्रोजेक्ट्स शोकेस',
    projectsHeading: 'विशेष प्रोजेक्ट्स का प्रदर्शन',
    projectsSubtitle: 'उच्च-प्रभाव डिजिटल मार्केटिंग अभियान, आधुनिक उत्तरदायी वेबसाइट्स और डायनेमिक मोबाइल ऐप्स।',
    filterAll: '🎯 सभी',
    filterWebsites: '💻 वेबसाइट्स',
    filterApps: '📱 ऐप्स',
    filterMetaAds: '📢 मेटा एड्स',
    filterSeo: '🔍 SEO',
    aboutBadge: 'मेरे बारे में',
    aboutHeading: 'डिजिटल मनीष के बारे में',
    aboutSubtitle: 'वाराणसी की सर्वश्रेष्ठ डिजिटल मार्केटिंग एजेंसी',
    aboutBio: 'नमस्ते! मैं वाराणसी (उत्तर प्रदेश) से डिजिटल मनीष हूँ। मेरा मिशन व्यवसायों, स्थानीय उद्यमों और स्टार्टअप्स को एक सशक्त ऑनलाइन पहचान दिलाना है। मैं उच्च ROI डिजिटल मार्केटिंग, Google व Meta Ads, लक्षित SEO रणनीतियों और स्केलेबल वेब व मोबाइल ऐप डेवलपमेंट में माहिर हूँ।',
    aboutMissionTitle: 'हमारा मुख्य मिशन व दृष्टि',
    aboutMission: 'प्रत्येक व्यवसाय के लिए अनुकूलित डिजिटल खाका, ROI-संचालित विकास अभियान और विश्वसनीय निष्पादन प्रदान करना।',
    skillsHeading: 'प्रमुख तकनीकी एवं रणनीतिक कौशल',
    statExperience: '3+ वर्ष',
    statExpLabel: 'अनुभव',
    statProjects: '50+ पूर्ण',
    statProjLabel: 'प्रोजेक्ट्स',
    statClients: '98% संतुष्ट',
    statClientLabel: 'ग्राहक',
    contactBadge: 'संपर्क करें',
    contactHeading: 'आइए आपके अगले बड़े प्रोजेक्ट पर चर्चा करें',
    contactSubtitle: 'अपनी व्यावसायिक आवश्यकताओं के अनुरूप व्यक्तिगत प्रस्ताव और रणनीतिक मार्गदर्शन प्राप्त करें।',
    directCall: 'सीधा फोन कॉल',
    chatWhatsAppTitle: 'व्हाट्सएप चैट',
    emailTitle: 'ईमेल पता',
    locationTitle: 'स्थान / शहर',
    quickInquiryTitle: 'तुरंत प्रोजेक्ट संबंधी पूछताछ भेजें',
    formNameLabel: 'आपका नाम *',
    formPhoneLabel: 'फोन / व्हाट्सएप नंबर *',
    formEmailLabel: 'ईमेल पता (वैकल्पिक)',
    formServiceLabel: 'वांछित सेवा *',
    formMessageLabel: 'प्रोजेक्ट विवरण *',
    formSubmitBtn: 'व्हाट्सएप द्वारा पूछताछ भेजें',
    footerQuickLinks: 'त्वरित लिंक',
    footerCopyright: 'डिजिटल मनीष। सर्वाधिकार सुरक्षित।',
    floatingWhatsAppText: '🚀 बिज़नेस बढ़ाना चाहते हैं? अभी व्हाट्सएप पर चैट करें!'
  },
  hinglish: {
    navHome: 'Home',
    navAbout: 'About',
    navServices: 'Services',
    navProjects: 'Projects',
    navContact: 'Contact',
    heroTagline: 'Best Digital Marketing Agency in Varanasi | Web & App Development',
    heroSubtitle: 'Mai Digital Manish hoon, Varanasi ki Best Digital Marketing Agency aur Full-Stack Web & Mobile App Developer. Hum businesses ko high-converting Meta & Google Ads, result-driven SEO aur fast responsive websites se scale karne me help karte hain.',
    btnExploreServices: 'All Services Dekhein',
    btnChatWhatsApp: 'WhatsApp Par Chat Karein',
    badgeRating: '⭐️ 5.0 Star Client Rating',
    badgeLocation: '📍 Varanasi & Pan-India',
    badgeRoi: '🚀 100% ROI Focused',
    whyWorkBadge: 'WHY WORK WITH DIGITAL MANISH',
    whyWorkHeading: 'Digital Manish Ke Sath Kyun Kaam Karein?',
    whyWorkSubtitle: 'Aapke business ke liye ek dedicated aur result-driven digital growth partner.',
    ctaReadyTitle: 'Kya aap business grow karna chahte hain?',
    ctaReadySubtitle: 'Free consultation ke liye abhi WhatsApp par connect karein ya direct call karein.',
    servicesBadge: 'SPECIALIZED SERVICES',
    servicesHeading: 'Hamari Specialized Services',
    servicesSubtitle: 'Comprehensive digital solutions engineered to scale your business with modern marketing.',
    btnViewDetails: 'View Details',
    projectsBadge: 'SHOWCASE PROJECTS',
    projectsHeading: 'Featured Live Projects',
    projectsSubtitle: 'High-impact digital marketing campaigns, responsive websites aur mobile apps.',
    filterAll: '🎯 All',
    filterWebsites: '💻 Websites',
    filterApps: '📱 Apps',
    filterMetaAds: '📢 Meta Ads',
    filterSeo: '🔍 SEO',
    aboutBadge: 'ABOUT ME',
    aboutHeading: 'About Digital Manish',
    aboutSubtitle: 'Best Digital Marketing Agency in Varanasi',
    aboutBio: 'Hello! Mai Varanasi (UP) se Digital Manish hoon. Mera mission har business aur startup ko commanding online presence aur regular quality customer leads provide karna hai. ROI-driven marketing aur clean modern websites hamari specialty hai.',
    aboutMissionTitle: 'Core Mission & Vision',
    aboutMission: 'Delivering customized digital blueprints and scalable execution for every business.',
    skillsHeading: 'Key Skills & Expertise',
    statExperience: '3+ Years',
    statExpLabel: 'Experience',
    statProjects: '50+ Done',
    statProjLabel: 'Projects',
    statClients: '98% Happy',
    statClientLabel: 'Clients',
    contactBadge: 'GET IN TOUCH',
    contactHeading: "Let's Discuss Your Next Big Project",
    contactSubtitle: 'Apne business ke requirements ke hisaab se custom roadmap aur guidance paayein.',
    directCall: 'Direct Phone Call',
    chatWhatsAppTitle: 'WhatsApp Chat',
    emailTitle: 'Email Address',
    locationTitle: 'Office & Location',
    quickInquiryTitle: 'Quick Project Inquiry Send Karein',
    formNameLabel: 'Aapka Name *',
    formPhoneLabel: 'Phone / WhatsApp *',
    formEmailLabel: 'Email (Optional)',
    formServiceLabel: 'Service Needed *',
    formMessageLabel: 'Project Details *',
    formSubmitBtn: 'Send Inquiry via WhatsApp',
    footerQuickLinks: 'Quick Links',
    footerCopyright: 'Digital Manish. All rights reserved.',
    floatingWhatsAppText: '🚀 Business grow karna hai? Chat on WhatsApp now!'
  }
};

// ============================================================================
// 4. APPLICATION STATE & CONTROLLER
// ============================================================================

const AppState = {
  theme: localStorage.getItem('dm_theme') || 'dark',
  lang: 'english',
  activeTab: 'home',
  projectFilter: 'All'
};

document.addEventListener('DOMContentLoaded', () => {
  initTheme();
  initLanguage();
  initNavigation();
  renderServices();
  renderProjects();
  renderWhyWork();
  initContactForm();
  initModals();
  initScrollListeners();
});

// ============================================================================
// 5. THEME SWITCHING (DARK / LIGHT)
// ============================================================================

function initTheme() {
  if (AppState.theme === 'light') {
    document.body.classList.add('light-theme');
  } else {
    document.body.classList.remove('light-theme');
  }
  updateThemeIcon();

  const toggleBtn = document.getElementById('theme-toggle-btn');
  if (toggleBtn) {
    toggleBtn.addEventListener('click', () => {
      if (document.body.classList.contains('light-theme')) {
        document.body.classList.remove('light-theme');
        AppState.theme = 'dark';
      } else {
        document.body.classList.add('light-theme');
        AppState.theme = 'light';
      }
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
// 6. LANGUAGE SELECTION ENGINE
// ============================================================================

function initLanguage() {
  updateLanguageUI();

  document.querySelectorAll('.lang-btn').forEach(btn => {
    btn.addEventListener('click', (e) => {
      const selectedLang = e.currentTarget.getAttribute('data-lang');
      if (selectedLang && Translations[selectedLang]) {
        AppState.lang = selectedLang;
        localStorage.setItem('dm_lang', selectedLang);
        updateLanguageUI();
        renderServices();
        renderProjects();
        renderWhyWork();
      }
    });
  });
}

function updateLanguageUI() {
  // Update active button state
  document.querySelectorAll('.lang-btn').forEach(btn => {
    if (btn.getAttribute('data-lang') === AppState.lang) {
      btn.classList.add('active');
    } else {
      btn.classList.remove('active');
    }
  });

  const t = Translations[AppState.lang];

  // Update static localized elements by data-i18n attribute
  document.querySelectorAll('[data-i18n]').forEach(el => {
    const key = el.getAttribute('data-i18n');
    if (t[key]) {
      el.textContent = t[key];
    }
  });
}

// ============================================================================
// 7. TAB & PAGE NAVIGATION (MULTI-VIEW / SPA ROUTING)
// ============================================================================

function initNavigation() {
  // Sync with current hash on load if present
  const hash = window.location.hash.replace('#', '');
  if (hash && ['home', 'about', 'services', 'projects', 'contact'].includes(hash)) {
    setActiveTab(hash, false);
  } else {
    setActiveTab('home', false);
  }

  // Handle nav clicks
  document.querySelectorAll('[data-nav-target]').forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      const target = link.getAttribute('data-nav-target');
      if (target) {
        setActiveTab(target, true);
      }
    });
  });

  // Handle hash changes
  window.addEventListener('hashchange', () => {
    const currentHash = window.location.hash.replace('#', '');
    if (currentHash && currentHash !== AppState.activeTab) {
      setActiveTab(currentHash, false);
    }
  });
}

function setActiveTab(tabKey, updateHash = true) {
  AppState.activeTab = tabKey;
  if (updateHash) {
    window.location.hash = tabKey;
  }

  // Update navigation pill classes
  document.querySelectorAll('.nav-pill, .mobile-nav-pill').forEach(pill => {
    if (pill.getAttribute('data-nav-target') === tabKey) {
      pill.classList.add('active');
    } else {
      pill.classList.remove('active');
    }
  });

  // Toggle page view sections
  document.querySelectorAll('.page-view').forEach(view => {
    if (view.id === `view-${tabKey}`) {
      view.style.display = 'block';
    } else {
      view.style.display = 'none';
    }
  });

  // Scroll to top on view change
  window.scrollTo({ top: 0, behavior: 'smooth' });
}

// ============================================================================
// 8. RENDER SERVICES
// ============================================================================

function renderServices() {
  const container = document.getElementById('services-grid-container');
  const homeContainer = document.getElementById('home-services-grid');
  if (!container && !homeContainer) return;

  const t = Translations[AppState.lang];

  const html = ServicesData.map(s => {
    const title = AppState.lang === 'hindi' ? s.titleHindi : (AppState.lang === 'english' ? s.titleEnglish : s.titleHinglish);
    const subTitle = s.titleEnglish;
    const shortDesc = (AppState.lang === 'hindi' && s.shortDescHindi) ? s.shortDescHindi : s.shortDesc;
    const iconSvg = SvgIcons[s.icon] || SvgIcons.services;

    return `
      <div class="service-card" style="--service-color: ${s.accentColor};" onclick="openServiceModal('${s.id}')">
        <div class="service-image-box">
          <img src="${s.imageUrl}" alt="${title}" loading="lazy">
          <div class="service-image-overlay"></div>
          <div class="service-icon-floating">${iconSvg}</div>
        </div>
        <div class="service-body">
          <h3 class="service-title-hindi">${title}</h3>
          <span class="service-title-english">${subTitle}</span>
          <p class="service-desc">${shortDesc}</p>
          <div class="service-actions-row">
            <span class="btn-service-details">${t.btnViewDetails} ${SvgIcons.arrow_forward}</span>
            <button type="button" class="btn-service-whatsapp" onclick="event.stopPropagation(); inquireServiceWhatsApp('${s.id}')" title="Inquire on WhatsApp">
              ${SvgIcons.whatsapp}
            </button>
          </div>
        </div>
      </div>
    `;
  }).join('');

  if (container) container.innerHTML = html;
  // On home page, render top 6 services
  if (homeContainer) {
    const homeHtml = ServicesData.slice(0, 6).map(s => {
      const title = AppState.lang === 'hindi' ? s.titleHindi : (AppState.lang === 'english' ? s.titleEnglish : s.titleHinglish);
      const subTitle = s.titleEnglish;
      const shortDesc = (AppState.lang === 'hindi' && s.shortDescHindi) ? s.shortDescHindi : s.shortDesc;
      const iconSvg = SvgIcons[s.icon] || SvgIcons.services;

      return `
        <div class="service-card" style="--service-color: ${s.accentColor};" onclick="openServiceModal('${s.id}')">
          <div class="service-image-box">
            <img src="${s.imageUrl}" alt="${title}" loading="lazy">
            <div class="service-image-overlay"></div>
            <div class="service-icon-floating">${iconSvg}</div>
          </div>
          <div class="service-body">
            <h3 class="service-title-hindi">${title}</h3>
            <span class="service-title-english">${subTitle}</span>
            <p class="service-desc">${shortDesc}</p>
            <div class="service-actions-row">
              <span class="btn-service-details">${t.btnViewDetails} ${SvgIcons.arrow_forward}</span>
              <button type="button" class="btn-service-whatsapp" onclick="event.stopPropagation(); inquireServiceWhatsApp('${s.id}')" title="Inquire on WhatsApp">
                ${SvgIcons.whatsapp}
              </button>
            </div>
          </div>
        </div>
      `;
    }).join('');
    homeContainer.innerHTML = homeHtml;
  }
}

// ============================================================================
// 9. RENDER PROJECTS & FILTERING
// ============================================================================

function renderProjects() {
  const container = document.getElementById('projects-grid-container');
  const homeContainer = document.getElementById('home-projects-grid');
  if (!container && !homeContainer) return;

  const t = Translations[AppState.lang];

  // Filter projects by active category
  const filtered = AppState.projectFilter === 'All'
    ? ProjectsData
    : ProjectsData.filter(p => p.category.toLowerCase().includes(AppState.projectFilter.toLowerCase()));

  const html = filtered.map(p => {
    const tagsHtml = p.techStack.slice(0, 3).map(tech => `<span class="tech-tag">${tech}</span>`).join('');
    const liveDemoBtn = p.liveDemoUrl ? `
      <a href="${p.liveDemoUrl}" target="_blank" rel="noopener" class="btn-project-live" onclick="event.stopPropagation();">
        Demo ${SvgIcons.open_link}
      </a>
    ` : '';

    return `
      <div class="project-card" onclick="openProjectModal('${p.id}')">
        <div class="project-image-box">
          <img src="${p.imageUrl}" alt="${p.title}" loading="lazy">
          <span class="project-tag-pill">${p.category}</span>
          ${p.resultsMetric ? `<span class="project-metric-pill">${p.resultsMetric}</span>` : ''}
        </div>
        <div class="project-body">
          <h3 class="project-title">${p.title}</h3>
          <p class="project-desc">${p.shortDesc}</p>
          <div class="project-tech-tags">${tagsHtml}</div>
          <div class="project-actions-row">
            <span class="btn-project-details">${t.btnViewDetails} ${SvgIcons.arrow_forward}</span>
            ${liveDemoBtn}
          </div>
        </div>
      </div>
    `;
  }).join('');

  if (container) container.innerHTML = html;
  if (homeContainer) homeContainer.innerHTML = html;

  // Filter buttons listener
  document.querySelectorAll('.project-filter-btn').forEach(btn => {
    btn.onclick = () => {
      document.querySelectorAll('.project-filter-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      AppState.projectFilter = btn.getAttribute('data-category');
      renderProjects();
    };
  });
}

// ============================================================================
// 10. RENDER WHY WORK PILLARS
// ============================================================================

function renderWhyWork() {
  const containers = document.querySelectorAll('.why-grid-container');
  if (!containers.length) return;

  const html = WhyWorkData.map(w => {
    const title = AppState.lang === 'hindi' ? w.titleHindi : w.title;
    const desc = AppState.lang === 'hindi' ? w.subtitleHindi : w.subtitle;
    const iconSvg = SvgIcons[w.icon] || SvgIcons.sparkles;

    return `
      <div class="why-card" style="--card-accent: ${w.color};">
        <div class="why-icon-box" style="background: ${w.color}20; color: ${w.color};">
          ${iconSvg}
        </div>
        <h4 class="why-title">${title}</h4>
        <p class="why-desc">${desc}</p>
      </div>
    `;
  }).join('');

  containers.forEach(c => c.innerHTML = html);
}

// ============================================================================
// 11. MODAL DIALOGS
// ============================================================================

function initModals() {
  const serviceModal = document.getElementById('service-modal');
  const projectModal = document.getElementById('project-modal');

  // Close buttons
  document.querySelectorAll('.modal-close-btn').forEach(btn => {
    btn.onclick = () => {
      closeAllModals();
    };
  });

  // Close when clicking outside dialog
  window.addEventListener('click', (e) => {
    if (e.target.classList.contains('modal-overlay')) {
      closeAllModals();
    }
  });

  // Close on ESC key
  window.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
      closeAllModals();
    }
  });
}

function closeAllModals() {
  document.querySelectorAll('.modal-overlay').forEach(m => m.classList.remove('active'));
  document.body.style.overflow = 'auto';
}

function openServiceModal(serviceId) {
  const s = ServicesData.find(item => item.id === serviceId);
  if (!s) return;

  const modal = document.getElementById('service-modal');
  const modalContent = document.getElementById('service-modal-content');
  const t = Translations[AppState.lang];

  const title = AppState.lang === 'hindi' ? s.titleHindi : (AppState.lang === 'english' ? s.titleEnglish : s.titleHinglish);
  const detailedDesc = (AppState.lang === 'hindi' && s.detailedDescHindi) ? s.detailedDescHindi : s.detailedDesc;
  const iconSvg = SvgIcons[s.icon] || SvgIcons.services;

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
      <img src="${s.imageUrl}" alt="${title}">
      <div class="modal-banner-gradient"></div>
    </div>
    <div class="modal-header-info" style="--modal-color: ${s.accentColor};">
      <div class="modal-icon-badge">${iconSvg}</div>
      <div class="modal-title-wrap">
        <h3>${title}</h3>
        <p>${s.titleEnglish}</p>
      </div>
    </div>
    <div class="modal-body" style="--modal-color: ${s.accentColor};">
      <p class="modal-desc-full">${detailedDesc}</p>

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
      <img src="${p.imageUrl}" alt="${p.title}">
      <div class="modal-banner-gradient"></div>
    </div>
    <div class="modal-header-info">
      <div class="modal-title-wrap">
        <h3>${p.title}</h3>
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
// 12. WHATSAPP INQUIRY GENERATORS
// ============================================================================

function inquireServiceWhatsApp(serviceId) {
  const s = ServicesData.find(item => item.id === serviceId);
  const serviceName = s ? s.titleEnglish : 'Digital Marketing';
  const text = AppState.lang === 'hindi'
    ? `नमस्ते मनीष जी! मुझे आपकी "${serviceName}" सेवा के बारे में जानकारी चाहिए।`
    : `Hello Manish! I visited your portfolio and would like to discuss your "${serviceName}" service for my business.`;
  const url = `https://wa.me/91${ProfileData.whatsappNumber}?text=${encodeURIComponent(text)}`;
  window.open(url, '_blank');
}

function inquireProjectWhatsApp(projectId) {
  const p = ProjectsData.find(item => item.id === projectId);
  const projectName = p ? p.title : 'Project';
  const text = AppState.lang === 'hindi'
    ? `नमस्ते मनीष जी! मुझे आपके "${projectName}" प्रोजेक्ट के बारे में बात करनी है। मुझे भी ऐसा समाधान विकसित करवाना है।`
    : `Hello Manish! I checked your "${projectName}" project and would like to build a similar solution.`;
  const url = `https://wa.me/91${ProfileData.whatsappNumber}?text=${encodeURIComponent(text)}`;
  window.open(url, '_blank');
}

// ============================================================================
// 13. INTERACTIVE CONTACT FORM HANDLER
// ============================================================================

function initContactForm() {
  const form = document.getElementById('project-contact-form');
  if (!form) return;

  form.addEventListener('submit', (e) => {
    e.preventDefault();

    const name = document.getElementById('form-name').value.trim();
    const phone = document.getElementById('form-phone').value.trim();
    const email = document.getElementById('form-email').value.trim();
    const service = document.getElementById('form-service').value;
    const message = document.getElementById('form-message').value.trim();

    if (!name) {
      showToast('Please enter your full name.', 'error');
      document.getElementById('form-name').focus();
      return;
    }

    if (!phone || phone.length < 10) {
      showToast('Please enter a valid 10-digit phone number.', 'error');
      document.getElementById('form-phone').focus();
      return;
    }

    if (!message) {
      showToast('Please describe your requirements.', 'error');
      document.getElementById('form-message').focus();
      return;
    }

    const whatsappMessage = `*Hello Digital Manish, New Project Enquiry:*
👤 *Name:* ${name}
📞 *Phone:* ${phone}
📧 *Email:* ${email || 'Not provided'}
🎯 *Service Needed:* ${service}
💬 *Message:* ${message}`;

    const url = `https://wa.me/91${ProfileData.whatsappNumber}?text=${encodeURIComponent(whatsappMessage)}`;
    window.open(url, '_blank');

    showToast('Inquiry sent! Opening WhatsApp with details...', 'success');
    form.reset();
  });
}

// Toast notification helper
function showToast(message, type = 'info') {
  let container = document.querySelector('.toast-container');
  if (!container) {
    container = document.createElement('div');
    container.className = 'toast-container';
    document.body.appendChild(container);
  }

  const toast = document.createElement('div');
  toast.className = `toast ${type}`;
  toast.innerHTML = `<span>${message}</span>`;
  container.appendChild(toast);

  setTimeout(() => {
    toast.style.opacity = '0';
    setTimeout(() => toast.remove(), 300);
  }, 4000);
}

// ============================================================================
// 14. SCROLL & FLOATING BUTTON CONTROLLER
// ============================================================================

function initScrollListeners() {
  const scrollTopBtn = document.getElementById('scroll-top-btn');
  const floatingWhatsApp = document.getElementById('floating-whatsapp');
  const footer = document.querySelector('.footer');

  window.addEventListener('scroll', () => {
    const scrollY = window.scrollY;

    // Scroll-to-top button visibility
    if (scrollTopBtn) {
      if (scrollY > 350) {
        scrollTopBtn.classList.add('visible');
      } else {
        scrollTopBtn.classList.remove('visible');
      }
    }

    // Hide floating WhatsApp button near footer to avoid overlap
    if (floatingWhatsApp && footer) {
      const footerRect = footer.getBoundingClientRect();
      const windowHeight = window.innerHeight;
      if (footerRect.top <= windowHeight - 50) {
        floatingWhatsApp.classList.add('hidden-footer');
      } else {
        floatingWhatsApp.classList.remove('hidden-footer');
      }
    }
  });

  if (scrollTopBtn) {
    scrollTopBtn.onclick = () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    };
  }
}
