import 'package:flutter/material.dart';

/// A flexible status badge widget with a circular indicator and text label.
/// 
/// This widget displays a small circular status indicator alongside text,
/// commonly used for showing status information like success, error, warning, etc.
/// All visual properties can be customized through parameters, with sensible
/// Material Design defaults.
class StatusBadge extends StatelessWidget {
  /// Creates a status badge with a circular indicator and text.
  const StatusBadge({
    super.key,
    required this.text,
    this.indicatorColor,
    this.indicatorBorderColor,
    this.textColor,
    this.textStyle,
    this.indicatorSize = 6.0,
    this.indicatorBorderWidth = 2.0,
    this.spacing = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding,
    this.onTap,
    this.semanticLabel,
  });

  /// The text to display next to the status indicator.
  final String text;

  /// The color of the status indicator circle.
  /// Defaults to [ColorScheme.primary].
  final Color? indicatorColor;

  /// The color of the indicator's border.
  /// Defaults to [ColorScheme.surface].
  final Color? indicatorBorderColor;

  /// The color of the text.
  /// Defaults to [ColorScheme.onSurface] with 88% opacity.
  final Color? textColor;

  /// The text style for the label.
  /// Defaults to [TextTheme.bodySmall].
  final TextStyle? textStyle;

  /// The diameter of the circular status indicator.
  /// Defaults to 6.0 logical pixels.
  final double indicatorSize;

  /// The width of the indicator's border.
  /// Defaults to 2.0 logical pixels.
  final double indicatorBorderWidth;

  /// The spacing between the indicator and text.
  /// Defaults to 8.0 logical pixels (Material Design standard).
  final double spacing;

  /// How the indicator and text should be aligned horizontally.
  /// Defaults to [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  /// How the indicator and text should be aligned vertically.
  /// Defaults to [CrossAxisAlignment.center].
  final CrossAxisAlignment crossAxisAlignment;

  /// Optional padding around the entire badge.
  final EdgeInsets? padding;

  /// Callback function when the badge is tapped.
  /// If null, the badge will not be interactive.
  final VoidCallback? onTap;

  /// Semantic label for accessibility.
  /// If null, uses the text value.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final effectiveIndicatorColor = indicatorColor ?? colorScheme.primary;
    final effectiveIndicatorBorderColor = indicatorBorderColor ?? colorScheme.surface;
    final effectiveTextColor = textColor ?? colorScheme.onSurface.withOpacity(0.88);
    final effectiveTextStyle = textStyle ?? textTheme.bodySmall?.copyWith(
      color: effectiveTextColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      height: 22.0 / 14.0,
    );

    final badge = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Container(
          width: indicatorSize,
          height: indicatorSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: effectiveIndicatorColor,
            border: Border.all(
              color: effectiveIndicatorBorderColor,
              width: indicatorBorderWidth,
            ),
          ),
        ),
        SizedBox(width: spacing),
        Text(
          text,
          style: effectiveTextStyle,
        ),
      ],
    );

    final paddedBadge = padding != null 
        ? Padding(padding: padding!, child: badge)
        : badge;

    if (onTap != null) {
      return Semantics(
        label: semanticLabel ?? text,
        button: true,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: paddedBadge,
        ),
      );
    }

    return Semantics(
      label: semanticLabel ?? text,
      child: paddedBadge,
    );
  }
}