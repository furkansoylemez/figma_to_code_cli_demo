import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
  });

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return GestureDetector(
      onTap: onChanged != null ? () => onChanged!(value) : null,
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
                      color: _isSelected 
                        ? (customColors?.primaryColorPrimary ?? 
                           Theme.of(context).colorScheme.primary)
                        : (customColors?.borderColorBorder ?? 
                           Theme.of(context).colorScheme.outline),
                      width: 1,
                    ),
                  ),
                ),
                if (_isSelected)
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
          if (label != null) ...[
            const SizedBox(width: 8),
            Text(
              label!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: (customColors?.textColorText ?? 
                       Theme.of(context).colorScheme.onSurface)
                       .withOpacity(0.88),
                fontSize: 14,
                height: 22 / 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}