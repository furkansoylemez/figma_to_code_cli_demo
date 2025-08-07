import 'package:flutter/material.dart';

/// A customizable checkbox widget with label text that follows Material Design guidelines.
/// 
/// This component provides a checkbox with an accompanying label that can be customized
/// with various colors, sizes, and spacing options. It supports both checked and unchecked
/// states with proper accessibility features.
/// 
/// The checkbox uses theme-based defaults but allows full customization through parameters.
/// The label text is optional and the component can be used as a standalone checkbox.
class BaseCheckbox extends StatelessWidget {
  /// Creates a base checkbox component.
  /// 
  /// The [value] parameter determines whether the checkbox is checked.
  /// The [onChanged] callback is called when the checkbox state should change.
  const BaseCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.size = 20.0,
    this.spacing = 8.0,
    this.checkboxColor,
    this.activeColor,
    this.checkColor,
    this.borderColor,
    this.borderRadius = 4.0,
    this.borderWidth = 1.0,
    this.labelStyle,
    this.labelColor,
    this.enabled = true,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
    this.tristate = false,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
    this.semanticLabel,
  });

  /// Whether the checkbox is checked.
  /// 
  /// When [tristate] is true, this can be null to represent an indeterminate state.
  final bool? value;

  /// Called when the value of the checkbox should change.
  /// 
  /// If null, the checkbox will be disabled.
  final ValueChanged<bool?>? onChanged;

  /// The text label to display next to the checkbox.
  /// 
  /// If null, no label will be displayed and only the checkbox will be shown.
  final String? label;

  /// The size of the checkbox in logical pixels.
  /// 
  /// Defaults to 20.0, which follows Material Design guidelines.
  final double size;

  /// The spacing between the checkbox and label in logical pixels.
  /// 
  /// Defaults to 8.0, following Material Design spacing standards.
  final double spacing;

  /// The background color of the checkbox when unchecked.
  /// 
  /// Defaults to [ColorScheme.surface].
  final Color? checkboxColor;

  /// The background color of the checkbox when checked.
  /// 
  /// Defaults to [ColorScheme.primary].
  final Color? activeColor;

  /// The color of the checkmark inside the checkbox.
  /// 
  /// Defaults to [ColorScheme.onPrimary].
  final Color? checkColor;

  /// The color of the checkbox border.
  /// 
  /// Defaults to [ColorScheme.outline] when unchecked.
  final Color? borderColor;

  /// The border radius of the checkbox in logical pixels.
  /// 
  /// Defaults to 4.0, following Material Design guidelines.
  final double borderRadius;

  /// The width of the checkbox border in logical pixels.
  /// 
  /// Defaults to 1.0.
  final double borderWidth;

  /// The text style for the label.
  /// 
  /// Defaults to [TextTheme.bodyMedium].
  final TextStyle? labelStyle;

  /// The color of the label text.
  /// 
  /// Defaults to [ColorScheme.onSurface] with 88% opacity.
  final Color? labelColor;

  /// Whether the checkbox is enabled.
  /// 
  /// Defaults to true.
  final bool enabled;

  /// How the checkbox and label should be aligned along the cross axis.
  /// 
  /// Defaults to [CrossAxisAlignment.center].
  final CrossAxisAlignment crossAxisAlignment;

  /// How much space the checkbox component should occupy along the main axis.
  /// 
  /// Defaults to [MainAxisSize.min].
  final MainAxisSize mainAxisSize;

  /// Whether the checkbox can have three states (checked, unchecked, indeterminate).
  /// 
  /// Defaults to false.
  final bool tristate;

  /// The color for the checkbox's focus overlay.
  final Color? focusColor;

  /// The color for the checkbox's hover overlay.
  final Color? hoverColor;

  /// The overlay color for the checkbox's ink response.
  final MaterialStateProperty<Color?>? overlayColor;

  /// The splash radius for the checkbox's ink response.
  final double? splashRadius;

  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// Defines how compact the checkbox's layout will be.
  final VisualDensity? visualDensity;

  /// The focus node for the checkbox.
  final FocusNode? focusNode;

  /// Whether the checkbox should focus itself if nothing else is already focused.
  /// 
  /// Defaults to false.
  final bool autofocus;

  /// The semantic label for the checkbox for accessibility.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final effectiveActiveColor = activeColor ?? colorScheme.primary;
    final effectiveCheckColor = checkColor ?? colorScheme.onPrimary;
    final effectiveBorderColor = borderColor ?? colorScheme.outline;
    final effectiveLabelColor = labelColor ?? colorScheme.onSurface.withOpacity(0.87);
    
    final checkbox = SizedBox(
      width: size,
      height: size,
      child: Checkbox(
        value: value,
        onChanged: enabled ? onChanged : null,
        tristate: tristate,
        activeColor: effectiveActiveColor,
        checkColor: effectiveCheckColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
        materialTapTargetSize: materialTapTargetSize,
        visualDensity: visualDensity,
        focusNode: focusNode,
        autofocus: autofocus,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          color: effectiveBorderColor,
          width: borderWidth,
        ),
      ),
    );

    if (label == null) {
      return checkbox;
    }

    final effectiveLabelStyle = labelStyle ?? theme.textTheme.bodyMedium;
    
    return InkWell(
      onTap: enabled && onChanged != null 
        ? () => onChanged!(!value!) 
        : null,
      borderRadius: BorderRadius.circular(4.0),
      child: Semantics(
        label: semanticLabel ?? label,
        checked: value,
        child: Row(
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            checkbox,
            if (spacing > 0) SizedBox(width: spacing),
            Flexible(
              child: Text(
                label!,
                style: effectiveLabelStyle?.copyWith(
                  color: enabled 
                    ? effectiveLabelColor 
                    : effectiveLabelColor.withOpacity(0.38),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}