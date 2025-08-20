import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class AppCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? checkboxColor;
  final Color? borderColor;
  final Color? labelColor;

  const AppCheckbox({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.checkboxColor,
    this.borderColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final theme = Theme.of(context);
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: value 
              ? (checkboxColor ?? customColors?.primaryColorPrimary ?? theme.colorScheme.primary)
              : (customColors?.backgroundColorBgContainer ?? theme.colorScheme.surface),
            border: value 
              ? null 
              : Border.all(
                  color: borderColor ?? customColors?.borderColorBorder ?? theme.colorScheme.outline,
                  width: 1,
                ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: value
            ? const Icon(
                Icons.check,
                size: 12,
                color: Colors.white,
              )
            : null,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: (labelColor ?? customColors?.textColorText ?? theme.colorScheme.onSurface)
              .withOpacity(0.88),
            height: 1.3,
          ),
        ),
      ],
    );
  }
}