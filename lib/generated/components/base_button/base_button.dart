import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class BaseButton extends StatelessWidget {
  final String? text;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final ButtonSize size;
  final double? customHeight;
  final double? customWidth;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final TextStyle? textStyle;
  final double? iconSpacing;
  final double? iconSize;
  final bool showText;
  final bool showLeftIcon;
  final bool showRightIcon;
  final bool isLoading;
  final Widget? loadingIndicator;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final BorderSide? borderSide;
  final double? elevation;
  final Color? overlayColor;
  final Duration? animationDuration;

  const BaseButton({
    super.key,
    this.text,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.size = ButtonSize.medium,
    this.customHeight,
    this.customWidth,
    this.padding,
    this.borderRadius,
    this.textStyle,
    this.iconSpacing,
    this.iconSize,
    this.showText = true,
    this.showLeftIcon = false,
    this.showRightIcon = false,
    this.isLoading = false,
    this.loadingIndicator,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.borderSide,
    this.elevation,
    this.overlayColor,
    this.animationDuration,
  });

  double _getButtonHeight(BuildContext context) {
    if (customHeight != null) return customHeight!;

    switch (size) {
      case ButtonSize.small:
        return 32.0;
      case ButtonSize.medium:
        return 40.0;
      case ButtonSize.large:
        return 48.0;
    }
  }

  EdgeInsetsGeometry _getPadding(BuildContext context) {
    if (padding != null) return padding!;

    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
    }
  }

  double _getIconSize(BuildContext context) {
    if (iconSize != null) return iconSize!;

    switch (size) {
      case ButtonSize.small:
        return 16.0;
      case ButtonSize.medium:
        return 18.0;
      case ButtonSize.large:
        return 20.0;
    }
  }

  double _getIconSpacing(BuildContext context) {
    return iconSpacing ?? 8.0;
  }

  TextStyle _getTextStyle(BuildContext context) {
    final theme = Theme.of(context);

    if (textStyle != null) return textStyle!;

    switch (size) {
      case ButtonSize.small:
        return theme.textTheme.labelMedium ??
            const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);
      case ButtonSize.medium:
        return theme.textTheme.labelLarge ??
            const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);
      case ButtonSize.large:
        return theme.textTheme.titleSmall ??
            const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);
    }
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      return loadingIndicator ??
          SizedBox(
            width: _getIconSize(context),
            height: _getIconSize(context),
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
    }

    final List<Widget> children = [];

    if (showLeftIcon && leftIcon != null) {
      children.add(
        SizedBox(
          width: _getIconSize(context),
          height: _getIconSize(context),
          child: leftIcon!,
        ),
      );
    }

    if (showText && text != null && text!.isNotEmpty) {
      if (children.isNotEmpty) {
        children.add(SizedBox(width: _getIconSpacing(context)));
      }

      children.add(
        Text(
          text!,
          style: _getTextStyle(context).copyWith(
            color: onPressed != null
                ? (foregroundColor ?? Theme.of(context).colorScheme.onPrimary)
                : (disabledForegroundColor ??
                      Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.38)),
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (showRightIcon && rightIcon != null) {
      if (children.isNotEmpty) {
        children.add(SizedBox(width: _getIconSpacing(context)));
      }

      children.add(
        SizedBox(
          width: _getIconSize(context),
          height: _getIconSize(context),
          child: rightIcon!,
        ),
      );
    }

    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEnabled = onPressed != null && !isLoading;

    return SizedBox(
      width: customWidth,
      height: _getButtonHeight(context),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled
              ? (backgroundColor ?? theme.colorScheme.primary)
              : (disabledBackgroundColor ??
                    theme.colorScheme.onSurface.withOpacity(0.12)),
          foregroundColor: isEnabled
              ? (foregroundColor ?? theme.colorScheme.onPrimary)
              : (disabledForegroundColor ??
                    theme.colorScheme.onSurface.withOpacity(0.38)),
          elevation: elevation ?? (isEnabled ? 2.0 : 0.0),
          shadowColor: theme.colorScheme.shadow,
          surfaceTintColor: backgroundColor ?? theme.colorScheme.primary,
          padding: _getPadding(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
            side: borderSide ?? BorderSide.none,
          ),
          overlayColor: overlayColor,
          animationDuration:
              animationDuration ?? const Duration(milliseconds: 200),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: _buildContent(context),
      ),
    );
  }
}
