import 'dart:ui';

import 'package:flutter/material.dart';

class AppColor {
  // Colors

  // Backgrounds
  static Color black = const Color(0xFF363636);
  static Color olive = const Color(0xFF959987);
  static Color fadeGreen = const Color(0xFFB2B6A4);
  static Color beige = const Color(0xFFFCF9F4);

  // Texts
  static Color darkText = const Color(0xFF757969);
  static Color darkSubtitle = const Color(0xFF959987);
  static Color lightTitle = const Color(0xFFFFFFFF);
  static Color lightText = const Color(0xFFEBEDE5);

  static MaterialColor oliveSwatch = MaterialColor(
    olive.value,
    <int, Color>{
      50: const Color(0xFFF2F3F0),
      100: const Color(0xFFDEE0D9),
      200: const Color(0xFFC9CCBF),
      300: const Color(0xFFB3B8A4),
      400: const Color(0xFFA3A890),
      500: olive,
      600: const Color(0xFF878A7B),
      700: const Color(0xFF77796B),
      800: const Color(0xFF67695C),
      900: const Color(0xFF4F5143),
    },
  );

}