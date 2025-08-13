import 'package:flutter/material.dart';

/// A base floating action button component that wraps Material's FloatingActionButton
/// with additional customization options for design system flexibility.
class BaseFloatingActionButton extends StatelessWidget {
  /// Creates a base floating action button.
  const BaseFloatingActionButton({
    super.key,
    required this.onPressed,
    this.icon,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.hoverColor,
    this.focusColor,
    this.splashColor,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.mini = false,
    this.shape,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.isExtended = false,
    this.enableFeedback,
    this.mouseCursor,
    this.tooltip,
    this.heroTag,
    this.focusNode,
    this.size = 56.0,
    this.iconSize = 24.0,
    this.borderRadius = 16.0,
    this.shadows,
  }) : assert(
         (icon != null && child == null) || (icon == null && child != null),
         'Either icon or child must be provided, but not both.',
       );

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The icon to display in the button. Mutually exclusive with [child].
  final IconData? icon;

  /// The widget to display in the button. Mutually exclusive with [icon].
  final Widget? child;

  /// The button's background color.
  final Color? backgroundColor;

  /// The default foreground color for icons and text within the button.
  final Color? foregroundColor;

  /// The color to use for the button's background when the button is hovered over.
  final Color? hoverColor;

  /// The color to use for the button's background when the button has input focus.
  final Color? focusColor;

  /// The splash color for the button's ink response.
  final Color? splashColor;

  /// The z-coordinate at which to place this button relative to its parent.
  final double? elevation;

  /// The z-coordinate at which to place this button relative to its parent when focused.
  final double? focusElevation;

  /// The z-coordinate at which to place this button relative to its parent when hovered.
  final double? hoverElevation;

  /// The z-coordinate at which to place this button relative to its parent when pressed.
  final double? highlightElevation;

  /// The z-coordinate at which to place this button when disabled.
  final double? disabledElevation;

  /// Controls the size of this button.
  final bool mini;

  /// The shape of the button's outline.
  final ShapeBorder? shape;

  /// The content will be clipped (or not) according to this option.
  final Clip clipBehavior;

  /// Whether this widget will be selected as the initial focus when no other node is focused.
  final bool autofocus;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// Whether this is an extended floating action button.
  final bool isExtended;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  final bool? enableFeedback;

  /// The cursor for a mouse pointer when it enters or is hovering over the widget.
  final MouseCursor? mouseCursor;

  /// Text that describes the action that will occur when the button is pressed.
  final String? tooltip;

  /// The tag to apply to the button's hero widget.
  final Object? heroTag;

  /// An optional focus node to use as the focus node for this widget.
  final FocusNode? focusNode;

  /// The size of the button. Defaults to 56.0 (Material Design standard).
  final double size;

  /// The size of the icon. Defaults to 24.0.
  final double iconSize;

  /// The border radius of the button. Defaults to 16.0.
  final double borderRadius;

  /// The shadows to apply to the button.
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
    final effectiveForegroundColor = foregroundColor ?? colorScheme.onPrimary;
    
    final buttonShape = shape ?? RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    );

    Widget buttonChild;
    if (icon != null) {
      buttonChild = Icon(
        icon,
        size: iconSize,
        color: effectiveForegroundColor,
      );
    } else {
      buttonChild = DefaultTextStyle(
        style: TextStyle(color: effectiveForegroundColor),
        child: IconTheme(
          data: IconThemeData(
            color: effectiveForegroundColor,
            size: iconSize,
          ),
          child: child!,
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: shadows != null 
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: shadows,
            )
          : null,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        hoverColor: hoverColor,
        focusColor: focusColor,
        splashColor: splashColor,
        elevation: elevation ?? 6.0,
        focusElevation: focusElevation,
        hoverElevation: hoverElevation,
        highlightElevation: highlightElevation,
        disabledElevation: disabledElevation,
        mini: mini,
        shape: buttonShape,
        clipBehavior: clipBehavior,
        autofocus: autofocus,
        materialTapTargetSize: materialTapTargetSize,
        enableFeedback: enableFeedback,
        mouseCursor: mouseCursor,
        tooltip: tooltip,
        heroTag: heroTag,
        focusNode: focusNode,
        child: buttonChild,
      ),
    );
  }
}