import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static const primaryColor = AppColors.primaryColor;

  static final headingTextStyle = GoogleFonts.openSans(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final valueTextStyle = GoogleFonts.openSans(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final bodyTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    color: Colors.white,
  );
}