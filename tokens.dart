import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Central design tokens for the SATIC site.
/// Mirrors the palette used in the club's own logo (red / yellow split brain
/// inside a lightbulb) instead of a generic Material palette.
class AppColors {
  static const paper = Color(0xFFF1F3EC);
  static const paperAlt = Color(0xFFE8EBE0);
  static const ink = Color(0xFF17140F);
  static const inkSoft = Color(0xFF4A4638);
  static const red = Color(0xFFBE3A2B);
  static const yellow = Color(0xFFDDA130);
  static const line = Color(0x2417140F); // ink @ 14%
}

class AppText {
  static TextStyle display({
    double size = 48,
    FontWeight weight = FontWeight.w600,
    Color color = AppColors.ink,
    FontStyle style = FontStyle.normal,
    double? height,
    double letterSpacing = -0.01,
  }) =>
      GoogleFonts.fraunces(
        fontSize: size,
        fontWeight: weight,
        color: color,
        fontStyle: style,
        height: height,
        letterSpacing: letterSpacing,
      );

  static TextStyle body({
    double size = 16,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.ink,
    double? height,
  }) =>
      GoogleFonts.ibmPlexSans(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      );

  static TextStyle mono({
    double size = 13,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.inkSoft,
    double letterSpacing = 0.08,
  }) =>
      GoogleFonts.ibmPlexMono(
        fontSize: size,
        fontWeight: weight,
        color: color,
        letterSpacing: letterSpacing,
      );
}

/// Breakpoints used across the responsive layout.
class Breakpoints {
  static const mobile = 700.0;
  static const tablet = 1000.0;
  static const wrap = 1180.0;
}

double horizontalPadding(double width) {
  if (width < Breakpoints.mobile) return 20;
  if (width < Breakpoints.tablet) return 40;
  return 64;
}
