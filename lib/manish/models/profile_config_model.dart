class ProfileConfigModel {
  final String name;
  final String tagline;
  final String phone;
  final String whatsappNumber;
  final String email;
  final String location;
  final String locationShort;
  final String avatarUrl;
  final String logoText;
  final String logoImageUrl;

  // Hero Section Customizations
  final String heroTitle;
  final String heroSubtitle;
  final String heroBadge1;
  final String heroBadge2;

  // About Section Customizations
  final String aboutHeading;
  final String aboutSubtitle;
  final String aboutBio;
  final String aboutMission;

  // Services Section Customizations
  final String servicesHeading;
  final String servicesSubtitle;

  // Projects Section Customizations
  final String projectsHeading;
  final String projectsSubtitle;

  // Why Work Section Customizations
  final String whyWorkHeading;
  final String whyWorkSubtitle;
  final String consultationTitle;
  final String consultationSubtitle;

  // Contact Section Customizations
  final String contactHeading;
  final String contactSubtitle;
  final String whatsappDefaultMessage;
  final String whatsappMotivationText;
  final String mapsEmbedQuery;

  // Social & External Links
  final String youtubeUrl;
  final String instagramUrl;
  final String facebookUrl;
  final String linkedinUrl;
  final String githubUrl;

  // Theme & Appearance Customizations
  final String themePreset;
  final String primaryColorHex;
  final String secondaryColorHex;
  final String accentColorHex;
  final bool isDarkModeDefault;

  // Footer & Security Settings
  final String footerAbout;
  final String copyrightText;
  final String adminPasscode;
  final bool isAdminPinRequired;

  const ProfileConfigModel({
    this.name = 'Digital Manish',
    this.tagline = 'Digital Marketing | Website & App Development',
    this.phone = '9214468818',
    this.whatsappNumber = '9214468818',
    this.email = 'manishdigital99@gmail.com',
    this.location = 'Varanasi, Uttar Pradesh, India',
    this.locationShort = 'Varanasi (UP)',
    this.avatarUrl = 'assets/images/digital_manish_logo_circle.png',
    this.logoText = 'DM',
    this.logoImageUrl = 'assets/images/digital_manish_logo.png',
    this.themePreset = 'indigo_purple',
    this.primaryColorHex = '#6366F1',
    this.secondaryColorHex = '#8B5CF6',
    this.accentColorHex = '#EC4899',
    this.isDarkModeDefault = true,
    this.heroTitle = 'Accelerate Your Business Growth With Modern Digital Solutions',
    this.heroSubtitle =
        'I am Digital Manish, a passionate Digital Marketer and Full-Stack Web & App Developer. I help businesses scale rapidly through high-converting Meta & Google Ads campaigns, ultra-fast SEO websites, and modern mobile applications.',
    this.heroBadge1 = 'Available for Projects',
    this.heroBadge2 = 'ROI Focused',
    this.aboutHeading = 'About Digital Manish',
    this.aboutSubtitle = 'Digital Marketer & Full-Stack Developer',
    this.aboutBio =
        'Hello! I am Digital Manish from Varanasi (UP), India. My mission is to empower businesses, local enterprises, and digital entrepreneurs with a commanding online presence. I specialize in ROI-driven Digital Marketing, Google & Meta Ads, targeted SEO strategies, and scalable Web & App Development. Delivering highest-grade quality on schedule is always my top priority.',
    this.aboutMission = 'Delivering customized digital blueprints, ROI-driven growth campaigns, and scalable digital execution for every business.',
    this.servicesHeading = 'My Specialized Services',
    this.servicesSubtitle =
        'Comprehensive digital solutions engineered to scale your business with modern technology and results-oriented marketing.',
    this.projectsHeading = 'Featured Projects Showcase',
    this.projectsSubtitle =
        'High-impact digital marketing campaigns, modern responsive websites, and dynamic cross-platform mobile apps.',
    this.whyWorkHeading = 'Why Work With Digital Manish?',
    this.whyWorkSubtitle =
        'A dedicated, transparent, and results-focused digital growth partner for your business.',
    this.consultationTitle = 'Ready to grow your business online?',
    this.consultationSubtitle = 'Connect today on WhatsApp or call directly for a free consultation and project roadmap.',
    this.contactHeading = 'Let’s Discuss Your Next Big Project',
    this.contactSubtitle =
        'Get a customized proposal and strategic guidance tailored to your business requirements.',
    this.whatsappDefaultMessage =
        'Hello Manish! I visited your portfolio website and would like to discuss your Digital Marketing / Web & App Development services.',
    this.whatsappMotivationText = '🚀 Ready to grow your business? Chat on WhatsApp now!',
    this.mapsEmbedQuery = 'Varanasi, Uttar Pradesh, India',
    this.youtubeUrl = 'https://youtube.com',
    this.instagramUrl = 'https://www.instagram.com/digitalmanish.online/',
    this.facebookUrl = 'https://www.facebook.com/digimanish',
    this.linkedinUrl = 'https://linkedin.com',
    this.githubUrl = 'https://github.com',
    this.footerAbout =
        'Helping businesses establish commanding digital presence through high-ROI Meta & Google Ads, local SEO supremacy, and ultra-fast web/mobile applications.',
    this.copyrightText = 'Digital Manish. All rights reserved.',
    this.adminPasscode = '1234',
    this.isAdminPinRequired = false,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'tagline': tagline,
        'phone': phone,
        'whatsappNumber': whatsappNumber,
        'email': email,
        'location': location,
        'locationShort': locationShort,
        'avatarUrl': avatarUrl,
        'logoText': logoText,
        'logoImageUrl': logoImageUrl,
        'heroTitle': heroTitle,
        'heroSubtitle': heroSubtitle,
        'heroBadge1': heroBadge1,
        'heroBadge2': heroBadge2,
        'aboutHeading': aboutHeading,
        'aboutSubtitle': aboutSubtitle,
        'aboutBio': aboutBio,
        'aboutMission': aboutMission,
        'servicesHeading': servicesHeading,
        'servicesSubtitle': servicesSubtitle,
        'projectsHeading': projectsHeading,
        'projectsSubtitle': projectsSubtitle,
        'whyWorkHeading': whyWorkHeading,
        'whyWorkSubtitle': whyWorkSubtitle,
        'themePreset': themePreset,
        'primaryColorHex': primaryColorHex,
        'secondaryColorHex': secondaryColorHex,
        'accentColorHex': accentColorHex,
        'isDarkModeDefault': isDarkModeDefault,
        'consultationTitle': consultationTitle,
        'consultationSubtitle': consultationSubtitle,
        'contactHeading': contactHeading,
        'contactSubtitle': contactSubtitle,
        'whatsappDefaultMessage': whatsappDefaultMessage,
        'whatsappMotivationText': whatsappMotivationText,
        'mapsEmbedQuery': mapsEmbedQuery,
        'youtubeUrl': youtubeUrl,
        'instagramUrl': instagramUrl,
        'facebookUrl': facebookUrl,
        'linkedinUrl': linkedinUrl,
        'githubUrl': githubUrl,
        'footerAbout': footerAbout,
        'copyrightText': copyrightText,
        'adminPasscode': adminPasscode,
        'isAdminPinRequired': isAdminPinRequired,
      };

  factory ProfileConfigModel.fromJson(Map<String, dynamic> json) {
    return ProfileConfigModel(
      name: json['name'] as String? ?? 'Digital Manish',
      tagline: json['tagline'] as String? ?? 'Digital Marketing | Website & App Development',
      phone: json['phone'] as String? ?? '9214468818',
      whatsappNumber: json['whatsappNumber'] as String? ?? '9214468818',
      email: json['email'] as String? ?? 'manishdigital99@gmail.com',
      location: json['location'] as String? ?? 'Varanasi, Uttar Pradesh, India',
      locationShort: json['locationShort'] as String? ?? 'Varanasi (UP)',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      logoText: json['logoText'] as String? ?? 'DM',
      logoImageUrl: (json['logoImageUrl'] as String?)?.isNotEmpty == true
          ? (json['logoImageUrl'] as String)
          : 'assets/images/digital_manish_logo.png',
      themePreset: json['themePreset'] as String? ?? 'indigo_purple',
      primaryColorHex: json['primaryColorHex'] as String? ?? '#6366F1',
      secondaryColorHex: json['secondaryColorHex'] as String? ?? '#8B5CF6',
      accentColorHex: json['accentColorHex'] as String? ?? '#EC4899',
      isDarkModeDefault: json['isDarkModeDefault'] as bool? ?? true,
      heroTitle: json['heroTitle'] as String? ?? 'Accelerate Your Business Growth With Modern Digital Solutions',
      heroSubtitle: json['heroSubtitle'] as String? ?? '',
      heroBadge1: json['heroBadge1'] as String? ?? 'Available for Projects',
      heroBadge2: json['heroBadge2'] as String? ?? 'ROI Focused',
      aboutHeading: json['aboutHeading'] as String? ?? 'About Digital Manish',
      aboutSubtitle: json['aboutSubtitle'] as String? ?? 'Digital Marketer & Full-Stack Developer',
      aboutBio: json['aboutBio'] as String? ?? '',
      aboutMission: json['aboutMission'] as String? ?? '',
      servicesHeading: json['servicesHeading'] as String? ?? 'My Specialized Services',
      servicesSubtitle: json['servicesSubtitle'] as String? ?? '',
      projectsHeading: json['projectsHeading'] as String? ?? 'Featured Projects Showcase',
      projectsSubtitle: json['projectsSubtitle'] as String? ?? '',
      whyWorkHeading: json['whyWorkHeading'] as String? ?? 'Why Work With Digital Manish?',
      whyWorkSubtitle: json['whyWorkSubtitle'] as String? ?? '',
      consultationTitle: json['consultationTitle'] as String? ?? 'Ready to grow your business online?',
      consultationSubtitle: json['consultationSubtitle'] as String? ?? '',
      contactHeading: json['contactHeading'] as String? ?? 'Let’s Discuss Your Next Big Project',
      contactSubtitle: json['contactSubtitle'] as String? ?? '',
      whatsappDefaultMessage: json['whatsappDefaultMessage'] as String? ?? '',
      whatsappMotivationText: json['whatsappMotivationText'] as String? ?? '🚀 Ready to scale your business? Chat on WhatsApp now!',
      mapsEmbedQuery: json['mapsEmbedQuery'] as String? ?? 'Varanasi, Uttar Pradesh, India',
      youtubeUrl: json['youtubeUrl'] as String? ?? 'https://youtube.com',
      instagramUrl: json['instagramUrl'] as String? ?? 'https://instagram.com',
      facebookUrl: json['facebookUrl'] as String? ?? 'https://facebook.com',
      linkedinUrl: json['linkedinUrl'] as String? ?? 'https://linkedin.com',
      githubUrl: json['githubUrl'] as String? ?? 'https://github.com',
      footerAbout: json['footerAbout'] as String? ?? '',
      copyrightText: json['copyrightText'] as String? ?? 'Digital Manish. All rights reserved.',
      adminPasscode: json['adminPasscode'] as String? ?? '1234',
      isAdminPinRequired: json['isAdminPinRequired'] as bool? ?? false,
    );
  }

  ProfileConfigModel copyWith({
    String? name,
    String? tagline,
    String? phone,
    String? whatsappNumber,
    String? email,
    String? location,
    String? locationShort,
    String? avatarUrl,
    String? logoText,
    String? logoImageUrl,
    String? themePreset,
    String? primaryColorHex,
    String? secondaryColorHex,
    String? accentColorHex,
    bool? isDarkModeDefault,
    String? heroTitle,
    String? heroSubtitle,
    String? heroBadge1,
    String? heroBadge2,
    String? aboutHeading,
    String? aboutSubtitle,
    String? aboutBio,
    String? aboutMission,
    String? servicesHeading,
    String? servicesSubtitle,
    String? projectsHeading,
    String? projectsSubtitle,
    String? whyWorkHeading,
    String? whyWorkSubtitle,
    String? consultationTitle,
    String? consultationSubtitle,
    String? contactHeading,
    String? contactSubtitle,
    String? whatsappDefaultMessage,
    String? whatsappMotivationText,
    String? mapsEmbedQuery,
    String? youtubeUrl,
    String? instagramUrl,
    String? facebookUrl,
    String? linkedinUrl,
    String? githubUrl,
    String? footerAbout,
    String? copyrightText,
    String? adminPasscode,
    bool? isAdminPinRequired,
  }) {
    return ProfileConfigModel(
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      phone: phone ?? this.phone,
      whatsappNumber: whatsappNumber ?? this.whatsappNumber,
      email: email ?? this.email,
      location: location ?? this.location,
      locationShort: locationShort ?? this.locationShort,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      logoText: logoText ?? this.logoText,
      logoImageUrl: logoImageUrl ?? this.logoImageUrl,
      themePreset: themePreset ?? this.themePreset,
      primaryColorHex: primaryColorHex ?? this.primaryColorHex,
      secondaryColorHex: secondaryColorHex ?? this.secondaryColorHex,
      accentColorHex: accentColorHex ?? this.accentColorHex,
      isDarkModeDefault: isDarkModeDefault ?? this.isDarkModeDefault,
      heroTitle: heroTitle ?? this.heroTitle,
      heroSubtitle: heroSubtitle ?? this.heroSubtitle,
      heroBadge1: heroBadge1 ?? this.heroBadge1,
      heroBadge2: heroBadge2 ?? this.heroBadge2,
      aboutHeading: aboutHeading ?? this.aboutHeading,
      aboutSubtitle: aboutSubtitle ?? this.aboutSubtitle,
      aboutBio: aboutBio ?? this.aboutBio,
      aboutMission: aboutMission ?? this.aboutMission,
      servicesHeading: servicesHeading ?? this.servicesHeading,
      servicesSubtitle: servicesSubtitle ?? this.servicesSubtitle,
      projectsHeading: projectsHeading ?? this.projectsHeading,
      projectsSubtitle: projectsSubtitle ?? this.projectsSubtitle,
      whyWorkHeading: whyWorkHeading ?? this.whyWorkHeading,
      whyWorkSubtitle: whyWorkSubtitle ?? this.whyWorkSubtitle,
      consultationTitle: consultationTitle ?? this.consultationTitle,
      consultationSubtitle: consultationSubtitle ?? this.consultationSubtitle,
      contactHeading: contactHeading ?? this.contactHeading,
      contactSubtitle: contactSubtitle ?? this.contactSubtitle,
      whatsappDefaultMessage: whatsappDefaultMessage ?? this.whatsappDefaultMessage,
      whatsappMotivationText: whatsappMotivationText ?? this.whatsappMotivationText,
      mapsEmbedQuery: mapsEmbedQuery ?? this.mapsEmbedQuery,
      youtubeUrl: youtubeUrl ?? this.youtubeUrl,
      instagramUrl: instagramUrl ?? this.instagramUrl,
      facebookUrl: facebookUrl ?? this.facebookUrl,
      linkedinUrl: linkedinUrl ?? this.linkedinUrl,
      githubUrl: githubUrl ?? this.githubUrl,
      footerAbout: footerAbout ?? this.footerAbout,
      copyrightText: copyrightText ?? this.copyrightText,
      adminPasscode: adminPasscode ?? this.adminPasscode,
      isAdminPinRequired: isAdminPinRequired ?? this.isAdminPinRequired,
    );
  }
}
