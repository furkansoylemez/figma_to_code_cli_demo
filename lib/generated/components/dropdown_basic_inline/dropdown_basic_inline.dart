import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class DropdownBasicInline extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const DropdownBasicInline({
    super.key,
    required this.text,
    this.onPressed,
    this.enabled = true,
    this.textColor,
    this.borderColor,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return InkWell(
      onTap: enabled ? onPressed : null,
      borderRadius: borderRadius ?? BorderRadius.circular(6),
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? 
                   customColors?.borderColorBorder ?? 
                   Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                height: 22 / 14,
                color: enabled 
                    ? (textColor ?? 
                       customColors?.textColorText ?? 
                       Theme.of(context).colorScheme.onSurface.withOpacity(0.88))
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.keyboard_arrow_down,
              size: 14,
              color: enabled 
                  ? (textColor ?? 
                     customColors?.textColorText ?? 
                     Theme.of(context).colorScheme.onSurface.withOpacity(0.88))
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
            ),
          ],
        ),
      ),
    );
  }
}