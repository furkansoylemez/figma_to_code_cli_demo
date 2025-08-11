import 'package:flutter/material.dart';

enum RadioVariant {
  active,
  inactive,
}

class BaseRadioButton extends StatelessWidget {
  const BaseRadioButton({
    super.key,
    required this.label,
    this.variant = RadioVariant.inactive,
    this.isSelected = false,
    this.onChanged,
    this.radioSize = 16.0,
    this.innerDotSize = 8.0,
    this.spacing = 8.0,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.strokeWidth = 1.0,
    this.disabled = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
  });

  final String label;
  final RadioVariant variant;
  final bool isSelected;
  final ValueChanged<bool?>? onChanged;
  final double radioSize;
  final double innerDotSize;
  final double spacing;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double strokeWidth;
  final bool disabled;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final bool isActive = variant == RadioVariant.active;
    
    final Color effectiveActiveColor = activeColor ?? colorScheme.primary;
    final Color effectiveInactiveColor = inactiveColor ?? colorScheme.outline;
    final Color effectiveBackgroundColor = backgroundColor ?? colorScheme.surface;
    final Color effectiveTextColor = textColor ?? colorScheme.onSurface.withOpacity(0.87);
    
    final Color borderColor = isActive ? effectiveActiveColor : effectiveInactiveColor;
    final Color fillColor = isActive && isSelected ? effectiveActiveColor : effectiveBackgroundColor;
    final Color innerDotColor = isActive && isSelected ? effectiveActiveColor : Colors.transparent;
    
    final TextStyle effectiveTextStyle = textStyle ?? textTheme.bodyMedium?.copyWith(
      color: effectiveTextColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      height: 22.0 / 14.0,
    ) ?? TextStyle(
      color: effectiveTextColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      height: 22.0 / 14.0,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: disabled || onChanged == null ? null : () => onChanged!(!isSelected),
        borderRadius: BorderRadius.circular(4.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: mainAxisSize,
            children: [
              SizedBox(
                width: radioSize,
                height: radioSize,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: radioSize,
                      height: radioSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: effectiveBackgroundColor,
                        border: Border.all(
                          color: disabled 
                            ? borderColor.withOpacity(0.38)
                            : borderColor,
                          width: strokeWidth,
                        ),
                      ),
                    ),
                    if (isSelected && isActive)
                      Container(
                        width: innerDotSize,
                        height: innerDotSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: disabled 
                            ? innerDotColor.withOpacity(0.38)
                            : innerDotColor,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: spacing),
              Flexible(
                child: Text(
                  label,
                  style: disabled 
                    ? effectiveTextStyle.copyWith(
                        color: effectiveTextStyle.color?.withOpacity(0.38),
                      )
                    : effectiveTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}