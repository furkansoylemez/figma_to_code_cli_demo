import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final bool isLarge;

  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isLarge ? 44 : 28,
          height: isLarge ? 22 : 16,
          decoration: BoxDecoration(
            color: value
                ? customColors?.primaryColorPrimary ??
                      Theme.of(context).colorScheme.primary
                : (customColors?.textColorTextQuaternary ??
                      Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(isLarge ? 11 : 8),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  margin: const EdgeInsets.all(2),
                  width: isLarge ? 18 : 12,
                  height: isLarge ? 18 : 12,
                  decoration: BoxDecoration(
                    color:
                        customColors?.backgroundColorBgContainer ??
                        Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(isLarge ? 9 : 6),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x33002307),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (label != null && isLarge) ...[
          const SizedBox(width: 8),
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color:
                  (customColors?.textColorText ??
                          Theme.of(context).colorScheme.onSurface)
                      .withOpacity(0.88),
              fontSize: 18,
              height: 20 / 18,
            ),
          ),
        ],
      ],
    );
  }
}
