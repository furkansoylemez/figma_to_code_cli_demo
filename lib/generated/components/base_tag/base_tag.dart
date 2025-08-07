import 'package:flutter/material.dart';

/// A highly configurable tag component with support for different variants
/// including standard tags, removable tags, and add-new tags.
class BaseTag extends StatelessWidget {
  /// The text to display in the tag
  final String text;

  /// Whether the tag shows a close/remove icon
  final bool showCloseIcon;

  /// Whether the tag shows a plus/add icon
  final bool showPlusIcon;

  /// Whether the tag has a dashed border (typically for add-new style)
  final bool hasDashedBorder;

  /// Callback when the close icon is tapped
  final VoidCallback? onClose;

  /// Callback when the tag is tapped
  final VoidCallback? onTap;

  /// Background color of the tag
  final Color? backgroundColor;

  /// Border color of the tag
  final Color? borderColor;

  /// Text color of the tag
  final Color? textColor;

  /// Icon color for close and plus icons
  final Color? iconColor;

  /// Text style for the tag text
  final TextStyle? textStyle;

  /// Corner radius of the tag
  final double? borderRadius;

  /// Border width
  final double borderWidth;

  /// Horizontal padding inside the tag
  final double horizontalPadding;

  /// Vertical padding inside the tag
  final double verticalPadding;

  /// Spacing between icon and text
  final double iconSpacing;

  /// Size of the icons
  final double iconSize;

  /// Opacity of the background color
  final double backgroundOpacity;

  /// Opacity of the text color
  final double textOpacity;

  /// Opacity of the icon color
  final double iconOpacity;

  /// Whether the tag is in a disabled state
  final bool isDisabled;

  /// Height of the tag (null for auto height)
  final double? height;

  /// Creates a base tag component
  const BaseTag({
    super.key,
    required this.text,
    this.showCloseIcon = false,
    this.showPlusIcon = false,
    this.hasDashedBorder = false,
    this.onClose,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.textStyle,
    this.borderRadius,
    this.borderWidth = 1.0,
    this.horizontalPadding = 8.0,
    this.verticalPadding = 4.0,
    this.iconSpacing = 4.0,
    this.iconSize = 12.0,
    this.backgroundOpacity = 0.02,
    this.textOpacity = 0.88,
    this.iconOpacity = 0.45,
    this.isDisabled = false,
    this.height,
  });

  /// Factory constructor for a standard colorful tag
  factory BaseTag.colorful({
    Key? key,
    required String text,
    VoidCallback? onTap,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    TextStyle? textStyle,
    double? borderRadius,
    double borderWidth = 1.0,
    double horizontalPadding = 8.0,
    double verticalPadding = 1.0,
    bool isDisabled = false,
    double? height,
  }) {
    return BaseTag(
      key: key,
      text: text,
      onTap: onTap,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      textColor: textColor,
      textStyle: textStyle,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      isDisabled: isDisabled,
      height: height,
    );
  }

  /// Factory constructor for a tag with close icon
  factory BaseTag.closable({
    Key? key,
    required String text,
    VoidCallback? onClose,
    VoidCallback? onTap,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    Color? iconColor,
    TextStyle? textStyle,
    double? borderRadius,
    double borderWidth = 1.0,
    double horizontalPadding = 8.0,
    double verticalPadding = 1.0,
    double iconSpacing = 4.0,
    double iconSize = 12.0,
    bool isDisabled = false,
    double height = 24.0,
  }) {
    return BaseTag(
      key: key,
      text: text,
      showCloseIcon: true,
      onClose: onClose,
      onTap: onTap,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      textColor: textColor,
      iconColor: iconColor,
      textStyle: textStyle,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      iconSpacing: iconSpacing,
      iconSize: iconSize,
      isDisabled: isDisabled,
      height: height,
    );
  }

