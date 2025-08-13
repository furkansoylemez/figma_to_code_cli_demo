import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? iconLeft;
  final Widget? iconRight;
  final bool showIconLeft;
  final bool showIconRight;
  final bool showText;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double iconSpacing;
  final double iconSize;
  final double? minimumHeight;
  final double? minimumWidth;
  final ButtonStyle? style;

  const BaseButton({
    super.key,
    required this.text,
    this.onPressed,
    this.iconLeft,
    this.iconRight,
    this.showIconLeft = false,
    this.showIconRight = false,
    this.showText = true,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.textStyle,
    this.padding,
    this.borderRadius,
    this.iconSpacing = 8.0,
    this.iconSize = 18.0,
    this.minimumHeight,
    this.minimumWidth,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
    final effectiveForegroundColor = foregroundColor ?? colorScheme.onPrimary;
    final effectiveTextStyle = textStyle ?? theme.textTheme.labelLarge?.copyWith(
      color: effectiveForegroundColor,
      fontWeight: FontWeight.w500,
    );
    final effectivePadding = padding ?? const EdgeInsets.symmetric(horizontal: 16.0);
    final effectiveBorderRadius = borderRadius ?? 8.0;
    final effectiveMinimumHeight = minimumHeight ?? 40.0;
    
    List<Widget> children = [];
    
    if (showIconLeft && iconLeft != null) {
      children.add(
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: iconLeft,
        ),
      );
    }
    
    if (showText) {
      if (children.isNotEmpty) {
        children.add(SizedBox(width: iconSpacing));
      }
      children.add(
        Text(
          text,
          style: effectiveTextStyle,
        ),
      );
    }
    
    if (showIconRight && iconRight != null) {
      if (children.isNotEmpty) {
        children.add(SizedBox(width: iconSpacing));
      }
      children.add(
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: iconRight,
        ),
      );
    }
    
    final buttonStyle = style ?? ElevatedButton.styleFrom(
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      disabledBackgroundColor: disabledBackgroundColor ?? colorScheme.onSurface.withOpacity(0.12),
      disabledForegroundColor: disabledForegroundColor ?? colorScheme.onSurface.withOpacity(0.38),
      padding: effectivePadding,
      minimumSize: Size(minimumWidth ?? 0, effectiveMinimumHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
      ),
      elevation: 0,
      shadowColor: Colors.transparent,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}