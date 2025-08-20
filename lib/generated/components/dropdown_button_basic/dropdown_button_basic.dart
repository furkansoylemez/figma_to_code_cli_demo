import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class DropdownButtonBasic extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color? textColor;
  final Color? borderColor;
  final double? width;

  const DropdownButtonBasic({
    Key? key,
    required this.text,
    this.onPressed,
    this.enabled = true,
    this.textColor,
    this.borderColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return InkWell(
      onTap: enabled ? onPressed : null,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? 
                   customColors?.borderColorBorder ?? 
                   Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: enabled 
                    ? (textColor ?? 
                       customColors?.textColorText ?? 
                       Theme.of(context).colorScheme.onSurface.withOpacity(0.88))
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 22 / 14,
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