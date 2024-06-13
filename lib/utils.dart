import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const milkWhite = Color.fromARGB(255, 238, 238, 238);
  static const offWhite = Color.fromARGB(255, 192, 192, 192);
  static const technoBlack = Color.fromARGB(255, 28, 28, 30);
  static const softBlack = Color.fromARGB(255, 48, 45, 45);
  static const lightBlue = Color.fromARGB(255, 102, 215, 252);
  static const darkBlue = Color.fromARGB(255, 1, 75, 145);
  static const lightRed = Color.fromARGB(255, 255, 68, 68);
  static const darkRed = Color.fromARGB(255, 156, 0, 0);
}

// Theme
class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: AppColors.technoBlack,
      background: AppColors.offWhite,
      secondary: AppColors.softBlack,
      primaryContainer: AppColors.milkWhite,
      onPrimary: AppColors.technoBlack,
      shadow: AppColors.softBlack,
      surface: AppColors.lightBlue,
      error: AppColors.lightRed,
    ),
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.milkWhite,
      background: AppColors.softBlack,
      secondary: AppColors.offWhite,
      primaryContainer: AppColors.technoBlack,
      onPrimary: AppColors.milkWhite,
      shadow: AppColors.offWhite,
      surface: AppColors.darkBlue,
      error: AppColors.darkRed,
    ),
    brightness: Brightness.dark,
  );
}

// Text Style
TextStyle textStyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.firaSans(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}