  /// Factory constructor for an add-new tag with plus icon
  factory BaseTag.addNew({
    Key? key,
    required String text,
    VoidCallback? onTap,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    Color? iconColor,
    TextStyle? textStyle,
    double? borderRadius,
    double borderWidth = 1.0,
    double horizontalPadding = 8.0,
    double verticalPadding = 1.0,
    double iconSpacing = 4.0,
    double iconSize = 12.0,
    bool isDisabled = false,
    double height = 24.0,
  }) {
    return BaseTag(
      key: key,
      text: text,
      showPlusIcon: true,
      hasDashedBorder: true,
      onTap: onTap,
      backgroundColor: backgroundColor ?? Colors.transparent,
      borderColor: borderColor,
      textColor: textColor,
      iconColor: iconColor,
      textStyle: textStyle,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      iconSpacing: iconSpacing,
      iconSize: iconSize,
      isDisabled: isDisabled,
      height: height,
      backgroundOpacity: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final effectiveBackgroundColor = backgroundColor ?? colorScheme.surface;
    final effectiveBorderColor = borderColor ?? colorScheme.outline;
    final effectiveTextColor = textColor ?? colorScheme.onSurface;
    final effectiveIconColor = iconColor ?? colorScheme.onSurface;
    final effectiveTextStyle = textStyle ?? textTheme.labelMedium?.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 12.0,
      height: 1.67,
    );
    final effectiveBorderRadius = borderRadius ?? 4.0;

    final finalBackgroundColor = isDisabled
        ? effectiveBackgroundColor.withOpacity(0.12)
        : effectiveBackgroundColor.withOpacity(backgroundOpacity);
    
    final finalTextColor = isDisabled
        ? effectiveTextColor.withOpacity(0.38)
        : effectiveTextColor.withOpacity(textOpacity);
    
    final finalIconColor = isDisabled
        ? effectiveIconColor.withOpacity(0.38)
        : effectiveIconColor.withOpacity(iconOpacity);
    
    final finalBorderColor = isDisabled
        ? effectiveBorderColor.withOpacity(0.12)
        : effectiveBorderColor;

    Widget tagContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showPlusIcon) ...[
          Icon(
            Icons.add,
            size: iconSize,
            color: finalIconColor,
          ),
          SizedBox(width: iconSpacing),
        ],
        Flexible(
          child: Text(
            text,
            style: effectiveTextStyle?.copyWith(color: finalTextColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (showCloseIcon) ...[
          SizedBox(width: iconSpacing),
          GestureDetector(
            onTap: isDisabled ? null : onClose,
            child: Icon(
              Icons.close,
              size: iconSize,
              color: finalIconColor,
            ),
          ),
        ],
      ],
    );

    Widget tag = Container(
      height: height,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: finalBackgroundColor,
        border: Border.all(
          color: finalBorderColor,
          width: borderWidth,
          style: hasDashedBorder ? BorderStyle.solid : BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
      ),
      child: tagContent,
    );

    if (hasDashedBorder) {
      tag = CustomPaint(
        painter: DashedBorderPainter(
          color: finalBorderColor,
          strokeWidth: borderWidth,
          borderRadius: effectiveBorderRadius,
          dashLength: 2.0,
          gapLength: 2.0,
        ),
        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color: finalBackgroundColor,
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
          ),
          child: tagContent,
        ),
      );
    }

    if (onTap != null && !isDisabled) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          child: tag,
        ),
      );
    }

    return tag;
  }
}

/// Custom painter for dashed borders
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double borderRadius;
  final double dashLength;
  final double gapLength;

  const DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.borderRadius,
    required this.dashLength,
    required this.gapLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(strokeWidth / 2, strokeWidth / 2, 
                     size.width - strokeWidth, size.height - strokeWidth),
        Radius.circular(borderRadius),
      ));

    _drawDashedPath(canvas, path, paint, dashLength, gapLength);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint, double dashLength, double gapLength) {
    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      double distance = 0;
      while (distance < pathMetric.length) {
        final extractPath = pathMetric.extractPath(distance, distance + dashLength);
        canvas.drawPath(extractPath, paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}