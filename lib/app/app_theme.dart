import 'package:flutter/material.dart';

class GermanFlagColors {
  static const black = Color(0xFF000000);
  static const red = Color(0xFFDD0000);
  static const yellow = Color(0xFFFFCE00);

  // Extended palette for better contrast and hierarchy
  static const redDark = Color(0xFFAA0000);
  static const redLight = Color(0xFFFF4444);
  static const yellowDark = Color(0xFFDDB000);
  static const yellowLight = Color(0xFFFFF4CC);
  static const blackLight = Color(0xFF333333);
  static const grayLight = Color(0xFFEEEEEE);
}

final ThemeData appThemeGermanFlag = ThemeData(
  useMaterial3: true,

  // 🇩🇪 German flag-inspired color scheme
  colorScheme: ColorScheme.light(
    // Primary: Red (main actions, emphasis)
    primary: GermanFlagColors.red,
    primaryContainer: GermanFlagColors.redLight.withValues(alpha: 0.2),
    onPrimaryContainer: GermanFlagColors.redDark,

    // Secondary: Black (headers, important text)
    secondary: GermanFlagColors.black,
    onSecondary: GermanFlagColors.yellow,
    secondaryContainer: GermanFlagColors.blackLight.withValues(alpha: 0.1),
    onSecondaryContainer: GermanFlagColors.black,

    // Tertiary: Yellow accent
    tertiary: GermanFlagColors.yellowDark,
    onTertiary: GermanFlagColors.black,
    tertiaryContainer: GermanFlagColors.yellowLight,
    onTertiaryContainer: GermanFlagColors.blackLight,

    // Surface: Clean light backgrounds
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: GermanFlagColors.grayLight,
    surfaceContainer: GermanFlagColors.yellowLight.withValues(alpha: 0.3),
    surfaceContainerHigh: GermanFlagColors.yellowLight.withValues(alpha: 0.5),
    surfaceContainerHighest: GermanFlagColors.yellowLight,
    onSurfaceVariant: GermanFlagColors.blackLight,

    // Outline
    outline: GermanFlagColors.blackLight.withValues(alpha: 0.2),
    outlineVariant: GermanFlagColors.yellowDark.withValues(alpha: 0.3),

    // Error
    error: GermanFlagColors.red,
    errorContainer: GermanFlagColors.redLight.withValues(alpha: 0.15),
    onErrorContainer: GermanFlagColors.redDark,

    // Other
    shadow: GermanFlagColors.black.withValues(alpha: 0.1),
    scrim: GermanFlagColors.black.withValues(alpha: 0.5),
    inverseSurface: GermanFlagColors.black,
    onInverseSurface: GermanFlagColors.yellow,
    inversePrimary: GermanFlagColors.yellowDark,
  ),

  // Light yellow scaffold background
  scaffoldBackgroundColor: GermanFlagColors.yellowLight.withValues(alpha: 0.3),

  // Black app bar with yellow text
  appBarTheme: const AppBarTheme(
    backgroundColor: GermanFlagColors.black,
    foregroundColor: GermanFlagColors.yellow,
    iconTheme: IconThemeData(color: GermanFlagColors.yellow),
    actionsIconTheme: IconThemeData(color: GermanFlagColors.yellow),
  ),

  // Cards with subtle elevation
  cardTheme: const CardThemeData(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),

  // Chips
  chipTheme: ChipThemeData(
    backgroundColor: GermanFlagColors.yellowLight,
    selectedColor: GermanFlagColors.red,
    disabledColor: GermanFlagColors.blackLight.withValues(alpha: 0.1),
    labelStyle: const TextStyle(color: GermanFlagColors.black),
    secondaryLabelStyle: const TextStyle(color: Colors.white),
    checkmarkColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  ),

  // Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: GermanFlagColors.red,
    foregroundColor: Colors.white,
  ),

  // Input decoration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: GermanFlagColors.yellowLight.withValues(alpha: 0.3),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:
          BorderSide(color: GermanFlagColors.blackLight.withValues(alpha: 0.2)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide:
          BorderSide(color: GermanFlagColors.blackLight.withValues(alpha: 0.2)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: GermanFlagColors.red, width: 2),
    ),
  ),

  // List tiles
  listTileTheme: const ListTileThemeData(
    iconColor: GermanFlagColors.blackLight,
  ),

  // Dividers
  dividerTheme: DividerThemeData(
    color: GermanFlagColors.blackLight.withValues(alpha: 0.1),
  ),

  // Typography
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w700,
      color: GermanFlagColors.black,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      color: GermanFlagColors.black,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      color: GermanFlagColors.blackLight,
    ),
    bodyLarge: TextStyle(color: GermanFlagColors.black),
    bodyMedium: TextStyle(color: GermanFlagColors.blackLight),
  ),

  // Icon theme
  iconTheme: const IconThemeData(
    color: GermanFlagColors.blackLight,
  ),
);

final appThemeLight = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0F4C81),
  ),
  useMaterial3: true,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontWeight: FontWeight.w600),
  ),
);

final appThemeDark = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0F4C81),
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w700),
    titleLarge: TextStyle(fontWeight: FontWeight.w600),
  ),
);
