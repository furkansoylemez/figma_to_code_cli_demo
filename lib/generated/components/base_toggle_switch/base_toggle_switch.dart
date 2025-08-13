import 'package:flutter/material.dart';

enum BaseToggleSwitchSize { large, defaultSize }

class BaseToggleSwitch extends StatelessWidget {
  const BaseToggleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = BaseToggleSwitchSize.defaultSize,
    this.showLabel = true,
    this.labelText,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.labelStyle,
    this.labelColor,
    this.spacing,
    this.trackWidth,
    this.trackHeight,
    this.thumbRadius,
    this.elevation,
    this.shadows,
    this.materialTapTargetSize,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.autofocus = false,
    this.thumbIcon,
    this.trackOutlineColor,
    this.trackOutlineWidth,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final BaseToggleSwitchSize size;
  final bool showLabel;
  final String? labelText;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? spacing;
  final double? trackWidth;
  final double? trackHeight;
  final double? thumbRadius;
  final double? elevation;
  final List<BoxShadow>? shadows;
  final MaterialTapTargetSize? materialTapTargetSize;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool autofocus;
  final MaterialStateProperty<Icon?>? thumbIcon;
  final MaterialStateProperty<Color?>? trackOutlineColor;
  final MaterialStateProperty<double?>? trackOutlineWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isLarge = size == BaseToggleSwitchSize.large;
    final effectiveSpacing = spacing ?? (isLarge ? 8.0 : 4.0);

    final switchh = Transform.scale(
      scale: isLarge ? 1.2 : 1.0,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeThumbColor ?? colorScheme.onPrimary,
        activeTrackColor: activeTrackColor ?? colorScheme.primary,
        inactiveThumbColor: inactiveThumbColor ?? colorScheme.onSurface,
        inactiveTrackColor:
            inactiveTrackColor ?? colorScheme.onSurface.withOpacity(0.25),
        materialTapTargetSize: materialTapTargetSize,
        mouseCursor: mouseCursor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
        focusNode: focusNode,
        autofocus: autofocus,
        thumbIcon: thumbIcon,
        trackOutlineColor: trackOutlineColor,
        trackOutlineWidth: trackOutlineWidth,
      ),
    );

    if (!showLabel) {
      return switchh;
    }

    final effectiveLabelText = labelText ?? 'Aktif';
    final effectiveLabelStyle =
        labelStyle ??
        (isLarge
            ? theme.textTheme.bodyLarge?.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                height: 20.0 / 18.0,
              )
            : theme.textTheme.bodyMedium);

    final effectiveLabelColor =
        labelColor ?? colorScheme.onSurface.withOpacity(0.88);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        switchh,
        SizedBox(width: effectiveSpacing),
        Text(
          effectiveLabelText,
          style: effectiveLabelStyle?.copyWith(color: effectiveLabelColor),
        ),
      ],
    );
  }
}
