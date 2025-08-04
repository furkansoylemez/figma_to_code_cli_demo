import 'package:flutter/material.dart';
import 'app_colors.dart';

class CustomShadows extends ThemeExtension<CustomShadows> {
  const CustomShadows({
    required this.none,
    required this.sm,
    required this.md,
    required this.lg,
  });

  final List<BoxShadow> none;
  final List<BoxShadow> sm;
  final List<BoxShadow> md;
  final List<BoxShadow> lg;

  @override
  CustomShadows copyWith({
    List<BoxShadow>? none,
    List<BoxShadow>? sm,
    List<BoxShadow>? md,
    List<BoxShadow>? lg,
  }) {
    return CustomShadows(
      none: none ?? this.none,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  @override
  CustomShadows lerp(ThemeExtension<CustomShadows>? other, double t) {
    if (other is! CustomShadows) {
      return this;
    }
    // For shadows, we'll use the first theme's shadows for simplicity
    // since interpolating BoxShadow lists is complex
    return this;
  }

  static CustomShadows appShadows = CustomShadows(
    none: const [],
    sm: [
      BoxShadow(
        color: AppColors.blackWithHalfOpacity,
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
    md: [
      BoxShadow(
        color: AppColors.blackWithHalfOpacity,
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
    lg: [
      BoxShadow(
        color: AppColors.blackWithHalfOpacity,
        blurRadius: 16,
        offset: const Offset(0, 8),
      ),
    ],
  );
}
