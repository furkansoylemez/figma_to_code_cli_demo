import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class CustomRadio extends StatelessWidget {
  final String text;
  final bool value;
  final bool? groupValue;
  final ValueChanged<bool?>? onChanged;
  final double spacing;

  const CustomRadio({
    super.key,
    required this.text,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final isSelected = groupValue == value;
    final isEnabled = onChanged != null;
    
    return GestureDetector(
      onTap: isEnabled ? () => onChanged?.call(value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: Stack(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: customColors?.backgroundColorBgContainer ?? 
                           Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: isSelected && isEnabled 
                        ? customColors?.primaryColorPrimary ?? 
                          Theme.of(context).colorScheme.primary
                        : customColors?.borderColorBorder ?? 
                          Theme.of(context).colorScheme.outline,
                      width: 1.0,
                    ),
                  ),
                ),
                if (isSelected && isEnabled)
                  Positioned(
                    left: 4,
                    top: 4,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: customColors?.primaryColorPrimary ?? 
                               Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: spacing),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 22 / 14,
              color: (customColors?.textColorText ?? 
                     Theme.of(context).colorScheme.onSurface)
                     .withOpacity(0.88),
            ),
          ),
        ],
      ),
    );
  }
}