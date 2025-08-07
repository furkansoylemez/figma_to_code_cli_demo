import 'package:flutter/material.dart';

/// A base dropdown menu item component that provides a consistent layout
/// and interaction pattern for dropdown list items with optional leading icon.
///
/// This component follows Material Design principles and integrates with
/// Flutter's theming system for consistent visual appearance across the app.
///
/// Example usage:
/// ```dart
/// BaseDropdownMenuItem(
///   text: 'Settings',
///   leadingIcon: Icons.settings,
///   onTap: () => Navigator.push(...),
/// )
/// ```
class BaseDropdownMenuItem extends StatelessWidget {
  /// Creates a base dropdown menu item.
  ///
  /// The [text] parameter is required and represents the main content.
  /// All other parameters are optional and will use theme-based defaults.
  const BaseDropdownMenuItem({
    super.key,
    required this.text,
    this.leadingIcon,
    this.showIcon = true,
    this.onTap,
    this.onHover,
    this.enabled = true,
    this.textStyle,
    this.iconColor,
    this.backgroundColor,
    this.hoverColor,
    this.disabledColor,
    this.borderRadius,
    this.height = 32.0,
    this.horizontalPadding = 12.0,
    this.verticalPadding = 6.0,
    this.iconSpacing = 8.0,
    this.iconSize = 16.0,
    this.minWidth,
    this.maxWidth,
    this.semanticsLabel,
    this.focusNode,
    this.autofocus = false,
  });

  /// The text content to display in the dropdown item.
  final String text;

  /// Optional leading icon to display before the text.
  final IconData? leadingIcon;

  /// Whether to show the leading icon when [leadingIcon] is provided.
  final bool showIcon;

  /// Callback fired when the item is tapped.
  final VoidCallback? onTap;

  /// Callback fired when the item is hovered.
  final ValueChanged<bool>? onHover;

  /// Whether the item is enabled and can be interacted with.
  final bool enabled;

  /// Custom text style for the item text.
  /// Defaults to [TextTheme.bodyMedium] from the current theme.
  final TextStyle? textStyle;

  /// Custom color for the leading icon.
  /// Defaults to [ColorScheme.onSurface] with 88% opacity from the current theme.
  final Color? iconColor;

  /// Background color of the item.
  /// Defaults to transparent.
  final Color? backgroundColor;

  /// Color when the item is hovered.
  /// Defaults to [ColorScheme.onSurface] with 8% opacity from the current theme.
  final Color? hoverColor;

  /// Color when the item is disabled.
  /// Defaults to [ColorScheme.onSurface] with 38% opacity from the current theme.
  final Color? disabledColor;

  /// Border radius for the item container.
  /// Defaults to 4.0 logical pixels.
  final BorderRadius? borderRadius;

  /// Fixed height of the dropdown item.
  /// Defaults to 32.0 logical pixels following Material Design standards.
  final double height;

  /// Horizontal padding inside the item.
  /// Defaults to 12.0 logical pixels.
  final double horizontalPadding;

  /// Vertical padding inside the item.
  /// Defaults to 6.0 logical pixels.
  final double verticalPadding;

  /// Spacing between the icon and text.
  /// Defaults to 8.0 logical pixels.
  final double iconSpacing;

  /// Size of the leading icon.
  /// Defaults to 16.0 logical pixels.
  final double iconSize;

  /// Minimum width constraint for the item.
  final double? minWidth;

  /// Maximum width constraint for the item.
  final double? maxWidth;

  /// Semantic label for accessibility.
  final String? semanticsLabel;

  /// Focus node for keyboard navigation.
  final FocusNode? focusNode;

  /// Whether this item should be focused initially.
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final effectiveTextStyle = textStyle ?? textTheme.bodyMedium?.copyWith(
      fontSize: 14.0,
      height: 24.0 / 14.0,
    );

    final effectiveIconColor = enabled
        ? iconColor ?? colorScheme.onSurface.withOpacity(0.88)
        : disabledColor ?? colorScheme.onSurface.withOpacity(0.38);

    final effectiveTextColor = enabled
        ? effectiveTextStyle?.color ?? colorScheme.onSurface.withOpacity(0.88)
        : disabledColor ?? colorScheme.onSurface.withOpacity(0.38);

    final effectiveHoverColor = hoverColor ?? colorScheme.onSurface.withOpacity(0.08);
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(4.0);

    Widget content = Container(
      height: height,
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: effectiveBorderRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showIcon && leadingIcon != null) ...[
            Icon(
              leadingIcon,
              size: iconSize,
              color: effectiveIconColor,
            ),
            SizedBox(width: iconSpacing),
          ],
          Flexible(
            child: Text(
              text,
              style: effectiveTextStyle?.copyWith(
                color: effectiveTextColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );

    if (!enabled) {
      content = Semantics(
        enabled: false,
        label: semanticsLabel ?? text,
        child: content,
      );
      return content;
    }

    return Semantics(
      button: true,
      enabled: enabled,
      label: semanticsLabel ?? text,
      child: Focus(
        focusNode: focusNode,
        autofocus: autofocus,
        child: InkWell(
          onTap: onTap,
          onHover: onHover,
          hoverColor: effectiveHoverColor,
          borderRadius: effectiveBorderRadius,
          child: content,
        ),
      ),
    );
  }
}