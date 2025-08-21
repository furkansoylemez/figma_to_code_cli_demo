import 'package:flutter/material.dart';
import 'color_theme.dart';

/// Pre-configured theme instances with CustomColors extensions applied.
/// Use these theme instances directly in your MaterialApp.
class AppTheme {
  AppTheme._();

  /// Light theme with CustomColors extension.
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(),
    extensions: <ThemeExtension<dynamic>>[
      CustomColors.lightTheme,
    ],
  );

  /// Dark theme with CustomColors extension.
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(),
    extensions: <ThemeExtension<dynamic>>[
      CustomColors.darkTheme,
    ],
  );

  /// Get all available theme modes.
  static Map<String, ThemeData> get allThemes => {
    'Light': light,
    'Dark': dark,
  };

  /// Get theme by mode name.
  static ThemeData? getThemeByMode(String mode) {
    return allThemes[mode];
  }

  /// Get all available mode names.
  static List<String> get availableModes => [
    'Light',
    'Dark',
  ];

}
