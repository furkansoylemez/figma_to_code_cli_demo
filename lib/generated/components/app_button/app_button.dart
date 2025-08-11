import 'package:flutter/material.dart';

enum AppButtonType { standard, floatingAction }
enum AppButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  final AppButtonType type;
  final AppButtonSize size;
  final String? text;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? icon;
  final bool showText;
  final bool showLeadingIcon;
  final bool showTrailingIcon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? iconSpacing;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final double? iconSize;
  final bool enabled;
  final List<BoxShadow>? boxShadow;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const AppButton({
    super.key,
    this.type = AppButtonType.standard,
    this.size = AppButtonSize.medium,
    this.text,
    this.leadingIcon,
    this.trailingIcon,
    this.icon,
    this.showText = true,
    this.showLeadingIcon = false,
    this.showTrailingIcon = false,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.borderRadius,
    this.padding,
    this.iconSpacing,
    this.width,
    this.height,
    this.textStyle,
    this.iconSize,
    this.enabled = true,
    this.boxShadow,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final bool isEnabled = enabled && onPressed != null;
    final bool isFloatingAction = type == AppButtonType.floatingAction;

    Color effectiveBackgroundColor;
    Color effectiveForegroundColor;
    
    if (isEnabled) {
      effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
      effectiveForegroundColor = foregroundColor ?? colorScheme.onPrimary;
    } else {
      effectiveBackgroundColor = disabledBackgroundColor ?? colorScheme.onSurface.withOpacity(0.12);
      effectiveForegroundColor = disabledForegroundColor ?? colorScheme.onSurface.withOpacity(0.38);
    }

    final double effectiveBorderRadius = borderRadius ?? _getDefaultBorderRadius();
    final EdgeInsetsGeometry effectivePadding = padding ?? _getDefaultPadding();
    final double effectiveIconSpacing = iconSpacing ?? _getDefaultIconSpacing();
    final TextStyle effectiveTextStyle = textStyle ?? _getDefaultTextStyle(textTheme);
    final double effectiveIconSize = iconSize ?? _getDefaultIconSize();
    final Size effectiveSize = _getDefaultSize();
    final List<BoxShadow> effectiveBoxShadow = boxShadow ?? _getDefaultBoxShadow();

    Widget content;

    if (isFloatingAction) {
      content = Icon(
        (icon as Icon?)?.icon ?? Icons.add,
        size: effectiveIconSize,
        color: effectiveForegroundColor,
      );
    } else {
      final List<Widget> children = [];

      if (showLeadingIcon && leadingIcon != null) {
        Widget iconWidget = leadingIcon!;
        if (iconWidget is Icon) {
          iconWidget = Icon(
            iconWidget.icon,
            size: effectiveIconSize,
            color: effectiveForegroundColor,
          );
        }
        children.add(iconWidget);
      }

      if (showText && text != null && text!.isNotEmpty) {
        if (children.isNotEmpty) {
          children.add(SizedBox(width: effectiveIconSpacing));
        }
        children.add(
          Text(
            text!,
            style: effectiveTextStyle.copyWith(color: effectiveForegroundColor),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }

      if (showTrailingIcon && trailingIcon != null) {
        if (children.isNotEmpty) {
          children.add(SizedBox(width: effectiveIconSpacing));
        }
        Widget iconWidget = trailingIcon!;
        if (iconWidget is Icon) {
          iconWidget = Icon(
            iconWidget.icon,
            size: effectiveIconSize,
            color: effectiveForegroundColor,
          );
        }
        children.add(iconWidget);
      }

      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
    }

    Widget button = Container(
      width: width ?? (isFloatingAction ? effectiveSize.width : null),
      height: height ?? effectiveSize.height,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        boxShadow: effectiveBoxShadow,
      ),
      padding: effectivePadding,
      child: isFloatingAction
          ? Center(child: content)
          : content,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        child: button,
      ),
    );
  }

  double _getDefaultBorderRadius() {
    switch (type) {
      case AppButtonType.standard:
        return 8.0;
      case AppButtonType.floatingAction:
        return 4.0;
    }
  }

  EdgeInsetsGeometry _getDefaultPadding() {
    if (type == AppButtonType.floatingAction) {
      return EdgeInsets.zero;
    }

    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0);
    }
  }

  double _getDefaultIconSpacing() {
    return 8.0;
  }

  TextStyle _getDefaultTextStyle(TextTheme textTheme) {
    switch (size) {
      case AppButtonSize.small:
        return textTheme.labelMedium ?? const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);
      case AppButtonSize.medium:
        return textTheme.labelLarge ?? const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);
      case AppButtonSize.large:
        return textTheme.labelLarge ?? const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);
    }
  }

  double _getDefaultIconSize() {
    switch (size) {
      case AppButtonSize.small:
        return 16.0;
      case AppButtonSize.medium:
      case AppButtonSize.large:
        return 18.0;
    }
  }

  Size _getDefaultSize() {
    if (type == AppButtonType.floatingAction) {
      return const Size(40.0, 40.0);
    }

    switch (size) {
      case AppButtonSize.small:
        return const Size(double.infinity, 32.0);
      case AppButtonSize.medium:
        return const Size(double.infinity, 36.0);
      case AppButtonSize.large:
        return const Size(double.infinity, 40.0);
    }
  }

  List<BoxShadow> _getDefaultBoxShadow() {
    if (type == AppButtonType.floatingAction) {
      return [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0, 9),
          blurRadius: 28.0,
          spreadRadius: 8.0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          offset: const Offset(0, 3),
          blurRadius: 6.0,
          spreadRadius: -4.0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          offset: const Offset(0, 6),
          blurRadius: 16.0,
        ),
      ];
    }
    return [];
  }
}