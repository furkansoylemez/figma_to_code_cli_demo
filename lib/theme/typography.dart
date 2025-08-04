import 'package:flutter/material.dart';

class CustomTypography extends ThemeExtension<CustomTypography> {
  const CustomTypography({
    required this.body,
    required this.caption,
    required this.title,
    required this.subtitle,
    required this.heading,
    required this.display,
  });

  final TextStyle body;
  final TextStyle caption;
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle heading;
  final TextStyle display;

  @override
  CustomTypography copyWith({
    TextStyle? body,
    TextStyle? caption,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? heading,
    TextStyle? display,
  }) {
    return CustomTypography(
      body: body ?? this.body,
      caption: caption ?? this.caption,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      heading: heading ?? this.heading,
      display: display ?? this.display,
    );
  }

  @override
  CustomTypography lerp(ThemeExtension<CustomTypography>? other, double t) {
    if (other is! CustomTypography) {
      return this;
    }
    return CustomTypography(
      body: TextStyle.lerp(body, other.body, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      heading: TextStyle.lerp(heading, other.heading, t)!,
      display: TextStyle.lerp(display, other.display, t)!,
    );
  }

  static final CustomTypography appTypography = CustomTypography(
    body: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    caption: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    title: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    subtitle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    heading: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    display: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
  );
}
