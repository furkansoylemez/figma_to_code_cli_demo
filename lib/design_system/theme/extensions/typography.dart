import 'package:flutter/material.dart';

class CustomTypography extends ThemeExtension<CustomTypography> {
  final TextStyle display2xlRegular;
  final TextStyle display2xlMedium;
  final TextStyle display2xlSemibold;
  final TextStyle display2xlBold;
  final TextStyle displayXlRegular;
  final TextStyle displayXlMedium;
  final TextStyle displayXlSemibold;
  final TextStyle displayXlBold;
  final TextStyle displayLgRegular;
  final TextStyle displayLgMedium;
  final TextStyle displayLgSemibold;
  final TextStyle displayLgBold;
  final TextStyle displayMdRegular;
  final TextStyle displayMdMedium;
  final TextStyle displayMdSemibold;
  final TextStyle displayMdBold;
  final TextStyle displaySmRegular;
  final TextStyle displaySmMedium;
  final TextStyle displaySmSemibold;
  final TextStyle displaySmBold;
  final TextStyle displayXsRegular;
  final TextStyle displayXsMedium;
  final TextStyle displayXsSemibold;
  final TextStyle displayXsBold;
  final TextStyle interSemiBold;
  final TextStyle interRegular;
  final TextStyle textXlRegular;
  final TextStyle textXlMedium;
  final TextStyle textXlSemibold;
  final TextStyle textXlBold;
  final TextStyle textLgRegular;
  final TextStyle textLgMedium;
  final TextStyle textLgSemibold;
  final TextStyle textLgBold;
  final TextStyle textMdRegular;
  final TextStyle textMdMedium;
  final TextStyle textMdSemibold;
  final TextStyle textMdBold;
  final TextStyle textSmRegular;
  final TextStyle textSmMedium;
  final TextStyle textSmSemibold;
  final TextStyle textSmBold;
  final TextStyle textXsRegular;
  final TextStyle textXsMedium;
  final TextStyle textXsSemibold;
  final TextStyle textXsBold;
  final TextStyle semanticHeading1;
  final TextStyle semanticLink;
  final TextStyle timesNewRomanRegular;

  const CustomTypography({
    required this.display2xlRegular,
    required this.display2xlMedium,
    required this.display2xlSemibold,
    required this.display2xlBold,
    required this.displayXlRegular,
    required this.displayXlMedium,
    required this.displayXlSemibold,
    required this.displayXlBold,
    required this.displayLgRegular,
    required this.displayLgMedium,
    required this.displayLgSemibold,
    required this.displayLgBold,
    required this.displayMdRegular,
    required this.displayMdMedium,
    required this.displayMdSemibold,
    required this.displayMdBold,
    required this.displaySmRegular,
    required this.displaySmMedium,
    required this.displaySmSemibold,
    required this.displaySmBold,
    required this.displayXsRegular,
    required this.displayXsMedium,
    required this.displayXsSemibold,
    required this.displayXsBold,
    required this.interSemiBold,
    required this.interRegular,
    required this.textXlRegular,
    required this.textXlMedium,
    required this.textXlSemibold,
    required this.textXlBold,
    required this.textLgRegular,
    required this.textLgMedium,
    required this.textLgSemibold,
    required this.textLgBold,
    required this.textMdRegular,
    required this.textMdMedium,
    required this.textMdSemibold,
    required this.textMdBold,
    required this.textSmRegular,
    required this.textSmMedium,
    required this.textSmSemibold,
    required this.textSmBold,
    required this.textXsRegular,
    required this.textXsMedium,
    required this.textXsSemibold,
    required this.textXsBold,
    required this.semanticHeading1,
    required this.semanticLink,
    required this.timesNewRomanRegular,
  });

