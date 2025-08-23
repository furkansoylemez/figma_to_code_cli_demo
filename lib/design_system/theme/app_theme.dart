import 'package:flutter/material.dart';
import 'extensions/colors.dart';
import 'extensions/typography.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      extensions: [CustomColors.light(), CustomTypography.create()],
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      extensions: [CustomColors.dark(), CustomTypography.create()],
    );
  }
}
