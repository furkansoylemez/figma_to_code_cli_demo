import 'package:flutter/material.dart';

/// A base primary button component that extends Material Design's ElevatedButton
/// with additional customization options for component libraries.
class BasePrimaryButton extends StatelessWidget {
  /// Creates a base primary button.
  const BasePrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height = 50.0,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.textStyle,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.animationDuration,
    this.enableFeedback = true,
    this.autofocus = false,
    this.focusNode,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.clipBehavior = Clip.none,
    this.icon,
    this.iconSize,
    this.iconAlignment = IconAlignment.start,
    this.gap,
  });

  /// The text to display on the button.
  final String text;

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The width of the button. If null, the button will size itself to its content.
  final double? width;

  /// The height of the button. Defaults to 50.0 to match Material Design standards.
  final double height;

  /// The background color of the button.
  /// Defaults to Theme.of(context).colorScheme.primary.
  final Color? backgroundColor;

  /// The foreground color of the button (text and icon color).
  /// Defaults to Theme.of(context).colorScheme.onPrimary.
  final Color? foregroundColor;

  /// The background color of the button when disabled.
  /// Defaults to Theme.of(context).colorScheme.onSurface.withOpacity(0.12).
  final Color? disabledBackgroundColor;

  /// The foreground color of the button when disabled.
  /// Defaults to Theme.of(context).colorScheme.onSurface.withOpacity(0.38).
  final Color? disabledForegroundColor;

  /// The text style for the button text.
  /// Defaults to Theme.of(context).textTheme.labelLarge.
  final TextStyle? textStyle;

  /// The internal padding of the button.
  /// Defaults to EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0).
  final EdgeInsetsGeometry? padding;

  /// The border radius of the button.
  /// Defaults to BorderRadius.circular(4.0) for Material Design compliance.
  final BorderRadius? borderRadius;

  /// The elevation of the button.
  final double? elevation;

  /// The elevation of the button when focused.
  final double? focusElevation;

  /// The elevation of the button when hovered.
  final double? hoverElevation;

  /// The elevation of the button when pressed.
  final double? highlightElevation;

  /// The elevation of the button when disabled.
  final double? disabledElevation;

  /// The color of the button's shadow.
  final Color? shadowColor;

  /// The surface tint color of the button.
  final Color? surfaceTintColor;

  /// The duration of the button's animation.
  final Duration? animationDuration;

  /// Whether the button should provide haptic feedback.
  final bool enableFeedback;

  /// Whether the button should be focused initially.
  final bool autofocus;

  /// The focus node for the button.
  final FocusNode? focusNode;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// Called when the button is hovered.
  final ValueChanged<bool>? onHover;

  /// Called when the focus state of the button changes.
  final ValueChanged<bool>? onFocusChange;

  /// The clipping behavior of the button.
  final Clip clipBehavior;

  /// An optional icon to display on the button.
  final Widget? icon;

  /// The size of the icon. If null, uses the default icon size.
  final double? iconSize;

  /// The alignment of the icon relative to the text.
  final IconAlignment iconAlignment;

  /// The gap between the icon and text. If null, uses Material Design default.
  final double? gap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? colorScheme.primary,
      foregroundColor: foregroundColor ?? colorScheme.onPrimary,
      disabledBackgroundColor:
          disabledBackgroundColor ?? colorScheme.onSurface.withOpacity(0.12),
      disabledForegroundColor:
          disabledForegroundColor ?? colorScheme.onSurface.withOpacity(0.38),
      textStyle: textStyle ?? theme.textTheme.labelLarge,
      padding:
          padding ??
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4.0),
      ),
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      fixedSize: Size(width ?? double.infinity, height),
      minimumSize: Size(width ?? 64.0, height),
    );

    Widget buttonChild = Text(text);

    if (icon != null) {
      buttonChild = icon is Icon
          ? Icon((icon as Icon).icon, size: iconSize ?? (icon as Icon).size)
          : icon!;

      if (iconAlignment == IconAlignment.start) {
        buttonChild = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonChild,
            SizedBox(width: gap ?? 8.0),
            Text(text),
          ],
        );
      } else {
        buttonChild = Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            SizedBox(width: gap ?? 8.0),
            buttonChild,
          ],
        );
      }
    }

    Widget button = ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: buttonStyle,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: buttonChild,
    );

    if (width != null) {
      return SizedBox(width: width, height: height, child: button);
    }

    return button;
  }
}
