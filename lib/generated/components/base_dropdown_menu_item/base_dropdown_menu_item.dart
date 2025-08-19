import 'package:flutter/material.dart';

enum DropdownMenuItemSize { small, medium, large }

class BaseDropdownMenuItem extends StatelessWidget {
  const BaseDropdownMenuItem({
    super.key,
    required this.text,
    this.onTap,
    this.leadingIcon,
    this.showLeadingIcon = true,
    this.size = DropdownMenuItemSize.medium,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.textStyle,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.iconTextSpacing,
    this.iconSize,
    this.minHeight,
    this.maxWidth,
    this.isEnabled = true,
    this.isSelected = false,
    this.selectedBackgroundColor,
    this.hoveredBackgroundColor,
    this.disabledTextColor,
    this.disabledIconColor,
    this.semanticLabel,
  });

  final String text;
  final VoidCallback? onTap;
  final Widget? leadingIcon;
  final bool showLeadingIcon;
  final DropdownMenuItemSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? iconTextSpacing;
  final double? iconSize;
  final double? minHeight;
  final double? maxWidth;
  final bool isEnabled;
  final bool isSelected;
  final Color? selectedBackgroundColor;
  final Color? hoveredBackgroundColor;
  final Color? disabledTextColor;
  final Color? disabledIconColor;
  final String? semanticLabel;

  double _getSizeValue(
    DropdownMenuItemSize size, {
    required double small,
    required double medium,
    required double large,
  }) {
    switch (size) {
      case DropdownMenuItemSize.small:
        return small;
      case DropdownMenuItemSize.medium:
        return medium;
      case DropdownMenuItemSize.large:
        return large;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveHorizontalPadding =
        horizontalPadding ??
        _getSizeValue(size, small: 8.0, medium: 12.0, large: 16.0);
    final effectiveVerticalPadding =
        verticalPadding ??
        _getSizeValue(size, small: 4.0, medium: 5.0, large: 6.0);
    final effectiveIconTextSpacing =
        iconTextSpacing ??
        _getSizeValue(size, small: 6.0, medium: 8.0, large: 12.0);
    final effectiveIconSize =
        iconSize ?? _getSizeValue(size, small: 14.0, medium: 16.0, large: 18.0);
    final effectiveMinHeight =
        minHeight ??
        _getSizeValue(size, small: 28.0, medium: 32.0, large: 36.0);

    final effectiveTextStyle = textStyle;

    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(4.0);

    Color getEffectiveTextColor() {
      if (!isEnabled) {
        return disabledTextColor ?? colorScheme.onSurface.withOpacity(0.38);
      }
      return textColor ?? colorScheme.onSurface.withOpacity(0.88);
    }

    Color getEffectiveIconColor() {
      if (!isEnabled) {
        return disabledIconColor ?? colorScheme.onSurface.withOpacity(0.38);
      }
      return iconColor ?? colorScheme.onSurface.withOpacity(0.88);
    }

    Color? getEffectiveBackgroundColor(Set<MaterialState> states) {
      if (!isEnabled) {
        return backgroundColor ?? Colors.transparent;
      }

      if (states.contains(MaterialState.pressed)) {
        return selectedBackgroundColor ??
            colorScheme.onSurface.withOpacity(0.12);
      }

      if (states.contains(MaterialState.hovered)) {
        return hoveredBackgroundColor ??
            colorScheme.onSurface.withOpacity(0.08);
      }

      if (isSelected) {
        return selectedBackgroundColor ?? colorScheme.primaryContainer;
      }

      return backgroundColor ?? Colors.transparent;
    }

    Widget buildContent() {
      final children = <Widget>[];

      if (showLeadingIcon && leadingIcon != null) {
        children.add(
          SizedBox(
            width: effectiveIconSize,
            height: effectiveIconSize,
            child: IconTheme(
              data: IconTheme.of(context).copyWith(
                color: getEffectiveIconColor(),
                size: effectiveIconSize,
              ),
              child: leadingIcon!,
            ),
          ),
        );

        children.add(SizedBox(width: effectiveIconTextSpacing));
      }

      children.add(
        Flexible(
          child: Text(
            text,
            style: effectiveTextStyle?.copyWith(color: getEffectiveTextColor()),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      );

      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      );
    }

    return Semantics(
      label: semanticLabel ?? text,
      button: true,
      enabled: isEnabled,
      selected: isSelected,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEnabled ? onTap : null,
          borderRadius: effectiveBorderRadius,
          overlayColor: MaterialStateProperty.resolveWith(
            getEffectiveBackgroundColor,
          ),
          child: Container(
            constraints: BoxConstraints(
              minHeight: effectiveMinHeight,
              maxWidth: maxWidth ?? double.infinity,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: effectiveHorizontalPadding,
              vertical: effectiveVerticalPadding,
            ),
            decoration: BoxDecoration(
              color: isSelected
                  ? (selectedBackgroundColor ?? colorScheme.primaryContainer)
                  : (backgroundColor ?? Colors.transparent),
              borderRadius: effectiveBorderRadius,
            ),
            child: buildContent(),
          ),
        ),
      ),
    );
  }
}
