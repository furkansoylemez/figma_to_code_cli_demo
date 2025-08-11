import 'package:flutter/material.dart';

enum TagVariant {
  colorful,
  close,
  addNew,
}

class Tag extends StatelessWidget {
  final String text;
  final TagVariant variant;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? spacing;
  final double? iconSize;
  final VoidCallback? onPressed;
  final VoidCallback? onClosePressed;
  final bool isDashed;
  final double? borderWidth;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool enabled;

  const Tag({
    super.key,
    required this.text,
    this.variant = TagVariant.colorful,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.textStyle,
    this.borderRadius,
    this.padding,
    this.spacing,
    this.iconSize,
    this.onPressed,
    this.onClosePressed,
    this.isDashed = false,
    this.borderWidth,
    this.leadingIcon,
    this.trailingIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final effectiveBackgroundColor = backgroundColor ?? 
        (variant == TagVariant.addNew ? Colors.transparent : colorScheme.surface.withOpacity(0.02));
    
    final effectiveBorderColor = borderColor ?? colorScheme.outline.withOpacity(0.24);
    
    final effectiveTextColor = textColor ?? 
        colorScheme.onSurface.withOpacity(enabled ? 0.88 : 0.38);
    
    final effectiveIconColor = iconColor ?? 
        colorScheme.onSurface.withOpacity(enabled ? 0.45 : 0.38);
    
    final effectiveTextStyle = textStyle ?? 
        theme.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: effectiveTextColor,
        );
    
    final effectivePadding = padding ?? 
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0);
    
    final effectiveSpacing = spacing ?? 4.0;
    final effectiveIconSize = iconSize ?? 12.0;
    final effectiveBorderRadius = borderRadius ?? 4.0;
    final effectiveBorderWidth = borderWidth ?? 1.0;
    
    final shouldShowDashedBorder = isDashed || variant == TagVariant.addNew;

    Widget buildIcon() {
      switch (variant) {
        case TagVariant.close:
          return trailingIcon ?? Icon(
            Icons.close,
            size: effectiveIconSize,
            color: effectiveIconColor,
          );
        case TagVariant.addNew:
          return leadingIcon ?? Icon(
            Icons.add,
            size: effectiveIconSize,
            color: effectiveIconColor,
          );
        case TagVariant.colorful:
        default:
          return const SizedBox.shrink();
      }
    }

    Widget buildContent() {
      final List<Widget> children = [];
      
      if (variant == TagVariant.addNew && leadingIcon != null) {
        children.add(leadingIcon!);
        children.add(SizedBox(width: effectiveSpacing));
      } else if (variant == TagVariant.addNew) {
        children.add(buildIcon());
        children.add(SizedBox(width: effectiveSpacing));
      }
      
      children.add(
        Text(
          text,
          style: effectiveTextStyle,
        ),
      );
      
      if (variant == TagVariant.close) {
        children.add(SizedBox(width: effectiveSpacing));
        if (trailingIcon != null) {
          children.add(trailingIcon!);
        } else {
          children.add(buildIcon());
        }
      }
      
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      );
    }

    Widget tagWidget = Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        border: shouldShowDashedBorder
            ? Border.all(
                color: effectiveBorderColor,
                width: effectiveBorderWidth,
                strokeAlign: BorderSide.strokeAlignInside,
              )
            : Border.all(
                color: effectiveBorderColor,
                width: effectiveBorderWidth,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
      ),
      child: buildContent(),
    );

    if (shouldShowDashedBorder && variant == TagVariant.addNew) {
      tagWidget = CustomPaint(
        painter: DashedBorderPainter(
          color: effectiveBorderColor,
          strokeWidth: effectiveBorderWidth,
          borderRadius: effectiveBorderRadius,
          dashWidth: 2.0,
          dashSpace: 2.0,
        ),
        child: Container(
          padding: effectivePadding,
          decoration: BoxDecoration(
            color: effectiveBackgroundColor,
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
          ),
          child: buildContent(),
        ),
      );
    }

    if (onPressed != null || (variant == TagVariant.close && onClosePressed != null)) {
      return GestureDetector(
        onTap: enabled ? (variant == TagVariant.close ? onClosePressed : onPressed) : null,
        child: MouseRegion(
          cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: tagWidget,
        ),
      );
    }

    return tagWidget;
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double borderRadius;
  final double dashWidth;
  final double dashSpace;

  const DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.borderRadius,
    this.dashWidth = 2.0,
    this.dashSpace = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    final path = Path()..addRRect(rrect);
    
    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final pathMetrics = path.computeMetrics();
    
    for (final pathMetric in pathMetrics) {
      double distance = 0.0;
      
      while (distance < pathMetric.length) {
        final segment = pathMetric.extractPath(
          distance,
          distance + dashWidth,
        );
        canvas.drawPath(segment, paint);
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DashedBorderPainter &&
        other.color == color &&
        other.strokeWidth == strokeWidth &&
        other.borderRadius == borderRadius &&
        other.dashWidth == dashWidth &&
        other.dashSpace == dashSpace;
  }

  @override
  int get hashCode {
    return Object.hash(
      color,
      strokeWidth,
      borderRadius,
      dashWidth,
      dashSpace,
    );
  }
}