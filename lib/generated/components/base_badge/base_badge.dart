import 'package:flutter/material.dart';

enum BadgeStatus {
  success,
  warning,
  error,
  info,
  neutral,
}

class BaseBadge extends StatelessWidget {
  const BaseBadge({
    super.key,
    required this.text,
    this.status = BadgeStatus.neutral,
    this.showIndicator = true,
    this.indicatorColor,
    this.indicatorBorderColor,
    this.indicatorSize = 6.0,
    this.indicatorBorderWidth = 2.0,
    this.textColor,
    this.textStyle,
    this.spacing = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.elevation = 0.0,
    this.onTap,
  });

  /// The text to display in the badge
  final String text;

  /// The status type of the badge, affects default colors
  final BadgeStatus status;

  /// Whether to show the circular status indicator
  final bool showIndicator;

  /// Color of the status indicator dot
  final Color? indicatorColor;

  /// Border color of the status indicator
  final Color? indicatorBorderColor;

  /// Size of the status indicator dot
  final double indicatorSize;

  /// Width of the status indicator border
  final double indicatorBorderWidth;

  /// Color of the text
  final Color? textColor;

  /// Text style for the badge text
  final TextStyle? textStyle;

  /// Spacing between the indicator and text
  final double spacing;

  /// Horizontal alignment of the badge content
  final MainAxisAlignment mainAxisAlignment;

  /// Vertical alignment of the badge content
  final CrossAxisAlignment crossAxisAlignment;

  /// Internal padding of the badge
  final EdgeInsetsGeometry? padding;

  /// Background color of the badge
  final Color? backgroundColor;

  /// Border radius of the badge container
  final BorderRadius? borderRadius;

  /// Elevation shadow of the badge
  final double elevation;

  /// Callback when badge is tapped
  final VoidCallback? onTap;

  Color _getDefaultIndicatorColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (status) {
      case BadgeStatus.success:
        return const Color(0xFF52C41A);
      case BadgeStatus.warning:
        return colorScheme.error;
      case BadgeStatus.error:
        return colorScheme.error;
      case BadgeStatus.info:
        return colorScheme.primary;
      case BadgeStatus.neutral:
        return colorScheme.onSurfaceVariant;
    }
  }

  Color _getDefaultTextColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return colorScheme.onSurface.withOpacity(0.88);
  }

  Widget _buildIndicator(BuildContext context) {
    if (!showIndicator) return const SizedBox.shrink();

    final effectiveIndicatorColor = indicatorColor ?? _getDefaultIndicatorColor(context);
    final effectiveBorderColor = indicatorBorderColor ?? Theme.of(context).colorScheme.surface;

    return Container(
      width: indicatorSize + (indicatorBorderWidth * 2),
      height: indicatorSize + (indicatorBorderWidth * 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: effectiveBorderColor,
      ),
      child: Center(
        child: Container(
          width: indicatorSize,
          height: indicatorSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: effectiveIndicatorColor,
          ),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    final effectiveTextColor = textColor ?? _getDefaultTextColor(context);
    final effectiveTextStyle = textStyle ?? Theme.of(context).textTheme.labelMedium?.copyWith(
      color: effectiveTextColor,
      fontSize: 14.0,
      height: 22.0 / 14.0,
      fontWeight: FontWeight.w400,
    );

    return Text(
      text,
      style: effectiveTextStyle,
      textAlign: TextAlign.left,
    );
  }

  Widget _buildContent(BuildContext context) {
    final children = <Widget>[
      _buildIndicator(context),
      if (showIndicator) SizedBox(width: spacing),
      _buildText(context),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = _buildContent(context);

    if (padding != null || backgroundColor != null || borderRadius != null || elevation > 0) {
      content = Material(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: borderRadius,
        elevation: elevation,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: content,
        ),
      );
    }

    if (onTap != null) {
      content = InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: content,
      );
    }

    return content;
  }
}