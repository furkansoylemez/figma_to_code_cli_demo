import 'package:flutter/material.dart';

/// A flexible tag widget that serves as a base component for tag systems.
/// 
/// This widget provides a highly customizable tag with support for text,
/// leading/trailing widgets, and various visual states. It follows Material
/// Design principles while allowing complete customization of appearance.
///
/// Example usage:
/// ```dart
/// BaseTag(
///   text: 'Design',
///   onPressed: () => print('Tag pressed'),
/// )
/// 
/// BaseTag(
///   text: 'Add New',
///   leadingWidget: Icon(Icons.add, size: 12),
///   style: BaseTagStyle.outlined,
///   onPressed: () => print('Add new pressed'),
/// )
/// ```
class BaseTag extends StatelessWidget {
  /// Creates a base tag widget.
  const BaseTag({
    super.key,
    required this.text,
    this.leadingWidget,
    this.trailingWidget,
    this.style = BaseTagStyle.filled,
    this.size = BaseTagSize.medium,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.textStyle,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.spacing,
    this.onPressed,
    this.onLongPress,
    this.enabled = true,
    this.semanticsLabel,
  });

  /// The text content displayed in the tag.
  final String text;

  /// Optional widget displayed before the text (e.g., icon).
  final Widget? leadingWidget;

  /// Optional widget displayed after the text (e.g., close button).
  final Widget? trailingWidget;

  /// The visual style of the tag.
  final BaseTagStyle style;

  /// The size preset for the tag.
  final BaseTagSize size;

  /// Background color of the tag. Defaults to theme-based color.
  final Color? backgroundColor;

  /// Border color of the tag. Defaults to theme-based color.
  final Color? borderColor;

  /// Text color. Defaults to theme-based color.
  final Color? textColor;

  /// Text style override. Defaults to theme-based style.
  final TextStyle? textStyle;

  /// Corner radius of the tag. Defaults to Material Design standard.
  final double? borderRadius;

  /// Border width when using outlined or bordered styles.
  final double? borderWidth;

  /// Custom padding override. Defaults to size-based padding.
  final EdgeInsetsGeometry? padding;

  /// Spacing between leading widget, text, and trailing widget.
  final double? spacing;

  /// Callback fired when the tag is pressed.
  final VoidCallback? onPressed;

  /// Callback fired when the tag is long pressed.
  final VoidCallback? onLongPress;

  /// Whether the tag is enabled for interaction.
  final bool enabled;

  /// Semantic label for accessibility.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final effectiveBackgroundColor = _getBackgroundColor(context);
    final effectiveBorderColor = _getBorderColor(context);
    final effectiveTextColor = _getTextColor(context);
    final effectiveTextStyle = _getTextStyle(context);
    final effectivePadding = _getPadding();
    final effectiveSpacing = spacing ?? 4.0;
    final effectiveBorderRadius = borderRadius ?? 4.0;
    final effectiveBorderWidth = borderWidth ?? 1.0;

    final isInteractive = onPressed != null || onLongPress != null;

    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (leadingWidget != null) ...[
          leadingWidget!,
          SizedBox(width: effectiveSpacing),
        ],
        Text(
          text,
          style: effectiveTextStyle,
          textAlign: TextAlign.center,
        ),
        if (trailingWidget != null) ...[
          SizedBox(width: effectiveSpacing),
          trailingWidget!,
        ],
      ],
    );

    Widget container = Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        border: _shouldShowBorder() 
            ? Border.all(
                color: effectiveBorderColor,
                width: effectiveBorderWidth,
              )
            : null,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
      ),
      child: child,
    );

    if (isInteractive && enabled) {
      return Semantics(
        label: semanticsLabel ?? text,
        button: true,
        enabled: enabled,
        child: InkWell(
          onTap: onPressed,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          splashColor: colorScheme.primary.withOpacity(0.12),
          highlightColor: colorScheme.primary.withOpacity(0.08),
          hoverColor: colorScheme.primary.withOpacity(0.04),
          focusColor: colorScheme.primary.withOpacity(0.12),
          child: container,
        ),
      );
    }

    return Semantics(
      label: semanticsLabel ?? text,
      child: container,
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    if (backgroundColor != null) return backgroundColor!;
    
    final colorScheme = Theme.of(context).colorScheme;
    
    switch (style) {
      case BaseTagStyle.filled:
        return colorScheme.surfaceVariant;
      case BaseTagStyle.outlined:
        return Colors.transparent;
      case BaseTagStyle.soft:
        return colorScheme.primary.withOpacity(0.08);
    }
  }

  Color _getBorderColor(BuildContext context) {
    if (borderColor != null) return borderColor!;
    
    final colorScheme = Theme.of(context).colorScheme;
    
    switch (style) {
      case BaseTagStyle.filled:
        return colorScheme.outline;
      case BaseTagStyle.outlined:
        return colorScheme.outline;
      case BaseTagStyle.soft:
        return colorScheme.primary.withOpacity(0.2);
    }
  }

  Color _getTextColor(BuildContext context) {
    if (textColor != null) return textColor!;
    
    final colorScheme = Theme.of(context).colorScheme;
    
    switch (style) {
      case BaseTagStyle.filled:
        return colorScheme.onSurfaceVariant;
      case BaseTagStyle.outlined:
        return colorScheme.onSurface;
      case BaseTagStyle.soft:
        return colorScheme.primary;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.labelMedium ?? const TextStyle();
    final effectiveColor = _getTextColor(context);
    
    final sizeStyle = _getTextStyleForSize();
    
    return textStyle ?? baseStyle.copyWith(
      color: effectiveColor,
      fontSize: sizeStyle.fontSize,
      fontWeight: sizeStyle.fontWeight,
      height: sizeStyle.height,
    );
  }

  TextStyle _getTextStyleForSize() {
    switch (size) {
      case BaseTagSize.small:
        return const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          height: 1.45,
        );
      case BaseTagSize.medium:
        return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.33,
        );
      case BaseTagSize.large:
        return const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.29,
        );
    }
  }

  EdgeInsetsGeometry _getPadding() {
    if (padding != null) return padding!;
    
    switch (size) {
      case BaseTagSize.small:
        return const EdgeInsets.symmetric(horizontal: 6, vertical: 2);
      case BaseTagSize.medium:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case BaseTagSize.large:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
    }
  }

  bool _shouldShowBorder() {
    switch (style) {
      case BaseTagStyle.filled:
        return true;
      case BaseTagStyle.outlined:
        return true;
      case BaseTagStyle.soft:
        return false;
    }
  }
}

/// Defines the visual style variants for the tag.
enum BaseTagStyle {
  /// Filled background with border (default Material chip style).
  filled,
  
  /// Transparent background with border (outlined style).
  outlined,
  
  /// Soft colored background without border (modern style).
  soft,
}

/// Defines the size variants for the tag.
enum BaseTagSize {
  /// Small tag with minimal padding and smaller text.
  small,
  
  /// Medium tag with standard padding (default).
  medium,
  
  /// Large tag with generous padding and larger text.
  large,
}