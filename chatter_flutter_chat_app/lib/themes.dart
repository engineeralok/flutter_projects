import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const secondry = Color(0xFF3876f6);
  static const accent = Color(0xFFd67558);
  static const textDark = Color(0xFF53585a);
  static const textLight = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899a5);
  static const iconLight = Color(0xFFb1b4c0);
  static const iconDark = Color(0xFFb1b3c1);
  static const textHighlight = secondry;
  static const cardLight = Color(0xFFF9FaFe);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xff1b1e1f);
  static const card = AppColors.cardDark;
}

//Referencec to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  // Light theme and its settings.
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme:
            GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
        backgroundColor: _LightColors.background,
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
      );

  // Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: AppColors.textLight,
        ),
        backgroundColor: _DarkColors.background,
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        primaryTextTheme:
            const TextTheme(headline6: TextStyle(color: AppColors.iconLight)),
      );
}
