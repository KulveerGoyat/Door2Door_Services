import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(

    bodyLarge: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),

    headlineLarge: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
    headlineSmall: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w400, // Regular weight for the subtitle
      letterSpacing: 0.25, // Letter spacing for clarity
    ),

  );

  static TextTheme darkTextTheme = TextTheme(

    bodyLarge: GoogleFonts.poppins(
      color: Colors.white70,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),

    // Headline large style for dark mode
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.white70,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),

    // Headline small style for dark mode
    headlineSmall: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
  );
}

