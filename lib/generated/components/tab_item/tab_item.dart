import 'package:flutter/material.dart';

enum TabItemState { active, defaultState, hover }

enum TabIndicatorPosition { top, bottom }

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.title,
    this.state = TabItemState.defaultState,
    this.indicatorPosition = TabIndicatorPosition.bottom,
    this.icon,
    this.showBadge = false,
    this.badgeText,
    this.badgeCount,
    this.onTap,
    this.onHover,
    this.titleStyle,
    this.activeColor,
    this.defaultColor,
    this.hoverColor,
    this.indicatorColor,
    this.indicatorWidth = 2.0,
    this.badgeBackgroundColor,
    this.badgeTextColor,
    this.badgeRadius = 16.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    this.spacing = 4.0,
    this.minWidth = 80.0,
    this.height,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.enabled = true,
  });

  final String title;
  final TabItemState state;
  final TabIndicatorPosition indicatorPosition;
  final Widget? icon;
  final bool showBadge;
  final String? badgeText;
  final int? badgeCount;
  final VoidCallback? onTap;
  final ValueChanged<bool>? onHover;
  final TextStyle? titleStyle;
  final Color? activeColor;
  final Color? defaultColor;
  final Color? hoverColor;
  final Color? indicatorColor;
  final double indicatorWidth;
  final Color? badgeBackgroundColor;
  final Color? badgeTextColor;
  final double badgeRadius;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final double minWidth;
  final double? height;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveActiveColor = activeColor ?? colorScheme.primary;
    final effectiveDefaultColor =
        defaultColor ?? colorScheme.onSurface.withOpacity(0.88);
    final effectiveHoverColor =
        hoverColor ?? colorScheme.onSurface.withOpacity(0.88);
    final effectiveIndicatorColor = indicatorColor ?? effectiveActiveColor;

    Color getCurrentTextColor() {
      switch (state) {
        case TabItemState.active:
          return effectiveActiveColor;
        case TabItemState.hover:
          return effectiveHoverColor;
        case TabItemState.defaultState:
          return effectiveDefaultColor;
      }
    }

    Color? getCurrentBackgroundColor() {
      switch (state) {
        case TabItemState.hover:
          return colorScheme.onSurface.withOpacity(0.03);
        case TabItemState.active:
        case TabItemState.defaultState:
          return null;
      }
    }

    Color getCurrentBadgeBackgroundColor() {
      switch (state) {
        case TabItemState.active:
          return badgeBackgroundColor ?? effectiveActiveColor;
        case TabItemState.hover:
        case TabItemState.defaultState:
          return badgeBackgroundColor ??
              colorScheme.onSurface.withOpacity(0.06);
      }
    }

    Color getCurrentBadgeTextColor() {
      switch (state) {
        case TabItemState.active:
          return badgeTextColor ?? colorScheme.onPrimary;
        case TabItemState.hover:
        case TabItemState.defaultState:
          return badgeTextColor ?? effectiveDefaultColor;
      }
    }

    bool shouldShowIndicator() {
      return state == TabItemState.active;
    }

    final effectiveTitleStyle =
        titleStyle ??
        theme.textTheme.labelMedium?.copyWith(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          height: 24.0 / 14.0,
        );

    final badgeDisplayText =
        badgeText ?? (badgeCount != null ? badgeCount.toString() : '');

    Widget buildContent() {
      final children = <Widget>[];

      if (icon != null) {
        children.add(icon!);
      }

      children.add(
        Text(
          title,
          style: effectiveTitleStyle?.copyWith(color: getCurrentTextColor()),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

      if (showBadge && badgeDisplayText.isNotEmpty) {
        children.add(
          Container(
            constraints: const BoxConstraints(minWidth: 20.0, minHeight: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: getCurrentBadgeBackgroundColor(),
              borderRadius: BorderRadius.circular(badgeRadius),
            ),
            child: Center(
              child: Text(
                badgeDisplayText,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: getCurrentBadgeTextColor(),
                  height: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }

      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: children.isEmpty
            ? [const SizedBox.shrink()]
            : children.expand((widget) sync* {
                if (widget != children.first) {
                  yield SizedBox(width: spacing);
                }
                yield widget;
              }).toList(),
      );
    }

    Widget buildTabWithIndicator() {
      final content = Container(
        constraints: BoxConstraints(minWidth: minWidth),
        height: height,
        padding: padding,
        decoration: BoxDecoration(color: getCurrentBackgroundColor()),
        child: buildContent(),
      );

      if (!shouldShowIndicator()) {
        return content;
      }

      final indicator = Container(
        height: indicatorPosition == TabIndicatorPosition.top
            ? indicatorWidth
            : null,
        width: indicatorPosition == TabIndicatorPosition.bottom
            ? double.infinity
            : null,
        decoration: BoxDecoration(
          color: effectiveIndicatorColor,
          borderRadius: BorderRadius.circular(indicatorWidth / 2),
        ),
      );

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: indicatorPosition == TabIndicatorPosition.top
            ? [indicator, content]
            : [content, Container(height: indicatorWidth, child: indicator)],
      );
    }

    final tabWidget = buildTabWithIndicator();

    if (!enabled) {
      return Opacity(opacity: 0.38, child: tabWidget);
    }

    return MouseRegion(
      onEnter: onHover != null ? (_) => onHover!(true) : null,
      onExit: onHover != null ? (_) => onHover!(false) : null,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: tabWidget,
      ),
    );
  }
}
