import 'package:flutter/material.dart';

enum CheckboxState { checked, unchecked, indeterminate }

class BaseCheckbox extends StatelessWidget {
  const BaseCheckbox({
    super.key,
    this.value = false,
    this.onChanged,
    this.label,
    this.isActive = true,
    this.tristate = false,
    this.size = 16.0,
    this.spacing = 8.0,
    this.checkedColor,
    this.uncheckedColor,
    this.borderColor,
    this.checkColor,
    this.labelStyle,
    this.labelColor,
    this.borderRadius = 4.0,
    this.borderWidth = 1.0,
    this.splashRadius = 24.0,
    this.visualDensity = VisualDensity.standard,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.materialTapTargetSize = MaterialTapTargetSize.padded,
    this.mouseCursor,
    this.autofocus = false,
    this.focusNode,
    this.contentPadding,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.textDirection,
    this.semanticLabel,
    this.enabled = true,
  });

  /// The current state of the checkbox (checked, unchecked, or indeterminate if tristate is true)
  final bool? value;

  /// Called when the value of the checkbox should change
  final ValueChanged<bool?>? onChanged;

  /// The text label displayed next to the checkbox
  final String? label;

  /// Whether the checkbox is in an active visual state
  final bool isActive;

  /// Whether the checkbox supports three states (checked, unchecked, indeterminate)
  final bool tristate;

  /// The size of the checkbox box
  final double size;

  /// The spacing between the checkbox and label
  final double spacing;

  /// The color of the checkbox when checked
  final Color? checkedColor;

  /// The color of the checkbox when unchecked
  final Color? uncheckedColor;

  /// The color of the checkbox border
  final Color? borderColor;

  /// The color of the checkmark
  final Color? checkColor;

  /// The text style for the label
  final TextStyle? labelStyle;

  /// The color of the label text
  final Color? labelColor;

  /// The border radius of the checkbox
  final double borderRadius;

  /// The width of the checkbox border
  final double borderWidth;

  /// The radius of the splash effect
  final double splashRadius;

  /// The visual density of the checkbox
  final VisualDensity visualDensity;

  /// The color for focus state
  final Color? focusColor;

  /// The color for hover state
  final Color? hoverColor;

  /// The color for splash effect
  final Color? splashColor;

  /// The tap target size behavior
  final MaterialTapTargetSize materialTapTargetSize;

  /// The mouse cursor when hovering over the checkbox
  final MouseCursor? mouseCursor;

  /// Whether the checkbox should be focused automatically
  final bool autofocus;

  /// The focus node for the checkbox
  final FocusNode? focusNode;

  /// Padding around the entire checkbox content
  final EdgeInsets? contentPadding;

  /// Cross axis alignment for the row containing checkbox and label
  final CrossAxisAlignment crossAxisAlignment;

  /// Main axis alignment for the row containing checkbox and label
  final MainAxisAlignment mainAxisAlignment;

  /// Main axis size for the row containing checkbox and label
  final MainAxisSize mainAxisSize;

  /// The text direction to use for the layout
  final TextDirection? textDirection;

  /// The semantic label for accessibility
  final String? semanticLabel;

  /// Whether the checkbox is enabled
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveCheckedColor =
        checkedColor ?? (isActive ? colorScheme.primary : colorScheme.outline);

    final effectiveUncheckedColor =
        uncheckedColor ??
        (isActive ? colorScheme.surface : colorScheme.surface.withOpacity(0.6));

    final effectiveBorderColor =
        borderColor ??
        (value == true ? effectiveCheckedColor : colorScheme.outline);

    final effectiveCheckColor = checkColor ?? colorScheme.onPrimary;

    final effectiveLabelColor =
        labelColor ??
        (enabled
            ? colorScheme.onSurface.withOpacity(0.88)
            : colorScheme.onSurface.withOpacity(0.38));

    final effectiveLabelStyle =
        labelStyle ??
        theme.textTheme.bodyMedium?.copyWith(color: effectiveLabelColor);

    final effectiveMouseCursor =
        mouseCursor ??
        (enabled ? SystemMouseCursors.click : SystemMouseCursors.basic);

    Widget checkbox = SizedBox(
      width: size,
      height: size,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: enabled && onChanged != null
              ? () {
                  if (tristate) {
                    switch (value) {
                      case false:
                        onChanged!(true);
                        break;
                      case true:
                        onChanged!(null);
                        break;
                      case null:
                        onChanged!(false);
                        break;
                    }
                  } else {
                    onChanged!(!(value ?? false));
                  }
                }
              : null,
          mouseCursor: effectiveMouseCursor,
          focusColor: focusColor ?? colorScheme.primary.withOpacity(0.12),
          hoverColor: hoverColor ?? colorScheme.primary.withOpacity(0.04),
          splashColor: splashColor ?? colorScheme.primary.withOpacity(0.12),
          radius: splashRadius,
          focusNode: focusNode,
          autofocus: autofocus,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: value == true
                  ? effectiveCheckedColor
                  : effectiveUncheckedColor,
              border: Border.all(
                color: effectiveBorderColor,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: value == true
                ? Icon(
                    Icons.check,
                    size: size * 0.75,
                    color: effectiveCheckColor,
                  )
                : value == null && tristate
                ? Icon(
                    Icons.remove,
                    size: size * 0.75,
                    color: effectiveCheckColor,
                  )
                : null,
          ),
        ),
      ),
    );

    if (label == null) {
      return Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: checkbox,
      );
    }

    return Padding(
      padding: contentPadding ?? EdgeInsets.zero,
      child: InkWell(
        onTap: enabled && onChanged != null
            ? () {
                if (tristate) {
                  switch (value) {
                    case false:
                      onChanged!(true);
                      break;
                    case true:
                      onChanged!(null);
                      break;
                    case null:
                      onChanged!(false);
                      break;
                  }
                } else {
                  onChanged!(!(value ?? false));
                }
              }
            : null,
        borderRadius: BorderRadius.circular(4.0),
        mouseCursor: effectiveMouseCursor,
        child: Semantics(
          label: semanticLabel ?? label,
          checked: value == true,
          mixed: value == null && tristate,
          child: Row(
            mainAxisSize: mainAxisSize,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            textDirection: textDirection,
            children: [
              checkbox,
              if (spacing > 0) SizedBox(width: spacing),
              if (label!.isNotEmpty)
                Flexible(child: Text(label!, style: effectiveLabelStyle)),
            ],
          ),
        ),
      ),
    );
  }
}
