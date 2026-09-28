import 'package:flutter/material.dart';

class AppIconsHelper {
  static final Map<int, IconData> _iconMap = {
    Icons.trending_up_rounded.codePoint: Icons.trending_up_rounded,
    Icons.campaign_rounded.codePoint: Icons.campaign_rounded,
    Icons.search_rounded.codePoint: Icons.search_rounded,
    Icons.ads_click_rounded.codePoint: Icons.ads_click_rounded,
    Icons.laptop_mac_rounded.codePoint: Icons.laptop_mac_rounded,
    Icons.phone_android_rounded.codePoint: Icons.phone_android_rounded,
    Icons.storefront_rounded.codePoint: Icons.storefront_rounded,
    Icons.rocket_launch_rounded.codePoint: Icons.rocket_launch_rounded,
    Icons.code_rounded.codePoint: Icons.code_rounded,
    Icons.cloud_done_rounded.codePoint: Icons.cloud_done_rounded,
    Icons.auto_awesome_rounded.codePoint: Icons.auto_awesome_rounded,
    Icons.support_agent_rounded.codePoint: Icons.support_agent_rounded,
    Icons.sentiment_very_satisfied_rounded.codePoint: Icons.sentiment_very_satisfied_rounded,
    Icons.bolt_rounded.codePoint: Icons.bolt_rounded,
    Icons.devices_rounded.codePoint: Icons.devices_rounded,
    Icons.pie_chart_outline_rounded.codePoint: Icons.pie_chart_outline_rounded,
    Icons.mark_chat_read_rounded.codePoint: Icons.mark_chat_read_rounded,
    Icons.verified_rounded.codePoint: Icons.verified_rounded,
    Icons.security_rounded.codePoint: Icons.security_rounded,
    Icons.speed_rounded.codePoint: Icons.speed_rounded,
    Icons.miscellaneous_services_rounded.codePoint: Icons.miscellaneous_services_rounded,
    Icons.star_rounded.codePoint: Icons.star_rounded,
    Icons.work_outline_rounded.codePoint: Icons.work_outline_rounded,
    Icons.lightbulb_outline_rounded.codePoint: Icons.lightbulb_outline_rounded,
    Icons.bar_chart_rounded.codePoint: Icons.bar_chart_rounded,
    Icons.public_rounded.codePoint: Icons.public_rounded,
    Icons.chat_bubble_outline_rounded.codePoint: Icons.chat_bubble_outline_rounded,
  };

  static IconData getIcon(int codePoint, {IconData fallback = Icons.miscellaneous_services_rounded}) {
    return _iconMap[codePoint] ?? fallback;
  }
}
