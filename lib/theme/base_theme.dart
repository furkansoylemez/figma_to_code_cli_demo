import 'package:figma_to_code_light/theme/border_radius_theme.dart';
import 'package:figma_to_code_light/theme/color_theme.dart';
import 'package:figma_to_code_light/theme/shadow_theme.dart';
import 'package:figma_to_code_light/theme/spacing_theme.dart';
import 'package:figma_to_code_light/theme/typography.dart';
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  extensions: <ThemeExtension<dynamic>>[
    CustomColors.appColors,
    CustomBorderRadius.appBorderRadius,
    CustomShadows.appShadows,
    CustomSpacing.appSpacing,
    CustomTypography.appTypography,
  ],
);
