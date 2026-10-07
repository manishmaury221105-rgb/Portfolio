import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static const String phoneNumber = '9214468818';
  static const String countryCode = '+91';
  static const String fullPhoneNumber = '+91 9214468818';
  static const String defaultEmail = 'manishdigital99@gmail.com';
  static const String locationName = 'Harahua, Varanasi, Uttar Pradesh, India';
  static const String githubProfile = 'https://github.com';
  static const String linkedinProfile = 'https://linkedin.com';

  /// Helper to extract clean 10-digit Indian phone number or standard international digits
  static String _normalizePhone(String rawPhone) {
    String digits = rawPhone.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.startsWith('91') && digits.length == 12) {
      return digits.substring(2);
    }
    if (digits.startsWith('0') && digits.length == 11) {
      return digits.substring(1);
    }
    return digits;
  }

  /// Launch WhatsApp chat directly with a pre-filled greeting message in Hinglish/Hindi
  static Future<bool> openWhatsApp({
    String? phone,
    String? message,
    BuildContext? context,
  }) async {
    final targetPhone = (phone != null && phone.trim().isNotEmpty) ? phone : phoneNumber;
    final text = message ??
        'Namaste Manish ji! Maine aapka portfolio website dekha aur mujhe aapke Digital Marketing / Web & App Development services ke bare me baat karni hai.';

    final cleanDigits = _normalizePhone(targetPhone);
    final finalWhatsAppPhone = cleanDigits.length == 10 ? '91$cleanDigits' : cleanDigits;
    final uri = Uri.parse('https://wa.me/$finalWhatsAppPhone?text=${Uri.encodeComponent(text)}');

    try {
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('WhatsApp open nahi ho paya. Please call directly.')),
          );
        }
        return false;
      }
    } catch (e) {
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error launching WhatsApp: $e')),
        );
      }
      return false;
    }
  }

  /// Make direct phone call
  static Future<bool> makePhoneCall({
    String phone = phoneNumber,
    BuildContext? context,
  }) async {
    final cleanDigits = _normalizePhone(phone);
    final finalTel = cleanDigits.length == 10 ? '+91$cleanDigits' : '+$cleanDigits';
    final uri = Uri.parse('tel:$finalTel');

    try {
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri);
      } else {
        if (context != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Dialer open nahi ho saka: $phone')),
          );
        }
        return false;
      }
    } catch (e) {
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error calling: $e')),
        );
      }
      return false;
    }
  }

  /// Send Email
  static Future<bool> sendEmail({
    String email = defaultEmail,
    String subject = 'Project Enquiry - Digital Manish Portfolio',
    String body = 'Hello Manish,\n\nI want to discuss a project with you regarding...',
    BuildContext? context,
  }) async {
    final uri = Uri.parse('mailto:$email?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}');
    try {
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri);
      } else {
        if (context != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email app nahi mila: $email')),
          );
        }
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Open Google Maps for Harahua, Varanasi
  static Future<bool> openMapLocation({
    String query = locationName,
    BuildContext? context,
  }) async {
    final uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}');
    try {
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Open external URL
  static Future<bool> openLink(String url, {BuildContext? context}) async {
    if (url.trim().isEmpty) return false;
    String formattedUrl = url.trim();
    if (!formattedUrl.startsWith('http://') && !formattedUrl.startsWith('https://')) {
      formattedUrl = 'https://$formattedUrl';
    }
    final parsed = Uri.tryParse(formattedUrl);
    if (parsed == null) return false;

    try {
      if (await canLaunchUrl(parsed)) {
        return await launchUrl(parsed, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Link open nahi ho payi: $url')),
        );
      }
    }
    return false;
  }

  /// Share Portfolio Link / Vcard
  static Future<void> sharePortfolio({BuildContext? context}) async {
    const text = '''
✨ Digital Manish - Digital Marketing | Website & App Development
📍 Harahua, Varanasi, Uttar Pradesh
📞 +91 9214468818
🌐 Check out my portfolio and contact for modern business websites, mobile apps, Meta ads & SEO!
''';
    final box = context != null ? (context.findRenderObject() as RenderBox?) : null;
    final origin = box != null ? (box.localToGlobal(Offset.zero) & box.size) : null;

    try {
      await SharePlus.instance.share(
        ShareParams(
          text: text,
          subject: 'Digital Manish - Digital Portfolio',
          sharePositionOrigin: origin,
        ),
      );
    } catch (_) {
      // Fallback
    }
  }
}
