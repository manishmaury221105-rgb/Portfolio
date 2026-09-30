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
    if (val == 'english') return AppLanguage.english;
    return AppLanguage.hinglish;
  }
}

/// Central Localization & Translation Engine for Manish Maurya Portfolio.
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
        return 'डिजिटल मार्केटिंग और फुल-स्टैक वेब/ऐप डेवलपर';
      case AppLanguage.hinglish:
        return 'Digital Marketing & Full-Stack Web/App Developer';
      case AppLanguage.english:
        return 'Digital Marketing & Full-Stack Web/App Developer';
    }
  }

  String get heroSubtitle {
    switch (language) {
      case AppLanguage.hindi:
        return 'वाराणसी और पूरे भारत के व्यवसायों को हाई-कन्वर्टिंग मेटा ऐड्स, गूगल एसईओ और आधुनिक वेब/ऐप सॉल्यूशंस से आगे बढ़ाना।';
      case AppLanguage.hinglish:
        return 'Varanasi aur All India me businesses ko superfast websites, targeted Meta ads aur Google ranking se scale karna.';
      case AppLanguage.english:
        return 'Scaling businesses across India with high-converting Meta Ads, Google SEO, and modern Web/App solutions.';
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
        return 'Proven solutions driving measurable ROI, high conversion rates, and growth.';
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
        return 'नमस्ते! मैं मनीष मौर्य हूँ';
      case AppLanguage.hinglish:
        return 'Namaste! I am Manish Maurya';
      case AppLanguage.english:
        return 'Hello! I am Manish Maurya';
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
        return 'Ready to launch a new project or scale marketing? Reach out directly via WhatsApp or Phone.';
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
    switch (language) {
      case AppLanguage.hindi:
        return service.titleHindi.isNotEmpty ? service.titleHindi : service.titleEnglish;
      case AppLanguage.english:
        return service.titleEnglish.isNotEmpty ? service.titleEnglish : service.titleHindi;
      case AppLanguage.hinglish:
        return service.titleHindi.isNotEmpty ? service.titleHindi : service.titleEnglish;
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
    }
    return item.title;
  }
}
