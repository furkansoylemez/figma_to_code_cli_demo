import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label = 'Checkbox',
    this.tristate = false,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String label;
  final bool tristate;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: Checkbox(
            value: widget.value,
            onChanged: widget.onChanged,
            tristate: widget.tristate,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(
              color: customColors?.borderColorBorder ?? Theme.of(context).colorScheme.outline,
              width: 1,
            ),
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return customColors?.primaryColorPrimary ?? Theme.of(context).colorScheme.primary;
              }
              return customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.surface;
            }),
            checkColor: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: 'DM Sans',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
            height: 1.3,
          ),
        ),
      ],
    );
  }
}