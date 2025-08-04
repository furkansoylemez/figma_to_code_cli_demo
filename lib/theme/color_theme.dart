import 'package:flutter/material.dart';
import 'app_colors.dart'; // adjust the import path as needed

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.white,
    required this.black,
    required this.blackWithHalfOpacity,
  });

  final Color white;
  final Color black;
  final Color blackWithHalfOpacity;

  @override
  CustomColors copyWith({
    Color? white,
    Color? black,
    Color? blackWithHalfOpacity,
  }) {
    return CustomColors(
      white: white ?? this.white,
      black: black ?? this.black,
      blackWithHalfOpacity: blackWithHalfOpacity ?? this.blackWithHalfOpacity,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;

    return CustomColors(
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      blackWithHalfOpacity: Color.lerp(
        blackWithHalfOpacity,
        other.blackWithHalfOpacity,
        t,
      )!,
    );
  }

  static const CustomColors appColors = CustomColors(
    white: AppColors.white,
    black: AppColors.black,
    blackWithHalfOpacity: AppColors.blackWithHalfOpacity,
  );
}
