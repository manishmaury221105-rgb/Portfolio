import '../models/project_model.dart';
import '../models/service_model.dart';
import '../models/why_work_model.dart';

enum AppLanguage {
  hindi('Hindi', 'हिंदी', '🇮🇳'),
  hinglish('Hinglish', 'हिं-Eng', '🇮🇳'),
  english('English', 'English', '🇬🇧');

  final String label;
  final String shortLabel;
  final String flag;
  const AppLanguage(this.label, this.shortLabel, this.flag);

  static AppLanguage fromString(String? val) {
    if (val == 'hindi') return AppLanguage.hindi;
    if (val == 'hinglish') return AppLanguage.hinglish;
    return AppLanguage.english;
  }
}

/// Central Localization & Translation Engine for Digital Manish Portfolio.
/// Supports 3 languages: Hindi (हिंदी), Hinglish (Roman Hindi), and English.
class AppLocalization {
  final AppLanguage language;
  const AppLocalization(this.language);

  bool get isHindi => language == AppLanguage.hindi;
  bool get isHinglish => language == AppLanguage.hinglish;
  bool get isEnglish => language == AppLanguage.english;

  // --- Navigation Labels ---
  String get navHome {
    switch (language) {
      case AppLanguage.hindi:
        return 'होम';
      case AppLanguage.hinglish:
        return 'Home';
      case AppLanguage.english:
        return 'Home';
    }
  }

  String get navAbout {
    switch (language) {
      case AppLanguage.hindi:
        return 'परिचय';
      case AppLanguage.hinglish:
        return 'About';
      case AppLanguage.english:
        return 'About';
    }
  }

  String get navServices {
    switch (language) {
      case AppLanguage.hindi:
        return 'सेवाएँ';
      case AppLanguage.hinglish:
        return 'Services';
      case AppLanguage.english:
        return 'Services';
    }
  }

  String get navProjects {
    switch (language) {
      case AppLanguage.hindi:
        return 'प्रोजेक्ट्स';
      case AppLanguage.hinglish:
        return 'Projects';
      case AppLanguage.english:
        return 'Projects';
    }
  }

  String get navContact {
    switch (language) {
      case AppLanguage.hindi:
        return 'संपर्क';
      case AppLanguage.hinglish:
        return 'Contact';
      case AppLanguage.english:
        return 'Contact';
    }
  }

  // --- Hero Section ---
  String get heroAvailableBadge {
    switch (language) {
      case AppLanguage.hindi:
        return 'नए प्रोजेक्ट्स एवं क्लाइंट्स के लिए उपलब्ध';
      case AppLanguage.hinglish:
        return 'Available for New Projects & Clients';
      case AppLanguage.english:
        return 'Available for New Projects & Clients';
    }
  }

  String get heroTagline {
    switch (language) {
      case AppLanguage.hindi:
        return 'बेस्ट डिजिटल मार्केटिंग एजेंसी | वेबसाइट और ऐप डेवलपमेंट';
      case AppLanguage.hinglish:
        return 'Best Digital Marketing Agency In Varanasi | Website & App Development';
      case AppLanguage.english:
        return 'Best Digital Marketing Agency | Full-Stack Web & App Development';
    }
  }

