import 'package:flutter/material.dart';

enum SwitchSize { small, large }

class BaseSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final SwitchSize size;
  final bool showLabel;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final double? trackWidth;
  final double? trackHeight;
  final double? thumbSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final List<BoxShadow>? thumbShadow;
  final Duration? animationDuration;
  final double? labelSpacing;
  final MainAxisAlignment? alignment;

  const BaseSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.size = SwitchSize.small,
    this.showLabel = false,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.labelColor,
    this.labelStyle,
    this.trackWidth,
    this.trackHeight,
    this.thumbSize,
    this.padding,
    this.borderRadius,
    this.thumbShadow,
    this.animationDuration,
    this.labelSpacing,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final bool isLarge = size == SwitchSize.large;
    final double defaultTrackWidth = isLarge ? 44.0 : 28.0;
    final double defaultTrackHeight = isLarge ? 22.0 : 16.0;
    final double defaultThumbSize = isLarge ? 18.0 : 12.0;
    final double defaultBorderRadius = isLarge ? 11.0 : 8.0;
    final double defaultLabelSpacing = 8.0;
    
    final Color effectiveActiveTrackColor = activeTrackColor ?? colorScheme.primary;
    final Color effectiveInactiveTrackColor = inactiveTrackColor ?? colorScheme.onSurface.withOpacity(0.25);
    final Color effectiveThumbColor = thumbColor ?? colorScheme.surface;
    final Color effectiveLabelColor = labelColor ?? colorScheme.onSurface.withOpacity(0.88);
    
    final TextStyle effectiveLabelStyle = labelStyle ?? 
      (isLarge ? theme.textTheme.bodyLarge : theme.textTheme.bodyMedium)?.copyWith(
        color: effectiveLabelColor,
        fontWeight: FontWeight.w400,
      ) ?? TextStyle(
        fontSize: isLarge ? 18.0 : 16.0,
        color: effectiveLabelColor,
        fontWeight: FontWeight.w400,
      );
    
    final double effectiveTrackWidth = trackWidth ?? defaultTrackWidth;
    final double effectiveTrackHeight = trackHeight ?? defaultTrackHeight;
    final double effectiveThumbSize = thumbSize ?? defaultThumbSize;
    final double effectiveBorderRadius = borderRadius ?? defaultBorderRadius;
    final double effectiveLabelSpacing = labelSpacing ?? defaultLabelSpacing;
    final Duration effectiveAnimationDuration = animationDuration ?? const Duration(milliseconds: 200);
    
    final List<BoxShadow> effectiveThumbShadow = thumbShadow ?? [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: const Offset(0, 2),
        blurRadius: 4.0,
        spreadRadius: 0,
      ),
    ];
    
    final EdgeInsetsGeometry effectivePadding = padding ?? const EdgeInsets.all(2.0);
    final MainAxisAlignment effectiveAlignment = alignment ?? MainAxisAlignment.start;

    return GestureDetector(
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: effectiveAlignment,
        children: [
          Container(
            width: effectiveTrackWidth,
            height: effectiveTrackHeight,
            decoration: BoxDecoration(
              color: value ? effectiveActiveTrackColor : effectiveInactiveTrackColor,
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
            ),
            child: Padding(
              padding: effectivePadding,
              child: AnimatedAlign(
                duration: effectiveAnimationDuration,
                curve: Curves.easeInOut,
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: effectiveThumbSize,
                  height: effectiveThumbSize,
                  decoration: BoxDecoration(
                    color: effectiveThumbColor,
                    borderRadius: BorderRadius.circular(effectiveThumbSize / 2),
                    boxShadow: effectiveThumbShadow,
                  ),
                ),
              ),
            ),
          ),
          if (showLabel && label != null) ...[
            SizedBox(width: effectiveLabelSpacing),
            Text(
              label!,
              style: effectiveLabelStyle,
            ),
          ],
        ],
      ),
    );
  }
}