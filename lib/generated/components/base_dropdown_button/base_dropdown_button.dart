import 'package:flutter/material.dart';

/// A customizable dropdown button widget that provides a clean, Material Design 3 compliant
/// dropdown interface with configurable styling and behavior.
/// 
/// This widget creates a button-like appearance with text and a dropdown icon,
/// suitable for triggering dropdown menus or selection dialogs.
class BaseDropdownButton extends StatelessWidget {
  /// Creates a dropdown button widget.
  const BaseDropdownButton({
    super.key,
    required this.text,
    this.onTap,
    this.enabled = true,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.textStyle,
    this.borderRadius = 6.0,
    this.borderWidth = 1.0,
    this.horizontalPadding = 16.0,
    this.verticalPadding,
    this.contentSpacing = 4.0,
    this.minHeight = 32.0,
    this.icon,
    this.iconSize = 14.0,
    this.width,
    this.alignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  /// The text to display in the dropdown button
  final String text;

  /// Callback function triggered when the button is tapped
  final VoidCallback? onTap;

  /// Whether the dropdown button is enabled
  final bool enabled;

  /// Background color of the button
  /// Defaults to transparent
  final Color? backgroundColor;

  /// Color of the button border
  /// Defaults to [ColorScheme.outline]
  final Color? borderColor;

  /// Color of the button text
  /// Defaults to [ColorScheme.onSurface] with 88% opacity when enabled,
  /// [ColorScheme.onSurface] with 38% opacity when disabled
  final Color? textColor;

  /// Color of the dropdown icon
  /// Defaults to [ColorScheme.onSurface] with 88% opacity when enabled,
  /// [ColorScheme.onSurface] with 38% opacity when disabled
  final Color? iconColor;

  /// Text style for the button text
  /// Defaults to [TextTheme.bodyMedium]
  final TextStyle? textStyle;

  /// Border radius of the button
  /// Defaults to 6.0 logical pixels
  final double borderRadius;

  /// Width of the button border
  /// Defaults to 1.0 logical pixels
  final double borderWidth;

  /// Horizontal padding inside the button
  /// Defaults to 16.0 logical pixels
  final double horizontalPadding;

  /// Vertical padding inside the button
  /// If null, uses [minHeight] constraints instead
  final double? verticalPadding;

  /// Spacing between text and icon
  /// Defaults to 4.0 logical pixels
  final double contentSpacing;

  /// Minimum height of the button
  /// Defaults to 32.0 logical pixels (Material Design minimum touch target)
  final double minHeight;

  /// Custom icon widget to use instead of default dropdown arrow
  /// If null, uses Material Design dropdown arrow
  final Widget? icon;

  /// Size of the dropdown icon
  /// Defaults to 14.0 logical pixels
  final double iconSize;

  /// Fixed width of the button
  /// If null, the button will size itself to its content
  final double? width;

  /// Horizontal alignment of content within the button
  /// Defaults to [MainAxisAlignment.spaceBetween]
  final MainAxisAlignment alignment;

  /// Vertical alignment of content within the button
  /// Defaults to [CrossAxisAlignment.center]
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final effectiveTextColor = enabled
        ? (textColor ?? colorScheme.onSurface.withOpacity(0.88))
        : (textColor ?? colorScheme.onSurface.withOpacity(0.38));

    final effectiveIconColor = enabled
        ? (iconColor ?? colorScheme.onSurface.withOpacity(0.88))
        : (iconColor ?? colorScheme.onSurface.withOpacity(0.38));

    final effectiveBorderColor = borderColor ?? colorScheme.outline;

    final effectiveTextStyle = (textStyle ?? textTheme.bodyMedium)?.copyWith(
      color: effectiveTextColor,
      fontSize: textStyle?.fontSize ?? 14.0,
    );

    final dropdownIcon = icon ?? Icon(
      Icons.keyboard_arrow_down,
      size: iconSize,
      color: effectiveIconColor,
    );

    Widget content = Row(
      mainAxisAlignment: alignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text,
            style: effectiveTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: contentSpacing),
        dropdownIcon,
      ],
    );

    Widget button = Container(
      width: width,
      constraints: BoxConstraints(minHeight: minHeight),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding ?? 0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: effectiveBorderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: verticalPadding != null
          ? content
          : Center(child: content),
    );

    if (onTap != null && enabled) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: button,
        ),
      );
    }

    return button;
  }
}