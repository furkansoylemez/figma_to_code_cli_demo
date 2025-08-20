import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class BaseInput extends StatelessWidget {
  const BaseInput({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.showIconLeft = false,
    this.showIconRight = false,
    this.leftIcon,
    this.rightIcon,
    this.onChanged,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool showIconLeft;
  final bool showIconRight;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool enabled;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return TextField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: customColors?.textColorTextPlaceholder ?? 
               Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: showIconLeft && leftIcon != null ? leftIcon : null,
        suffixIcon: showIconRight && rightIcon != null ? rightIcon : null,
        filled: true,
        fillColor: customColors?.backgroundColorBgContainer ?? 
                  Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: customColors?.borderColorBorder ?? 
                   Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: customColors?.borderColorBorder ?? 
                   Theme.of(context).colorScheme.outline,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 10,
          color: customColors?.textColorTextSecondary ?? 
                 Theme.of(context).colorScheme.onSurface.withOpacity(0.65),
        ),
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: customColors?.textColorTextPlaceholder ?? 
                 Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
      ),
    );
  }
}