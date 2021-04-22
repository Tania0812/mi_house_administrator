import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLightTheme {
  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
      textTheme: GoogleFonts.openSansTextTheme(),
      primaryColor: const Color(0xFF3F4FA6),
    );
  }
}
