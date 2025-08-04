import 'package:flutter/material.dart';

class CustomBorderRadius extends ThemeExtension<CustomBorderRadius> {
  const CustomBorderRadius({
    required this.none,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.full,
  });

  final BorderRadius none;
  final BorderRadius sm;
  final BorderRadius md;
  final BorderRadius lg;
  final BorderRadius xl;
  final BorderRadius full;

  @override
  CustomBorderRadius copyWith({
    BorderRadius? none,
    BorderRadius? sm,
    BorderRadius? md,
    BorderRadius? lg,
    BorderRadius? xl,
    BorderRadius? full,
  }) {
    return CustomBorderRadius(
      none: none ?? this.none,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      full: full ?? this.full,
    );
  }

  @override
  CustomBorderRadius lerp(ThemeExtension<CustomBorderRadius>? other, double t) {
    if (other is! CustomBorderRadius) {
      return this;
    }
    return CustomBorderRadius(
      none: BorderRadius.lerp(none, other.none, t)!,
      sm: BorderRadius.lerp(sm, other.sm, t)!,
      md: BorderRadius.lerp(md, other.md, t)!,
      lg: BorderRadius.lerp(lg, other.lg, t)!,
      xl: BorderRadius.lerp(xl, other.xl, t)!,
      full: BorderRadius.lerp(full, other.full, t)!,
    );
  }

  static CustomBorderRadius appBorderRadius = const CustomBorderRadius(
    none: BorderRadius.zero,
    sm: BorderRadius.all(Radius.circular(4)),
    md: BorderRadius.all(Radius.circular(8)),
    lg: BorderRadius.all(Radius.circular(12)),
    xl: BorderRadius.all(Radius.circular(16)),
    full: BorderRadius.all(Radius.circular(9999)),
  );
}