  CustomTypography.create()
    : display2xlRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 72,
        height: 1.25,
        letterSpacing: -1.44,
      ), // Display 2xl/Regular
      display2xlMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 72,
        height: 1.25,
        letterSpacing: -1.44,
      ), // Display 2xl/Medium
      display2xlSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 72,
        height: 1.25,
        letterSpacing: -1.44,
      ), // Display 2xl/Semibold
      display2xlBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 72,
        height: 1.25,
        letterSpacing: -1.44,
      ), // Display 2xl/Bold
      displayXlRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 60,
        height: 1.2,
        letterSpacing: -1.2,
      ), // Display xl/Regular
      displayXlMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 60,
        height: 1.2,
        letterSpacing: -1.2,
      ), // Display xl/Medium
      displayXlSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 60,
        height: 1.2,
        letterSpacing: -1.2,
      ), // Display xl/Semibold
      displayXlBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 60,
        height: 1.2,
        letterSpacing: -1.2,
      ), // Display xl/Bold
      displayLgRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 48,
        height: 1.25,
        letterSpacing: -0.96,
      ), // Display lg/Regular
      displayLgMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 48,
        height: 1.25,
        letterSpacing: -0.96,
      ), // Display lg/Medium
      displayLgSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 48,
        height: 1.25,
        letterSpacing: -0.96,
      ), // Display lg/Semibold
      displayLgBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 48,
        height: 1.25,
        letterSpacing: -0.96,
      ), // Display lg/Bold
      displayMdRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 36,
        height: 1.2222222222222223,
        letterSpacing: -0.72,
      ), // Display md/Regular
      displayMdMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 36,
        height: 1.2222222222222223,
        letterSpacing: -0.72,
      ), // Display md/Medium
      displayMdSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 36,
        height: 1.2222222222222223,
        letterSpacing: -0.72,
      ), // Display md/Semibold
      displayMdBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 36,
        height: 1.2222222222222223,
        letterSpacing: -0.72,
      ), // Display md/Bold
      displaySmRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 30,
        height: 1.2666666666666666,
      ), // Display sm/Regular
      displaySmMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 30,
        height: 1.2666666666666666,
      ), // Display sm/Medium
      displaySmSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 30,
        height: 1.2666666666666666,
      ), // Display sm/Semibold
      displaySmBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 30,
        height: 1.2666666666666666,
      ), // Display sm/Bold
      displayXsRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: 1.3333333333333333,
      ), // Display xs/Regular
      displayXsMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 24,
        height: 1.3333333333333333,
      ), // Display xs/Medium
      displayXsSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1.3333333333333333,
      ), // Display xs/Semibold
      displayXsBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1.3333333333333333,
      ), // Display xs/Bold
      interSemiBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        letterSpacing: 0.5,
      ), // Inter/Semi
      interRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: 1.6,
      ), // Inter/Regular
      textXlRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: 1.5,
      ), // Text xl/Regular
      textXlMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: 1.5,
      ), // Text xl/Medium
      textXlSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 1.5,
      ), // Text xl/Semibold
      textXlBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: 1.5,
      ), // Text xl/Bold
      textLgRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1.5555555555555556,
      ), // Text lg/Regular
      textLgMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1.5555555555555556,
      ), // Text lg/Medium
      textLgSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 1.5555555555555556,
      ), // Text lg/Semibold
      textLgBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: 1.5555555555555556,
      ), // Text lg/Bold
      textMdRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.5,
      ), // Text md/Regular
      textMdMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.5,
      ), // Text md/Medium
      textMdSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.5,
      ), // Text md/Semibold
      textMdBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.5,
      ), // Text md/Bold
      textSmRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.4285714285714286,
      ), // Text sm/Regular
      textSmMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.4285714285714286,
      ), // Text sm/Medium
      textSmSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.4285714285714286,
      ), // Text sm/Semibold
      textSmBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.4285714285714286,
      ), // Text sm / Bold
      textXsRegular = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.5,
      ), // Text xs/Regular
      textXsMedium = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1,
      ), // Text xs/Medium
      textXsSemibold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 1.5,
      ), // Text xs/Semibold
      textXsBold = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: 1.5,
      ), // Text xs / Bold
      semanticHeading1 = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 56,
        height: 1.0999999727521623,
      ), // Semantic/Heading 1
      semanticLink = const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ), // Semantic/Link
      timesNewRomanRegular = const TextStyle(
        fontFamily: 'Times New Roman',
        fontWeight: FontWeight.w400,
        fontSize: 64,
      );

  @override
  CustomTypography copyWith({
    TextStyle? display2xlRegular,
    TextStyle? display2xlMedium,
    TextStyle? display2xlSemibold,
    TextStyle? display2xlBold,
    TextStyle? displayXlRegular,
    TextStyle? displayXlMedium,
    TextStyle? displayXlSemibold,
    TextStyle? displayXlBold,
    TextStyle? displayLgRegular,
    TextStyle? displayLgMedium,
    TextStyle? displayLgSemibold,
    TextStyle? displayLgBold,
    TextStyle? displayMdRegular,
    TextStyle? displayMdMedium,
    TextStyle? displayMdSemibold,
    TextStyle? displayMdBold,
    TextStyle? displaySmRegular,
    TextStyle? displaySmMedium,
    TextStyle? displaySmSemibold,
    TextStyle? displaySmBold,
    TextStyle? displayXsRegular,
    TextStyle? displayXsMedium,
    TextStyle? displayXsSemibold,
    TextStyle? displayXsBold,
    TextStyle? interSemiBold,
    TextStyle? interRegular,
    TextStyle? textXlRegular,
    TextStyle? textXlMedium,
    TextStyle? textXlSemibold,
    TextStyle? textXlBold,
    TextStyle? textLgRegular,
    TextStyle? textLgMedium,
    TextStyle? textLgSemibold,
    TextStyle? textLgBold,
    TextStyle? textMdRegular,
    TextStyle? textMdMedium,
    TextStyle? textMdSemibold,
    TextStyle? textMdBold,
    TextStyle? textSmRegular,
    TextStyle? textSmMedium,
    TextStyle? textSmSemibold,
    TextStyle? textSmBold,
    TextStyle? textXsRegular,
    TextStyle? textXsMedium,
    TextStyle? textXsSemibold,
    TextStyle? textXsBold,
    TextStyle? semanticHeading1,
    TextStyle? semanticLink,
    TextStyle? timesNewRomanRegular,
  }) {
    return CustomTypography(
      display2xlRegular: display2xlRegular ?? this.display2xlRegular,
      display2xlMedium: display2xlMedium ?? this.display2xlMedium,
      display2xlSemibold: display2xlSemibold ?? this.display2xlSemibold,
      display2xlBold: display2xlBold ?? this.display2xlBold,
      displayXlRegular: displayXlRegular ?? this.displayXlRegular,
      displayXlMedium: displayXlMedium ?? this.displayXlMedium,
      displayXlSemibold: displayXlSemibold ?? this.displayXlSemibold,
      displayXlBold: displayXlBold ?? this.displayXlBold,
      displayLgRegular: displayLgRegular ?? this.displayLgRegular,
      displayLgMedium: displayLgMedium ?? this.displayLgMedium,
      displayLgSemibold: displayLgSemibold ?? this.displayLgSemibold,
      displayLgBold: displayLgBold ?? this.displayLgBold,
      displayMdRegular: displayMdRegular ?? this.displayMdRegular,
      displayMdMedium: displayMdMedium ?? this.displayMdMedium,
      displayMdSemibold: displayMdSemibold ?? this.displayMdSemibold,
      displayMdBold: displayMdBold ?? this.displayMdBold,
      displaySmRegular: displaySmRegular ?? this.displaySmRegular,
      displaySmMedium: displaySmMedium ?? this.displaySmMedium,
      displaySmSemibold: displaySmSemibold ?? this.displaySmSemibold,
      displaySmBold: displaySmBold ?? this.displaySmBold,
      displayXsRegular: displayXsRegular ?? this.displayXsRegular,
      displayXsMedium: displayXsMedium ?? this.displayXsMedium,
      displayXsSemibold: displayXsSemibold ?? this.displayXsSemibold,
      displayXsBold: displayXsBold ?? this.displayXsBold,
      interSemiBold: interSemiBold ?? this.interSemiBold,
      interRegular: interRegular ?? this.interRegular,
      textXlRegular: textXlRegular ?? this.textXlRegular,
      textXlMedium: textXlMedium ?? this.textXlMedium,
      textXlSemibold: textXlSemibold ?? this.textXlSemibold,
      textXlBold: textXlBold ?? this.textXlBold,
      textLgRegular: textLgRegular ?? this.textLgRegular,
      textLgMedium: textLgMedium ?? this.textLgMedium,
      textLgSemibold: textLgSemibold ?? this.textLgSemibold,
      textLgBold: textLgBold ?? this.textLgBold,
      textMdRegular: textMdRegular ?? this.textMdRegular,
      textMdMedium: textMdMedium ?? this.textMdMedium,
      textMdSemibold: textMdSemibold ?? this.textMdSemibold,
      textMdBold: textMdBold ?? this.textMdBold,
      textSmRegular: textSmRegular ?? this.textSmRegular,
      textSmMedium: textSmMedium ?? this.textSmMedium,
      textSmSemibold: textSmSemibold ?? this.textSmSemibold,
      textSmBold: textSmBold ?? this.textSmBold,
      textXsRegular: textXsRegular ?? this.textXsRegular,
      textXsMedium: textXsMedium ?? this.textXsMedium,
      textXsSemibold: textXsSemibold ?? this.textXsSemibold,
      textXsBold: textXsBold ?? this.textXsBold,
      semanticHeading1: semanticHeading1 ?? this.semanticHeading1,
      semanticLink: semanticLink ?? this.semanticLink,
      timesNewRomanRegular: timesNewRomanRegular ?? this.timesNewRomanRegular,
    );
  }

  @override
  CustomTypography lerp(ThemeExtension<CustomTypography>? other, double t) {
    if (other is! CustomTypography) return this;
    return CustomTypography(
      display2xlRegular:
          TextStyle.lerp(display2xlRegular, other.display2xlRegular, t) ??
          display2xlRegular,
      display2xlMedium:
          TextStyle.lerp(display2xlMedium, other.display2xlMedium, t) ??
          display2xlMedium,
      display2xlSemibold:
          TextStyle.lerp(display2xlSemibold, other.display2xlSemibold, t) ??
          display2xlSemibold,
      display2xlBold:
          TextStyle.lerp(display2xlBold, other.display2xlBold, t) ??
          display2xlBold,
      displayXlRegular:
          TextStyle.lerp(displayXlRegular, other.displayXlRegular, t) ??
          displayXlRegular,
      displayXlMedium:
          TextStyle.lerp(displayXlMedium, other.displayXlMedium, t) ??
          displayXlMedium,
      displayXlSemibold:
          TextStyle.lerp(displayXlSemibold, other.displayXlSemibold, t) ??
          displayXlSemibold,
      displayXlBold:
          TextStyle.lerp(displayXlBold, other.displayXlBold, t) ??
          displayXlBold,
      displayLgRegular:
          TextStyle.lerp(displayLgRegular, other.displayLgRegular, t) ??
          displayLgRegular,
      displayLgMedium:
          TextStyle.lerp(displayLgMedium, other.displayLgMedium, t) ??
          displayLgMedium,
      displayLgSemibold:
          TextStyle.lerp(displayLgSemibold, other.displayLgSemibold, t) ??
          displayLgSemibold,
      displayLgBold:
          TextStyle.lerp(displayLgBold, other.displayLgBold, t) ??
          displayLgBold,
      displayMdRegular:
          TextStyle.lerp(displayMdRegular, other.displayMdRegular, t) ??
          displayMdRegular,
      displayMdMedium:
          TextStyle.lerp(displayMdMedium, other.displayMdMedium, t) ??
          displayMdMedium,
      displayMdSemibold:
          TextStyle.lerp(displayMdSemibold, other.displayMdSemibold, t) ??
          displayMdSemibold,
      displayMdBold:
          TextStyle.lerp(displayMdBold, other.displayMdBold, t) ??
          displayMdBold,
      displaySmRegular:
          TextStyle.lerp(displaySmRegular, other.displaySmRegular, t) ??
          displaySmRegular,
      displaySmMedium:
          TextStyle.lerp(displaySmMedium, other.displaySmMedium, t) ??
          displaySmMedium,
      displaySmSemibold:
          TextStyle.lerp(displaySmSemibold, other.displaySmSemibold, t) ??
          displaySmSemibold,
      displaySmBold:
          TextStyle.lerp(displaySmBold, other.displaySmBold, t) ??
          displaySmBold,
      displayXsRegular:
          TextStyle.lerp(displayXsRegular, other.displayXsRegular, t) ??
          displayXsRegular,
      displayXsMedium:
          TextStyle.lerp(displayXsMedium, other.displayXsMedium, t) ??
          displayXsMedium,
      displayXsSemibold:
          TextStyle.lerp(displayXsSemibold, other.displayXsSemibold, t) ??
          displayXsSemibold,
      displayXsBold:
          TextStyle.lerp(displayXsBold, other.displayXsBold, t) ??
          displayXsBold,
      interSemiBold:
          TextStyle.lerp(interSemiBold, other.interSemiBold, t) ??
          interSemiBold,
      interRegular:
          TextStyle.lerp(interRegular, other.interRegular, t) ?? interRegular,
      textXlRegular:
          TextStyle.lerp(textXlRegular, other.textXlRegular, t) ??
          textXlRegular,
      textXlMedium:
          TextStyle.lerp(textXlMedium, other.textXlMedium, t) ?? textXlMedium,
      textXlSemibold:
          TextStyle.lerp(textXlSemibold, other.textXlSemibold, t) ??
          textXlSemibold,
      textXlBold: TextStyle.lerp(textXlBold, other.textXlBold, t) ?? textXlBold,
      textLgRegular:
          TextStyle.lerp(textLgRegular, other.textLgRegular, t) ??
          textLgRegular,
      textLgMedium:
          TextStyle.lerp(textLgMedium, other.textLgMedium, t) ?? textLgMedium,
      textLgSemibold:
          TextStyle.lerp(textLgSemibold, other.textLgSemibold, t) ??
          textLgSemibold,
      textLgBold: TextStyle.lerp(textLgBold, other.textLgBold, t) ?? textLgBold,
      textMdRegular:
          TextStyle.lerp(textMdRegular, other.textMdRegular, t) ??
          textMdRegular,
      textMdMedium:
          TextStyle.lerp(textMdMedium, other.textMdMedium, t) ?? textMdMedium,
      textMdSemibold:
          TextStyle.lerp(textMdSemibold, other.textMdSemibold, t) ??
          textMdSemibold,
      textMdBold: TextStyle.lerp(textMdBold, other.textMdBold, t) ?? textMdBold,
      textSmRegular:
          TextStyle.lerp(textSmRegular, other.textSmRegular, t) ??
          textSmRegular,
      textSmMedium:
          TextStyle.lerp(textSmMedium, other.textSmMedium, t) ?? textSmMedium,
      textSmSemibold:
          TextStyle.lerp(textSmSemibold, other.textSmSemibold, t) ??
          textSmSemibold,
      textSmBold: TextStyle.lerp(textSmBold, other.textSmBold, t) ?? textSmBold,
      textXsRegular:
          TextStyle.lerp(textXsRegular, other.textXsRegular, t) ??
          textXsRegular,
      textXsMedium:
          TextStyle.lerp(textXsMedium, other.textXsMedium, t) ?? textXsMedium,
      textXsSemibold:
          TextStyle.lerp(textXsSemibold, other.textXsSemibold, t) ??
          textXsSemibold,
      textXsBold: TextStyle.lerp(textXsBold, other.textXsBold, t) ?? textXsBold,
      semanticHeading1:
          TextStyle.lerp(semanticHeading1, other.semanticHeading1, t) ??
          semanticHeading1,
      semanticLink:
          TextStyle.lerp(semanticLink, other.semanticLink, t) ?? semanticLink,
      timesNewRomanRegular:
          TextStyle.lerp(timesNewRomanRegular, other.timesNewRomanRegular, t) ??
          timesNewRomanRegular,
    );
  }
}