  String get heroSubtitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'मैं डिजिटल मनीष, वाराणसी और पूरे भारत के व्यवसायों को हाई-कन्वर्टिंग मेटा व गूगल ऐड्स, टॉप-रैंकिंग एसईओ, आधुनिक वेबसाइट्स और मोबाइल ऐप्स के माध्यम से ऑनलाइन विकसित करने में सहायता करता हूँ।';
      case AppLanguage.hinglish:
        return 'Main Digital Manish, ek Best Digital Marketing Agency aur Full-Stack Web & App Development Agency hoon. High-converting Meta & Google Ads campaigns, result-driven SEO, professional websites, modern mobile applications aur smart digital solutions ke through businesses ko online grow karne mein help karta hoon.';
      case AppLanguage.english:
        return 'I am Digital Manish, a premier Digital Marketing Specialist and Full-Stack Web & Mobile App Developer. I help businesses scale online through high-converting Meta & Google Ads campaigns, result-driven SEO, modern responsive websites, custom mobile applications, and high-performance digital solutions.';
    }
  }

  String getHeroTagline(String customTagline) {
    if (language == AppLanguage.hindi) {
      return heroTagline;
    } else if (language == AppLanguage.english) {
      return heroTagline;
    } else {
      return customTagline.isNotEmpty ? customTagline : heroTagline;
    }
  }

  String getHeroSubtitle(String customSubtitle) {
    if (language == AppLanguage.hindi) {
      return heroSubtitle;
    } else if (language == AppLanguage.english) {
      return heroSubtitle;
    } else {
      return customSubtitle.isNotEmpty ? customSubtitle : heroSubtitle;
    }
  }

  String get heroCtaWhatsApp {
    switch (language) {
      case AppLanguage.hindi:
        return 'व्हाट्सएप पर बात करें';
      case AppLanguage.hinglish:
        return 'WhatsApp Par Baat Karein';
      case AppLanguage.english:
        return 'Chat on WhatsApp';
    }
  }

  String get heroCtaServices {
    switch (language) {
      case AppLanguage.hindi:
        return 'सेवाएं देखें';
      case AppLanguage.hinglish:
        return 'Services Dekhein';
      case AppLanguage.english:
        return 'Explore Services';
    }
  }

  String get heroCtaContact {
    switch (language) {
      case AppLanguage.hindi:
        return 'सीधे संपर्क करें';
      case AppLanguage.hinglish:
        return 'Direct Contact Karein';
      case AppLanguage.english:
        return 'Get in Touch';
    }
  }

  String get statExperienceLabel {
    switch (language) {
      case AppLanguage.hindi:
        return 'वर्षों का अनुभव';
      case AppLanguage.hinglish:
        return 'Years Experience';
      case AppLanguage.english:
        return 'Years Experience';
    }
  }

  String get statProjectsLabel {
    switch (language) {
      case AppLanguage.hindi:
        return 'सफल प्रोजेक्ट्स';
      case AppLanguage.hinglish:
        return 'Successful Projects';
      case AppLanguage.english:
        return 'Delivered Projects';
    }
  }

  String get statClientsLabel {
    switch (language) {
      case AppLanguage.hindi:
        return 'संतुष्ट ग्राहक दर';
      case AppLanguage.hinglish:
        return 'Client Satisfaction';
      case AppLanguage.english:
        return 'Client Satisfaction';
    }
  }

  // --- Why Work With Me ---
  String get whyWorkBadge {
    switch (language) {
      case AppLanguage.hindi:
        return 'विशेषताएं एवं मूल्य';
      case AppLanguage.hinglish:
        return 'Key Value Proposition';
      case AppLanguage.english:
        return 'Why Work With Manish';
    }
  }

  String whyWorkHeading(String name) {
    switch (language) {
      case AppLanguage.hindi:
        return '$name के साथ काम क्यों करें?';
      case AppLanguage.hinglish:
        return 'Why Work With $name?';
      case AppLanguage.english:
        return 'Why Work With $name?';
    }
  }

  String get whyWorkSubtitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'आपके व्यवसाय के लिए एक समर्पित, पारदर्शी और परिणाम-उन्मुख डिजिटल पार्टनरशिप।';
      case AppLanguage.hinglish:
        return 'Aapke business ke liye dedicated, transparent aur result-driven digital partnership.';
      case AppLanguage.english:
        return 'A dedicated, transparent, and result-oriented digital partnership for your business growth.';
    }
  }

  // --- Services Section ---
  String get servicesBadge {
    switch (language) {
      case AppLanguage.hindi:
        return 'विशेषज्ञ सेवाएं';
      case AppLanguage.hinglish:
        return 'Core Offerings';
      case AppLanguage.english:
        return 'Our Services';
    }
  }

  String get servicesHeading {
    switch (language) {
      case AppLanguage.hindi:
        return 'व्यावसायिक वृद्धि के लिए संपूर्ण डिजिटल सेवाएं';
      case AppLanguage.hinglish:
        return 'Business Growth Ke Liye High-Impact Solutions';
      case AppLanguage.english:
        return 'High-Impact Digital & Development Solutions';
    }
  }

  String get servicesSubtitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'टारगेटेड विज्ञापनों से लेकर आधुनिक वेबसाइट और मोबाइल ऐप निर्माण तक सब कुछ एक ही स्थान पर।';
      case AppLanguage.hinglish:
        return 'Lead generation se lekar custom website & mobile app development tak sab kuch.';
      case AppLanguage.english:
        return 'From high-converting lead campaigns to blazing-fast modern web & mobile applications.';
    }
  }

  String get viewDetailsBtn {
    switch (language) {
      case AppLanguage.hindi:
        return 'विस्तार से देखें';
      case AppLanguage.hinglish:
        return 'Details Dekhein';
      case AppLanguage.english:
        return 'View Details';
    }
  }

  String get bookConsultationBtn {
    switch (language) {
      case AppLanguage.hindi:
        return 'परामर्श बुक करें';
      case AppLanguage.hinglish:
        return 'Consultation Karein';
      case AppLanguage.english:
        return 'Book Consultation';
    }
  }

  String get inquireOnWhatsApp {
    switch (language) {
      case AppLanguage.hindi:
        return 'व्हाट्सएप पर पूछें';
      case AppLanguage.hinglish:
        return 'WhatsApp Par Puchen';
      case AppLanguage.english:
        return 'Inquire on WhatsApp';
    }
  }

  String get keyBenefitsTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'प्रमुख लाभ (Key Benefits)';
      case AppLanguage.hinglish:
        return 'Fayde (Key Benefits)';
      case AppLanguage.english:
        return 'Key Business Benefits';
    }
  }

  String get includedServicesTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'क्या-क्या शामिल है:';
      case AppLanguage.hinglish:
        return 'Kya-kya shamil hai:';
      case AppLanguage.english:
        return 'What is included:';
    }
  }

  // --- Projects Section ---
  String get projectsBadge {
    switch (language) {
      case AppLanguage.hindi:
        return 'पोर्टफोलियो एवं केस स्टडीज';
      case AppLanguage.hinglish:
        return 'Portfolio Showcase';
      case AppLanguage.english:
        return 'Featured Projects';
    }
  }

  String get projectsHeading {
    switch (language) {
      case AppLanguage.hindi:
        return 'हाल ही में पूरे किए गए सफल प्रोजेक्ट्स';
      case AppLanguage.hinglish:
        return 'Haal Hi Me Kiye Gaye Top Projects';
      case AppLanguage.english:
        return 'Recent Successful Projects & Case Studies';
    }
  }

  String get projectsSubtitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'क्लाइंट्स के लिए वास्तविक परिणाम, ट्रैफिक और बिक्री बढ़ाने वाले लाइव कार्य।';
      case AppLanguage.hinglish:
        return 'Real business results aur ROI generate karne wale verified live projects.';
      case AppLanguage.english:
        return 'Proven solutions driving measurable ROI, high conversion rates, and business growth.';
    }
  }

  String get filterAll {
    switch (language) {
      case AppLanguage.hindi:
        return 'सभी';
      case AppLanguage.hinglish:
        return 'All';
      case AppLanguage.english:
        return 'All';
    }
  }

  String get filterWebsites {
    switch (language) {
      case AppLanguage.hindi:
        return 'वेबसाइट्स';
      case AppLanguage.hinglish:
        return 'Websites';
      case AppLanguage.english:
        return 'Websites';
    }
  }

  String get filterApps {
    switch (language) {
      case AppLanguage.hindi:
        return 'मोबाइल ऐप्स';
      case AppLanguage.hinglish:
        return 'Mobile Apps';
      case AppLanguage.english:
        return 'Mobile Apps';
    }
  }

  String get filterMetaAds {
    switch (language) {
      case AppLanguage.hindi:
        return 'मेटा ऐड्स';
      case AppLanguage.hinglish:
        return 'Meta Ads';
      case AppLanguage.english:
        return 'Meta Ads';
    }
  }

  String get filterSeo {
    switch (language) {
      case AppLanguage.hindi:
        return 'एसईओ';
      case AppLanguage.hinglish:
        return 'SEO';
      case AppLanguage.english:
        return 'SEO';
    }
  }

  String get liveDemoBtn {
    switch (language) {
      case AppLanguage.hindi:
        return 'लाइव डेमो देखें';
      case AppLanguage.hinglish:
        return 'Live Demo Dekhein';
      case AppLanguage.english:
        return 'View Live Demo';
    }
  }

  String get keyFeaturesTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'मुख्य विशेषताएं:';
      case AppLanguage.hinglish:
        return 'Key Features:';
      case AppLanguage.english:
        return 'Key Features:';
    }
  }

  String get techStackTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'प्रयुक्त टेक्नोलॉजी (Tech Stack):';
      case AppLanguage.hinglish:
        return 'Technology & Tools:';
      case AppLanguage.english:
        return 'Technologies Used:';
    }
  }

  // --- About Section ---
  String get aboutBadge {
    switch (language) {
      case AppLanguage.hindi:
        return 'व्यक्तिगत परिचय';
      case AppLanguage.hinglish:
        return 'Background & Bio';
      case AppLanguage.english:
        return 'About Manish';
    }
  }

  String get aboutHeading {
    switch (language) {
      case AppLanguage.hindi:
        return 'नमस्ते! मैं मनीष हूँ';
      case AppLanguage.hinglish:
        return 'Namaste! I am Digital Manish';
      case AppLanguage.english:
        return 'Hello! I am Digital Manish';
    }
  }

  String getAboutBio(String customBio, String fallbackSubtitle) {
    if (language == AppLanguage.hindi) {
      return 'मैं मनीष, वाराणसी (उत्तर प्रदेश) में स्थित एक समर्पित डिजिटल मार्केटर और फुल-स्टैक वेब/ऐप डेवलपर हूँ। 3+ वर्षों के अनुभव के साथ, मैंने भारत भर के व्यवसायों को डिजिटल उपस्थिति बनाने, उच्च गुणवत्ता वाले लीड जनरेट करने और बिक्री बढ़ाने में सहायता की है।';
    } else if (language == AppLanguage.english) {
      return 'I am Digital Manish, a passionate Digital Marketer and Full-Stack Web & Mobile App Developer based in Varanasi (UP), India. With 3+ years of experience, I specialize in crafting high-converting ad campaigns, modern web apps, and native mobile applications that accelerate business growth.';
    } else {
      if (customBio.isNotEmpty) return customBio;
      if (fallbackSubtitle.isNotEmpty) return fallbackSubtitle;
      return 'Main Digital Manish, Varanasi me based ek passionate Digital Marketer aur Full-Stack Developer hoon. 3+ saal ke experience ke saath maine kayi local businesses aur startups ko online grow karne me madad ki hai.';
    }
  }

  String getAboutMission(String customMission) {
    if (language == AppLanguage.hindi) {
      return 'निरंतर नवाचार, पारदर्शी संवाद और क्लाइंट्स के लिए ठोस व्यावसायिक वृद्धि मेरा मुख्य ध्येय है। हर प्रोजेक्ट में प्रीमियम गुणवत्ता और समयबद्ध डिलीवरी सुनिश्चित करना मेरी प्राथमिकता है।';
    } else if (language == AppLanguage.english) {
      return 'Continuous innovation, transparent communication, and a relentless focus on delivering measurable business growth for clients. Delivering scalable, high-quality digital solutions on time.';
    } else {
      return customMission.isNotEmpty
          ? customMission
          : 'Continuous innovation, transparent communication, and relentless focus on measurable business growth for clients.';
    }
  }

  String get aboutMissionTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'मेरा मिशन एवं कार्यशैली';
      case AppLanguage.hinglish:
        return 'Mera Mission & Approach';
      case AppLanguage.english:
        return 'My Mission & Working Philosophy';
    }
  }

  String get skillsHeading {
    switch (language) {
      case AppLanguage.hindi:
        return 'तकनीकी दक्षता एवं कौशल (Tech Stack)';
      case AppLanguage.hinglish:
        return 'Technical Skills & Expertise';
      case AppLanguage.english:
        return 'Technical Skills & Expertise';
    }
  }

  // --- Contact Section ---
  String get contactBadge {
    switch (language) {
      case AppLanguage.hindi:
        return 'सीधा संपर्क';
      case AppLanguage.hinglish:
        return 'Get in Touch';
      case AppLanguage.english:
        return 'Get in Touch';
    }
  }

  String get contactHeading {
    switch (language) {
      case AppLanguage.hindi:
        return 'आइए मिलकर आपके व्यवसाय को बड़ा बनाएं';
      case AppLanguage.hinglish:
        return 'Aaiye Milkar Business Ko Bada Banayein';
      case AppLanguage.english:
        return 'Let’s Scale Your Business Together';
    }
  }

  String get contactSubtitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'कोई भी प्रश्न हो या नया प्रोजेक्ट शुरू करना हो, मुझे सीधे व्हाट्सएप या कॉल करें।';
      case AppLanguage.hinglish:
        return 'Naya project shuru karna ho ya free consultation chahiye, direct WhatsApp ya call karein.';
      case AppLanguage.english:
        return 'Ready to launch a new project or scale your marketing? Reach out directly via WhatsApp or Phone.';
    }
  }

  String get directCallTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'सीधे फोन कॉल करें';
      case AppLanguage.hinglish:
        return 'Direct Phone Call';
      case AppLanguage.english:
        return 'Direct Phone Call';
    }
  }

  String get chatWhatsAppTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'व्हाट्सएप चैट';
      case AppLanguage.hinglish:
        return 'Instant WhatsApp Chat';
      case AppLanguage.english:
        return 'Instant WhatsApp Chat';
    }
  }

  String get emailTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'आधिकारिक ईमेल';
      case AppLanguage.hinglish:
        return 'Official Email';
      case AppLanguage.english:
        return 'Official Email';
    }
  }

  String get locationTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'स्थान / पता';
      case AppLanguage.hinglish:
        return 'Location';
      case AppLanguage.english:
        return 'Office & Location';
    }
  }

  String get quickInquiryTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'त्वरित पूछताछ (Quick Inquiry)';
      case AppLanguage.hinglish:
        return 'Direct WhatsApp Inquiry Form';
      case AppLanguage.english:
        return 'Direct WhatsApp Inquiry Form';
    }
  }

  String get formNameLabel {
    switch (language) {
      case AppLanguage.hindi:
        return 'आपका नाम *';
      case AppLanguage.hinglish:
        return 'Aapka Naam *';
      case AppLanguage.english:
        return 'Your Full Name *';
    }
  }

  String get formPhoneLabel {
    switch (language) {
      case AppLanguage.hindi:
        return 'मोबाइल / व्हाट्सएप नंबर *';
      case AppLanguage.hinglish:
        return 'Phone / WhatsApp Number *';
      case AppLanguage.english:
        return 'Phone / WhatsApp Number *';
    }
  }

  String get formServiceLabel {
    switch (language) {
      case AppLanguage.hindi:
        return 'इच्छित सेवा चुनें *';
      case AppLanguage.hinglish:
        return 'Service Select Karein *';
      case AppLanguage.english:
        return 'Select Service Required *';
    }
  }

  String get formMessageLabel {
    switch (language) {
      case AppLanguage.hindi:
        return 'प्रोजेक्ट की आवश्यकता या प्रश्न *';
      case AppLanguage.hinglish:
        return 'Project Requirements / Message *';
      case AppLanguage.english:
        return 'Project Requirements / Message *';
    }
  }

  String get formSubmitBtn {
    switch (language) {
      case AppLanguage.hindi:
        return 'व्हाट्सएप पर भेजें 🚀';
      case AppLanguage.hinglish:
        return 'WhatsApp Par Send Karein 🚀';
      case AppLanguage.english:
        return 'Send on WhatsApp 🚀';
    }
  }

  // --- CTA Banners ---
  String get ctaReadyTitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'क्या आप अपने अगले प्रोजेक्ट पर काम शुरू करने के लिए तैयार हैं?';
      case AppLanguage.hinglish:
        return 'Kya aap naya project shuru karne ke liye ready hain?';
      case AppLanguage.english:
        return 'Ready to Collaborate on Your Next Big Project?';
    }
  }

  String get ctaReadySubtitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'आइए आपके विचारों को हाई-कन्वर्टिंग डिजिटल वास्तविकता में बदलें।';
      case AppLanguage.hinglish:
        return 'Let\'s turn your ideas into high-converting digital realities.';
      case AppLanguage.english:
        return 'Let’s turn your ideas into high-converting digital reality.';
    }
  }

  String get ctaDiscussBtn {
    switch (language) {
      case AppLanguage.hindi:
        return 'मनीष मौर्य से बात करें';
      case AppLanguage.hinglish:
        return 'Contact Digital Manish';
      case AppLanguage.english:
        return 'Contact Digital Manish';
    }
  }

  // --- Footer ---
  String get footerQuickLinks {
    switch (language) {
      case AppLanguage.hindi:
        return 'त्वरित नेविगेशन';
      case AppLanguage.hinglish:
        return 'Quick Links';
      case AppLanguage.english:
        return 'Quick Navigation';
    }
  }

  String get footerContactInfo {
    switch (language) {
      case AppLanguage.hindi:
        return 'संपर्क विवरण';
      case AppLanguage.hinglish:
        return 'Contact Info';
      case AppLanguage.english:
        return 'Contact Details';
    }
  }

  String get footerAdminPanel {
    switch (language) {
      case AppLanguage.hindi:
        return 'एडमिन पोर्टल';
      case AppLanguage.hinglish:
        return 'Admin Panel';
      case AppLanguage.english:
        return 'CMS Admin Portal';
    }
  }

  String get footerCopyright {
    switch (language) {
      case AppLanguage.hindi:
        return 'सर्वाधिकार सुरक्षित।';
      case AppLanguage.hinglish:
        return 'All Rights Reserved.';
      case AppLanguage.english:
        return 'All Rights Reserved.';
    }
  }

  // --- Dynamic Model Translators ---
  String getServiceTitle(ServiceModel service) {
    if (language == AppLanguage.hindi) {
      switch (service.id) {
        case 'digital_marketing':
          return 'डिजिटल मार्केटिंग';
        case 'meta_ads':
          return 'मेटा ऐड्स (FB & Insta)';
        case 'seo':
          return 'सर्च इंजन ऑप्टिमाइज़ेशन (SEO)';
        case 'google_ads':
          return 'गूगल ऐड्स (PPC & YouTube)';
        case 'web_dev':
          return 'वेबसाइट डेवलपमेंट';
        case 'app_dev':
          return 'मोबाइल ऐप डेवलपमेंट';
        default:
          return service.titleHindi.isNotEmpty ? service.titleHindi : service.titleEnglish;
      }
    } else if (language == AppLanguage.english) {
      switch (service.id) {
        case 'digital_marketing':
          return 'Digital Marketing & Social Growth';
        case 'meta_ads':
          return 'Meta Ads (Facebook & Instagram)';
        case 'seo':
          return 'SEO & Google Ranking';
        case 'google_ads':
          return 'Google Search & YouTube Ads';
        case 'web_dev':
          return 'Modern Web Development';
        case 'app_dev':
          return 'Android & iOS App Development';
        default:
          return service.titleEnglish.isNotEmpty ? service.titleEnglish : service.titleHindi;
      }
    } else {
      return service.titleHindi.isNotEmpty ? service.titleHindi : service.titleEnglish;
    }
  }

  String getServiceShortDesc(ServiceModel service) {
    if (language == AppLanguage.hindi) {
      switch (service.id) {
        case 'digital_marketing':
          return 'सोशल मीडिया ब्रांडिंग, लक्षित ऑडियंस और ऑनलाइन प्रचार से निरंतर बिज़नेस लीड्स प्राप्त करें।';
        case 'meta_ads':
          return 'फेसबुक और इंस्टाग्राम पर लक्षित विज्ञापन चलाकर कम से कम लागत में अधिक से अधिक ग्राहक लीड्स प्राप्त करें।';
        case 'seo':
          return 'गूगल के 1st पेज पर रैंक करें और नियमित मुफ्त ऑर्गेनिक ट्रैफिक और कॉल्स पाएं।';
        case 'google_ads':
          return 'जब ग्राहक गूगल पर आपकी सेवा खोजें, तो सबसे ऊपर आपका विज्ञापन दिखे और तुरंत कॉल्स आएं।';
        case 'web_dev':
          return 'मोबाइल, टैबलेट और कंप्यूटर पर सुपरफास्ट खुलने वाली आधुनिक, आकर्षक और एसईओ-फ्रेंडली वेबसाइट्स।';
        case 'app_dev':
          return 'एंड्रॉइड और आईओएस के लिए आधुनिक, स्मूथ और फीचर-युक्त मोबाइल ऐप्स एडमिन पैनल के साथ।';
        default:
          return service.shortDesc;
      }
    } else if (language == AppLanguage.english) {
      switch (service.id) {
        case 'digital_marketing':
          return 'Scale your brand with strategic social media marketing, audience targeting, and continuous qualified lead generation.';
        case 'meta_ads':
          return 'Run high-converting Facebook & Instagram ads to generate maximum qualified inquiries at the lowest cost.';
        case 'seo':
          return 'Rank on Google\'s 1st page to capture consistent organic buyer traffic, phone calls, and local leads.';
        case 'google_ads':
          return 'Capture ready-to-buy customers instantly with high-intent Google Search, Display, and YouTube PPC ads.';
        case 'web_dev':
          return 'Blazing fast, modern, and SEO-friendly responsive websites tailored for high conversions and user engagement.';
        case 'app_dev':
          return 'Feature-rich, smooth, and scalable mobile applications for Android & iOS with cloud admin dashboards.';
        default:
          return service.shortDesc;
      }
    } else {
      return service.shortDesc;
    }
  }

  String getServiceDetailedDesc(ServiceModel service) {
    if (language == AppLanguage.hindi) {
      switch (service.id) {
        case 'digital_marketing':
          return 'संपूर्ण डिजिटल मार्केटिंग रणनीति जिसमें सोशल मीडिया प्रबंधन, ब्रांड विजिबिलिटी कैंपेन, ग्राहक जुड़ाव और लक्षित लीड जनरेशन शामिल है ताकि आपका ब्रांड टॉप पर रहे।';
        case 'meta_ads':
          return 'मेटा ऐड्स मैनेजर के माध्यम से उन्नत ऑडियंस डेमोग्राफिक, इंटरेस्ट टारगेटिंग और कस्टम री-टारगेटिंग फ़नल जो सीधे आपके व्हाट्सएप या फोन पर इच्छुक ग्राहक लाते हैं।';
        case 'seo':
          return 'संपूर्ण एंड-टू-एंड एसईओ प्रक्रिया जिसमें ऑन-पेज एसईओ, टेक्निकल ऑडिट, गूगल बिजनेस प्रोफाइल (लोकल मैप एसईओ) और हाई-रैंकिंग कीवर्ड रिसर्च शामिल है।';
        case 'google_ads':
          return 'हाई-इंटेंट गूगल सर्च ऐड्स, डिस्प्ले बैनर्स और यूट्यूब वीडियो प्रमोशन जो तुरंत सेवा खरीदने वाले इच्छुक ग्राहकों को सीधे जोड़ते हैं।';
        case 'web_dev':
          return 'कस्टम आधुनिक व्यावसायिक वेबसाइट्स, ई-कॉमर्स स्टोर्स, पोर्टफोलियो साइट्स और लैंडिंग पेज जो तेज़ स्पीड और उच्च रूपांतरण के लिए निर्मित हैं।';
        case 'app_dev':
          return 'क्रॉस-प्लेटफॉर्म फ्लटर ऐप्स जो तेज़, सुरक्षित, हल्की और उपयोगकर्ताओं को 60fps स्मूथ अनुभव प्रदान करती हैं।';
        default:
          return service.detailedDesc.isNotEmpty ? service.detailedDesc : service.shortDesc;
      }
    } else if (language == AppLanguage.english) {
      switch (service.id) {
        case 'digital_marketing':
          return 'Comprehensive digital marketing and social media growth strategies designed to elevate your brand presence, attract high-intent customers, and maximize conversion rates.';
        case 'meta_ads':
          return 'Advanced Meta Ads Manager campaigns with detailed demographic targeting, lookalike audiences, and custom retargeting funnels that drive customers directly to your WhatsApp or CRM.';
        case 'seo':
          return 'Complete end-to-end SEO process including On-Page optimization, Technical audits, Google Business Profile (Local Map SEO), and high-intent keyword targeting.';
        case 'google_ads':
          return 'Target customers at the exact moment they search for your services with precision PPC search campaigns, display network ads, and YouTube video promotions.';
        case 'web_dev':
          return 'Custom modern business websites, e-commerce stores, portfolio platforms, and landing pages engineered for speed, sleek UI/UX, and search engine dominance.';
        case 'app_dev':
          return 'Cross-platform Flutter & cloud-backed mobile applications delivering fluid performance, modern UI/UX, push notifications, and seamless offline experience.';
        default:
          return service.detailedDesc.isNotEmpty ? service.detailedDesc : service.shortDesc;
      }
    } else {
      return service.detailedDesc.isNotEmpty ? service.detailedDesc : service.shortDesc;
    }
  }

  List<String> getServiceBenefits(ServiceModel service) {
    if (language == AppLanguage.hindi) {
      switch (service.id) {
        case 'digital_marketing':
          return [
            'अधिक वास्तविक और इच्छुक ग्राहक पूछताछ',
            'ब्रांड विश्वसनीयता और विश्वास में वृद्धि',
            'स्थानीय और राष्ट्रीय स्तर पर लक्षित पहुंच',
            'साप्ताहिक रिपोर्ट और पारदर्शी एनालिटिक्स',
          ];
        case 'meta_ads':
          return [
            'कम प्रति-लीड लागत (Low CPL)',
            'व्हाट्सएप पर ग्राहकों से सीधी बातचीत',
            'अधिकतम रिटर्न ऑन ऐड स्पेंड (ROAS)',
            'पहले दिन से ही तुरंत पूछताछ',
          ];
        case 'seo':
          return [
            'बिना विज्ञापन खर्च के लगातार ऑर्गेनिक गूगल ट्रैफिक',
            'लोकल मैप सर्च में शीर्ष स्थान',
            'दीर्घकालिक टिकाऊ व्यावसायिक वृद्धि',
            'सर्च इंजन पर उच्च विश्वसनीयता',
          ];
        case 'google_ads':
          return [
            'पहले दिन से तुरंत कॉल्स और पूछताछ',
            'केवल वास्तविक क्लिक्स पर भुगतान (PPC)',
            'खरीदने के इच्छुक ग्राहकों का ट्रैफिक',
            'सटीक लोकेशन टारगेटिंग',
          ];
        case 'web_dev':
          return [
            'व्यवसाय के लिए 24/7 ऑनलाइन उपस्थिति',
            'आधुनिक डिज़ाइन जो ग्राहकों को प्रभावित करे',
            'सुरक्षित एसएसएल, तेज़ होस्टिंग और साफ़ कोड',
            'गूगल पर अच्छी रैंकिंग के लिए एसईओ संरचना',
          ];
        case 'app_dev':
          return [
            'मोबाइल स्क्रीन पर ग्राहकों से सीधा जुड़ाव',
            'ऑफर और अपडेट्स के लिए तुरंत पुश नोटिफिकेशन्स',
            'स्मूथ यूजर इंटरफेस और उच्च सुरक्षा',
            'स्केलेबल क्लाउड इंफ्रास्ट्रक्चर',
          ];
        default:
          return service.benefits;
      }
    } else if (language == AppLanguage.english) {
      switch (service.id) {
        case 'digital_marketing':
          return [
            'High volume of verified, genuine inquiries',
            'Enhanced brand credibility and trust',
            'Targeted local and nationwide reach',
            'Transparent weekly performance reports',
          ];
        case 'meta_ads':
          return [
            'Optimized low cost-per-lead (CPL)',
            'Direct instant customer conversations on WhatsApp',
            'A/B testing for maximum Return on Ad Spend (ROAS)',
            'Immediate customer engagement from Day 1',
          ];
        case 'seo':
          return [
            'Free organic Google traffic without ad spend',
            'Dominance in local Google Map searches',
            'Long-term sustainable business growth',
            'High search visibility & brand authority',
          ];
        case 'google_ads':
          return [
            'Immediate high-intent inquiries from Day 1',
            'Pay only when interested customers click (PPC)',
            'High buyer-intent and ready-to-purchase leads',
            'Precise local & national geo-targeting',
          ];
        case 'web_dev':
          return [
            '24/7 online storefront for your business',
            'Modern aesthetics that build instant credibility',
            'SSL secure, fast cloud hosting, clean architecture',
            'SEO-optimized structure for high rankings',
          ];
        case 'app_dev':
          return [
            'Direct mobile presence on customers\' devices',
            'Instant push notifications for offers and updates',
            'Offline capability & smooth 60fps animations',
            'Scalable, secure cloud infrastructure',
          ];
        default:
          return service.benefits;
      }
    } else {
      return service.benefits;
    }
  }

  // --- Projects Dynamic Translators ---
  String getProjectTitle(ProjectModel project) {
    if (language == AppLanguage.hindi) {
      switch (project.id) {
        case 'p_school':
          return 'स्कूल मैनेजमेंट एवं छात्र पोर्टल';
        case 'p_ecommerce':
          return 'फुल-स्टैक ई-कॉमर्स एवं ऑर्डर स्टोर';
        case 'p_meta_ads':
          return 'लोकल बिज़नेस लीड जनरेशन इंजन';
        case 'p_seo_gmb':
          return 'लोकल एसईओ एवं गूगल मैप पैक रैंकिंग';
        case 'p1':
          return 'ई-कॉमर्स स्टोर एवं ऑर्डर मैनेजमेंट';
        case 'p2':
          return 'रियल एस्टेट मेटा ऐड्स एवं लीड फ़नल';
        default:
          return project.title;
      }
    } else if (language == AppLanguage.english) {
      switch (project.id) {
        case 'p_school':
          return 'School Management & Academia Portal';
        case 'p_ecommerce':
          return 'Full-Stack E-Commerce & Order Store';
        case 'p_meta_ads':
          return 'Local Business Lead Generation Engine';
        case 'p_seo_gmb':
          return 'Local SEO & Google Map Pack Domination';
        case 'p1':
          return 'E-Commerce Store & Order Management';
        case 'p2':
          return 'Real Estate Meta Ads & Lead Funnel';
        default:
          return project.title;
      }
    } else {
      return project.title;
    }
  }

  String getProjectShortDesc(ProjectModel project) {
    if (language == AppLanguage.hindi) {
      switch (project.id) {
        case 'p_school':
          return 'छात्र प्रवेश, हाज़िरी, फीस भुगतान, परीक्षा परिणाम और टाइमटेबल हेतु संपूर्ण आधुनिक वेब ऐप।';
        case 'p_ecommerce':
          return 'उत्पाद कैटलॉग, त्वरित कार्ट, सुरक्षित चेकआउट एवं तेज स्पीड से लैस आधुनिक ऑनलाइन शॉपिंग स्टोर।';
        case 'p_meta_ads':
          return 'लक्षित मेटा व गूगल विज्ञापन अभियान जिसने वास्तविक इच्छुक ग्राहकों की उच्च-गुणवत्ता लीड्स दीं।';
        case 'p_seo_gmb':
          return 'गूगल बिजनेस प्रोफाइल और लोकल कीवर्ड्स अनुकूलन, जिससे कॉल्स और मैप विज़िट्स में 3 गुना वृद्धि हुई।';
        case 'p1':
          return 'शॉपिंग कार्ट, ऑनलाइन पेमेंट, लाइव ऑर्डर ट्रैकिंग और एडमिन डैशबोर्ड से युक्त आधुनिक वेब ऐप।';
        case 'p2':
          return 'लक्षित मेटा व गूगल विज्ञापन अभियान जिसने ₹28 CPL पर 450+ इच्छुक खरीदार लीड्स उत्पन्न कीं।';
        default:
          return project.shortDesc;
      }
    } else if (language == AppLanguage.english) {
      switch (project.id) {
        case 'p_school':
          return 'Complete modern school management web app for student admissions, attendance, fees, exams, and teacher schedules.';
        case 'p_ecommerce':
          return 'Ultra-fast online shopping store with dynamic product catalog, persistent cart, and instant order checkout.';
        case 'p_meta_ads':
          return 'Targeted Meta ads and automated WhatsApp funnel generating high-intent client inquiries.';
        case 'p_seo_gmb':
          return 'Optimized Google Business Profile and local keywords to rank in top 3 Google search results.';
        case 'p1':
          return 'Modern shopping web app with cart, online payments, live order tracking and admin dashboard.';
        case 'p2':
          return 'Targeted Meta & Google Ads campaign generating 450+ high-intent buyer leads at ₹28 CPL.';
        default:
          return project.shortDesc;
      }
    } else {
      return project.shortDesc;
    }
  }

  String getProjectDetailedDesc(ProjectModel project) {
    if (language == AppLanguage.hindi) {
      switch (project.id) {
        case 'p_school':
          return 'छात्रों के डिजिटल प्रोफाइल, उपस्थिति विश्लेषण, स्वचालित फीस चालान, परीक्षा रिपोर्ट कार्ड और शिक्षक-अभिभावक डैशबोर्ड से युक्त आधुनिक शैक्षणिक प्रबंधन प्लेटफ़ॉर्म।';
        case 'p_ecommerce':
          return 'तेज़ उत्पाद खोज, मोबाइल-अनुकूल यूआई, कई पेमेंट गेटवे, तुरंत ऑर्डर रसीद और वास्तविक समय स्टॉक प्रबंधन के साथ उच्च-रूपांतरण ई-कॉमर्स एप्लिकेशन।';
        case 'p_meta_ads':
          return 'लक्षित जनसांख्यिकी के लिए आकर्षक वीडियो और कैरोसेल विज्ञापन डिज़ाइन किए। स्वचालित व्हाट्सएप चैट द्वारा 60 सेकंड के भीतर लीड्स को कनेक्ट किया।';
        case 'p_seo_gmb':
          return 'ऑन-पेज कीवर्ड अनुकूलन, तकनीकी वेबसाइट गति, गूगल मैप साइटेशन्स, लोकल स्कीमा मार्कअप और वास्तविक ग्राहक समीक्षा रणनीति का सफल कार्यान्वयन।';
        case 'p1':
          return 'रिस्पॉन्सिव यूआई, त्वरित उत्पाद खोज, श्रेणी फ़िल्टर, रेज़रपे चेकआउट और वास्तविक समय ऑर्डर स्थिति ट्रैकिंग के साथ निर्मित संपूर्ण डिजिटल स्टोर।';
        case 'p2':
          return 'उच्च-प्रदर्शन लीड जनरेशन अभियान। कस्टम वीडियो क्रिएटिव्स, डायरेक्ट व्हाट्सएप लैंडिंग फ्लो और त्वरित लीड सूचनाएं।';
        default:
          return project.detailedDesc.isNotEmpty ? project.detailedDesc : project.shortDesc;
      }
    } else if (language == AppLanguage.english) {
      switch (project.id) {
        case 'p_school':
          return 'An end-to-end educational management platform featuring interactive student profile records, real-time attendance analytics, automated fee management, exam grade reports, course scheduling, and teacher-parent communication dashboards.';
        case 'p_ecommerce':
          return 'High-conversion online shopping application featuring lightning-fast product filtering, responsive mobile-first UI, secure multi-gateway checkout, order confirmation, and real-time inventory management.';
        case 'p_meta_ads':
          return 'Designed high-converting video and carousel ads targeting regional demographics. Integrated automated WhatsApp chat responses that qualify leads instantly within 60 seconds.';
        case 'p_seo_gmb':
          return 'Conducted full on-page keyword optimization, technical site speed tuning, Google Map citations, local schema markup, and authentic review acquisition strategy.';
        case 'p1':
          return 'A complete digital store built with responsive UI, instant product search, category filters, Razorpay/Stripe checkout, and real-time order status tracking with WhatsApp notifications for business owners.';
        case 'p2':
          return 'Engineered a high-performing lead generation campaign. Created custom video creatives, direct WhatsApp landing flow, and instant CRM lead notifications.';
        default:
          return project.detailedDesc.isNotEmpty ? project.detailedDesc : project.shortDesc;
      }
    } else {
      return project.detailedDesc.isNotEmpty ? project.detailedDesc : project.shortDesc;
    }
  }

  List<String> getProjectKeyFeatures(ProjectModel project) {
    if (language == AppLanguage.hindi) {
      switch (project.id) {
        case 'p_school':
          return [
            'छात्र प्रवेश और डिजिटल रिकॉर्ड प्रबंधन',
            'रियल-टाइम हाज़िरी और परीक्षा ग्रेड एनालिटिक्स',
            'स्वचालित फीस संग्रह और रसीद निर्माण',
            'शिक्षक समय सारिणी और कक्षा डैशबोर्ड',
          ];
        case 'p_ecommerce':
          return [
            'त्वरित उत्पाद खोज और श्रेणी फ़िल्टर',
            'स्थिर शॉपिंग कार्ट और सुरक्षित चेकआउट',
            'ऑर्डर पुष्टि और भुगतान गेटवे',
            '98+ उच्च गति और परफ़ॉर्मेंस स्कोर',
          ];
        case 'p_meta_ads':
          return [
            'लक्षित शहरों और क्षेत्रों के लिए जियो-टारगेटेड विज्ञापन',
            'डायरेक्ट व्हाट्सएप क्लिक-टू-चैट फ़नल',
            'स्वचालित त्वरित प्रतिक्रिया प्रणाली',
            'लगातार कम प्रति-लीड लागत रणनीति',
          ];
        case 'p_seo_gmb':
          return [
            'स्थानीय उच्च-मूल्य कीवर्ड्स पर #1 रैंक',
            '100% सत्यापित और अनुकूलित गूगल बिज़नेस प्रोफ़ाइल',
            'डायरेक्ट फोन कॉल क्लिक्स में 300% वृद्धि',
            'स्वच्छ मेटाडेटा और JSON-LD स्कीमा',
          ];
        case 'p1':
          return [
            'त्वरित खोज और फ़िल्टर के साथ उत्पाद कैटलॉग',
            'रेज़रपे / यूपीआई सुरक्षित ऑनलाइन चेकआउट',
            'रियल-टाइम ऑर्डर मैनेजमेंट डैशबोर्ड',
            'खरीदारी पर स्वचालित व्हाट्सएप सूचनाएं',
          ];
        case 'p2':
          return [
            '30 दिनों में 450+ सत्यापित खरीदार लीड्स',
            'औसत प्रति-लीड लागत ₹28 तक अनुकूलित',
            'तुरंत बातचीत के लिए डायरेक्ट व्हाट्सएप फ्लो',
            'परीक्षण किए गए विज्ञापन कॉपी और क्रिएटिव्स',
          ];
        default:
          return project.keyFeatures;
      }
    } else if (language == AppLanguage.english) {
      switch (project.id) {
        case 'p_school':
          return [
            'Student admissions & digital records management',
            'Real-time attendance & exam grade analytics',
            'Automated fee collection & receipt generation',
            'Teacher schedules & class analytics dashboard',
          ];
        case 'p_ecommerce':
          return [
            'Instant product search & category filters',
            'Persistent cart & frictionless checkout funnel',
            'Responsive UI with order payment confirmation',
            'High-speed page load score 98+',
          ];
        case 'p_meta_ads':
          return [
            'Geo-targeted radius ads for target cities',
            'Direct WhatsApp click-to-chat funnel',
            'Automated instant message response',
            'Continuous CPL reduction strategy',
          ];
        case 'p_seo_gmb':
          return [
            'Ranked #1 for local high-intent keyword searches',
            'Google Business Profile 100% verified & optimized',
            '300% boost in direct phone call clicks',
            'Clean metadata and JSON-LD schema',
          ];
        case 'p1':
          return [
            'Product Catalog with instant search and filters',
            'Razorpay / UPI integrated secure checkout',
            'Real-time order management dashboard',
            'Automated WhatsApp notifications on purchase',
          ];
        case 'p2':
          return [
            '450+ verified buyer leads generated in 30 days',
            'Average Cost-Per-Lead (CPL) optimized to ₹28',
            'Direct WhatsApp inquiry flow for instant sales calls',
            'Comprehensive A/B tested ad copy & creative angles',
          ];
        default:
          return project.keyFeatures;
      }
    } else {
      return project.keyFeatures;
    }
  }

  String getWhyWorkSubtitle(WhyWorkModel item) {
    if (language == AppLanguage.hindi) {
      switch (item.id) {
        case 'w1':
          return 'आसान और शक्तिशाली डिज़ाइन जो ग्राहकों को तुरंत समझ में आए।';
        case 'w2':
          return 'आधुनिक टेक्नोलॉजी (Next.js, Flutter) से बनी सुपरफास्ट और सुरक्षित एप्लिकेशन।';
        case 'w3':
          return 'मोबाइल, टैबलेट और कंप्यूटर हर स्क्रीन पर बेहतरीन और स्मूथ अनुभव।';
        case 'w4':
          return 'सिर्फ दिखावा नहीं, वास्तविक बिक्री, लीड्स और मुनाफा बढ़ाने वाली रणनीति।';
        case 'w5':
          return 'सीधा कॉल और व्हाट्सएप सपोर्ट, समय पर अपडेट्स और तुरंत समाधान।';
        case 'w6':
          return 'आपके व्यवसाय और बजट के अनुसार कस्टमाइज़्ड पैकेजेस।';
        default:
          return item.subtitleHindi;
      }
    } else if (language == AppLanguage.english) {
      switch (item.id) {
        case 'w1':
          return 'Intuitive, user-friendly designs that captivate customers immediately.';
        case 'w2':
          return 'Built with cutting-edge tech (Next.js, Flutter) for ultra-fast performance.';
        case 'w3':
          return '100% responsive and seamless across mobile, tablet, and desktop screens.';
        case 'w4':
          return 'Conversion-first strategies engineered to maximize sales and business ROI.';
        case 'w5':
          return 'Direct phone & WhatsApp support with prompt communication and on-time delivery.';
        case 'w6':
          return 'Custom solutions tailored specifically to your business goals and budget.';
        default:
          return item.subtitleHindi;
      }
    } else {
      return item.subtitleHindi;
    }
  }

  String getWhyWorkTitle(WhyWorkModel item) {
    if (language == AppLanguage.hindi) {
      switch (item.id) {
        case 'w1':
          return 'उपयोगकर्ता-अनुकूल समाधान';
        case 'w2':
          return 'आधुनिक टेक्नोलॉजी';
        case 'w3':
          return 'रिस्पॉन्सिव डिज़ाइन';
        case 'w4':
          return 'व्यावसायिक दृष्टिकोण';
        case 'w5':
          return 'त्वरित संवाद एवं सहायता';
        case 'w6':
          return 'कस्टमाइज़्ड समाधान';
        default:
          return item.title;
      }
    } else if (language == AppLanguage.english) {
      switch (item.id) {
        case 'w1':
          return 'User-Friendly Design';
        case 'w2':
          return 'Cutting-Edge Tech';
        case 'w3':
          return 'Responsive & Fast';
        case 'w4':
          return 'Business & ROI Focused';
        case 'w5':
          return 'Direct Support';
        case 'w6':
          return 'Tailored Solutions';
        default:
          return item.title;
      }
    }
    return item.title;
  }
}
