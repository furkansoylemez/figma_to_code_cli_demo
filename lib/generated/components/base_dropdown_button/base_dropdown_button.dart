import 'package:flutter/material.dart';

/// A customizable dropdown button component that displays text with a dropdown indicator icon.
/// 
/// This component serves as a base for dropdown interactions and can be styled
/// to match different design systems through its extensive parameters.
/// 
/// Example usage:
/// ```dart
/// BaseDropdownButton(
///   text: 'Select option',
///   onTap: () => _showDropdown(),
/// )
/// ```
class BaseDropdownButton extends StatelessWidget {
  /// Creates a [BaseDropdownButton] with the specified properties.
  const BaseDropdownButton({
    super.key,
    required this.text,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius = 8.0,
    this.textColor,
    this.textStyle,
    this.iconColor,
    this.iconSize = 16.0,
    this.icon = Icons.keyboard_arrow_down,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 8.0,
    this.spacing = 8.0,
    this.height,
    this.width,
    this.enabled = true,
    this.alignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.semanticLabel,
  });

  /// The text to display in the dropdown button
  final String text;

  /// Callback function when the dropdown button is tapped
  final VoidCallback? onTap;

  /// Background color of the dropdown button
  /// Defaults to transparent
  final Color? backgroundColor;

  /// Border color of the dropdown button
  /// Defaults to [ColorScheme.outline]
  final Color? borderColor;

  /// Width of the border
  /// Defaults to 1.0
  final double borderWidth;

  /// Corner radius of the dropdown button
  /// Defaults to 8.0
  final double borderRadius;

  /// Color of the text
  /// Defaults to [ColorScheme.onSurface] with 88% opacity
  final Color? textColor;

  /// Text style for the dropdown text
  /// Defaults to [TextTheme.bodyMedium]
  final TextStyle? textStyle;

  /// Color of the dropdown icon
  /// Defaults to [ColorScheme.onSurface] with 88% opacity
  final Color? iconColor;

  /// Size of the dropdown icon
  /// Defaults to 16.0
  final double iconSize;

  /// Icon to display as dropdown indicator
  /// Defaults to [Icons.keyboard_arrow_down]
  final IconData icon;

  /// Horizontal padding inside the dropdown button
  /// Defaults to 16.0
  final double horizontalPadding;

  /// Vertical padding inside the dropdown button
  /// Defaults to 8.0
  final double verticalPadding;

  /// Spacing between text and icon
  /// Defaults to 8.0
  final double spacing;

  /// Fixed height of the dropdown button
  /// If null, height will be determined by content and padding
  final double? height;

  /// Fixed width of the dropdown button
  /// If null, width will be determined by content and padding
  final double? width;

  /// Whether the dropdown button is enabled
  /// Defaults to true
  final bool enabled;

  /// How to align the text and icon horizontally
  /// Defaults to [MainAxisAlignment.spaceBetween]
  final MainAxisAlignment alignment;

  /// How to align the text and icon vertically
  /// Defaults to [CrossAxisAlignment.center]
  final CrossAxisAlignment crossAxisAlignment;

  /// Semantic label for accessibility
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    
    final effectiveBackgroundColor = backgroundColor ?? Colors.transparent;
    final effectiveBorderColor = borderColor ?? colorScheme.outline;
    final effectiveTextColor = textColor ?? colorScheme.onSurface.withOpacity(0.88);
    final effectiveIconColor = iconColor ?? colorScheme.onSurface.withOpacity(0.88);
    final effectiveTextStyle = textStyle ?? textTheme.bodyMedium;
    
    final disabledBackgroundColor = effectiveBackgroundColor;
    final disabledBorderColor = effectiveBorderColor.withOpacity(0.38);
    final disabledTextColor = effectiveTextColor.withOpacity(0.38);
    final disabledIconColor = effectiveIconColor.withOpacity(0.38);

    Widget child = Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: enabled ? effectiveBackgroundColor : disabledBackgroundColor,
        border: Border.all(
          color: enabled ? effectiveBorderColor : disabledBorderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisAlignment: alignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: width != null ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              text,
              style: effectiveTextStyle?.copyWith(
                color: enabled ? effectiveTextColor : disabledTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: spacing),
          Icon(
            icon,
            size: iconSize,
            color: enabled ? effectiveIconColor : disabledIconColor,
          ),
        ],
      ),
    );

    if (semanticLabel != null) {
      child = Semantics(
        label: semanticLabel,
        button: true,
        enabled: enabled,
        child: child,
      );
    }

    if (!enabled || onTap == null) {
      return child;
    }

    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: child,
      ),
    );
  }
}