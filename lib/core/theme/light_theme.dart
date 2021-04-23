import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLightTheme {
  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      textTheme: GoogleFonts.openSansTextTheme(),
      primaryColor: const Color(0xFF4369CC),
      accentColor: const Color(0xFFffc300),
      inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
    );
  }
}
