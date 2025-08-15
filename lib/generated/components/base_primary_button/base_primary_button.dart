import 'package:flutter/material.dart';

/// A customizable primary button component that wraps Material's ElevatedButton
/// with additional styling options and consistent theming capabilities.
class BasePrimaryButton extends StatelessWidget {
  /// Creates a base primary button.
  ///
  /// The [text] parameter is required and specifies the button's label.
  /// The [onPressed] callback is called when the button is tapped.
  const BasePrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.elevation,
    this.pressedElevation,
    this.disabledElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.padding,
    this.minimumSize,
    this.maximumSize,
    this.borderRadius,
    this.borderSide,
    this.textStyle,
    this.alignment,
    this.splashFactory,
    this.enableFeedback = true,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onHover,
    this.onFocusChange,
    this.onLongPress,
    this.mouseCursor,
    this.visualDensity,
    this.tapTargetSize,
    this.animationDuration,
    this.enabledFeedback,
    this.overlayColor,
  });

  /// The text displayed on the button.
  final String text;

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The button's background color.
  /// Defaults to [ColorScheme.primary] from the current theme.
  final Color? backgroundColor;

  /// The button's foreground color (text and icon color).
  /// Defaults to [ColorScheme.onPrimary] from the current theme.
  final Color? foregroundColor;

  /// The button's background color when disabled.
  final Color? disabledBackgroundColor;

  /// The button's foreground color when disabled.
  final Color? disabledForegroundColor;

  /// The elevation of the button's [Material].
  final double? elevation;

  /// The elevation of the button's [Material] when pressed.
  final double? pressedElevation;

  /// The elevation of the button's [Material] when disabled.
  final double? disabledElevation;

  /// The shadow color of the button's [Material].
  final Color? shadowColor;

  /// The surface tint color of the button's [Material].
  final Color? surfaceTintColor;

  /// The internal padding for the button's child.
  /// Defaults to Material Design standard button padding.
  final EdgeInsetsGeometry? padding;

  /// The minimum size of the button.
  /// Defaults to Material Design minimum tap target size.
  final Size? minimumSize;

  /// The maximum size of the button.
  final Size? maximumSize;

  /// The border radius of the button.
  /// Defaults to Material Design standard border radius.
  final BorderRadius? borderRadius;

  /// The border side of the button.
  final BorderSide? borderSide;

  /// The text style for the button's text.
  /// Defaults to [TextTheme.labelLarge] from the current theme.
  final TextStyle? textStyle;

  /// The alignment of the button's child.
  final AlignmentGeometry? alignment;

  /// The splash factory for the button's [InkWell].
  final InteractiveInkFeatureFactory? splashFactory;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  final bool enableFeedback;

  /// Whether this button should focus itself if nothing else is already focused.
  final bool autofocus;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// An optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// Called when a pointer enters or exits the button response area.
  final ValueChanged<bool>? onHover;

  /// Called when the focus changes.
  final ValueChanged<bool>? onFocusChange;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The cursor for a mouse pointer when it enters or is hovering over the button.
  final MouseCursor? mouseCursor;

  /// Defines how compact the button's layout will be.
  final VisualDensity? visualDensity;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? tapTargetSize;

  /// The animation duration for the button's elevation changes.
  final Duration? animationDuration;

  /// Whether detected gestures should provide feedback.
  final bool? enabledFeedback;

  /// The overlay color of the button's [InkWell].
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      style:
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? colorScheme.primary,
            foregroundColor: foregroundColor ?? colorScheme.onPrimary,
            disabledBackgroundColor: disabledBackgroundColor,
            disabledForegroundColor: disabledForegroundColor,
            elevation: elevation,
            shadowColor: shadowColor,
            surfaceTintColor: surfaceTintColor,
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            minimumSize: minimumSize ?? const Size(64, 48),
            maximumSize: maximumSize,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              side: borderSide ?? BorderSide.none,
            ),
            textStyle: textStyle ?? theme.textTheme.labelLarge,
            alignment: alignment,
            splashFactory: splashFactory,
            enableFeedback: enableFeedback,
            visualDensity: visualDensity,
            tapTargetSize: tapTargetSize,
            animationDuration: animationDuration,
            overlayColor: overlayColor,
          ).copyWith(
            elevation: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledElevation;
              }
              if (states.contains(MaterialState.pressed)) {
                return pressedElevation;
              }
              return elevation;
            }),
          ),
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      onHover: onHover,
      onFocusChange: onFocusChange,
      onLongPress: onLongPress,
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
