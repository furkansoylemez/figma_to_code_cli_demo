import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class InputBasic extends StatelessWidget {
  final String? label;
  final String placeholder;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool showLeftIcon;
  final bool showRightIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  const InputBasic({
    super.key,
    this.label,
    this.placeholder = 'Input',
    this.leftIcon,
    this.rightIcon,
    this.showLeftIcon = true,
    this.showRightIcon = true,
    this.controller,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      style: TextStyle(
        fontFamily: 'DM Sans',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: customColors?.textColorTextPlaceholder ?? theme.colorScheme.onSurface.withOpacity(0.25),
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          fontFamily: 'DM Sans',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: customColors?.textColorTextPlaceholder ?? theme.colorScheme.onSurface.withOpacity(0.25),
        ),
        prefixIcon: showLeftIcon && leftIcon != null ? Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: leftIcon,
        ) : null,
        suffixIcon: showRightIcon && rightIcon != null ? Padding(
          padding: const EdgeInsets.only(left: 8, right: 12),
          child: rightIcon,
        ) : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 36,
          minHeight: 16,
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 36,
          minHeight: 16,
        ),
        filled: true,
        fillColor: customColors?.backgroundColorBgContainer ?? theme.colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: customColors?.borderColorBorder ?? theme.colorScheme.outline,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: customColors?.borderColorBorder ?? theme.colorScheme.outline,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: customColors?.borderColorBorder ?? theme.colorScheme.primary,
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: (customColors?.borderColorBorder ?? theme.colorScheme.outline).withOpacity(0.5),
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}