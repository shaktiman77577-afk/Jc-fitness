import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'JC Fitness';

  // ── PHASE 1: hardcoded test user ──
  // Phase 2 mein ise backend API verification se replace karenge.
  static const Set<String> validUserIds = {'7'};

  static const List<String> gymTimeSlots = [
    '5:00 AM – 7:00 AM',
    '7:00 AM – 9:00 AM',
    '9:00 AM – 11:00 AM',
    '5:00 PM – 7:00 PM',
    '7:00 PM – 9:00 PM',
    '9:00 PM – 11:00 PM',
  ];
}

class AppColors {
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldBright = Color(0xFFF5C518);
  static const Color black = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF161616);
  static const Color card = Color(0xFF1E1E1E);
  static const Color border = Color(0xFF2A2A2A);
  static const Color textGrey = Color(0xFF9E9E9E);
  static const Color danger = Color(0xFFE05353);
}
