import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tick_watch/util/app_color.dart';

class AppTheme {
  ThemeData appTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          displayLarge: TextStyle(color: AppColors.primaryColor),
          titleLarge: TextStyle(color: AppColors.primaryColor),
          bodyMedium: TextStyle(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
