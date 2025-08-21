import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

enum CustomSwitchSize { defaultSize, large }

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final CustomSwitchSize size;
  final String? label;

  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.size = CustomSwitchSize.defaultSize,
    this.label,
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final isLarge = widget.size == CustomSwitchSize.large;

    final activeColor =
        customColors?.primaryColorPrimary ??
        Theme.of(context).colorScheme.primary;
    final inactiveColor =
        (customColors?.textColorTextQuaternary ??
                Theme.of(context).colorScheme.onSurface)
            .withOpacity(0.25);
    final thumbColor =
        customColors?.backgroundColorBgContainer ??
        Theme.of(context).colorScheme.surface;
    final labelColor =
        (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface)
            .withOpacity(0.88);

    final switchWidget = Transform.scale(
      scale: isLarge ? 1.375 : 1.0,
      child: Switch(
        value: widget.value,
        onChanged: widget.onChanged,
        activeColor: thumbColor,
        activeTrackColor: activeColor,
        inactiveThumbColor: thumbColor,
        inactiveTrackColor: inactiveColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
    );

    if (widget.label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF002311).withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: switchWidget,
          ),
          const SizedBox(width: 8),
          Text(
            widget.label!,
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: labelColor,
              height: 20 / 18,
            ),
          ),
        ],
      );
    }

    return Container(
      decoration: isLarge
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF002311).withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            )
          : null,
      child: switchWidget,
    );
  }
}
