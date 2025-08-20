import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    this.label = 'Input Label',
    this.placeholder = 'Input',
    this.description = 'This is a caption under a text input.',
    this.showLabel = true,
    this.showDescription = true,
    this.showTooltip = true,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.controller,
  });

  final String label;
  final String placeholder;
  final String description;
  final bool showLabel;
  final bool showDescription;
  final bool showTooltip;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showLabel)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    height: 24 / 14,
                    color: customColors?.textColorText?.withOpacity(0.88) ??
                        theme.colorScheme.onSurface.withOpacity(0.88),
                  ),
                ),
                if (showTooltip) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.help_outline,
                    size: 14,
                    color: customColors?.colorIcon?.withOpacity(0.45) ??
                        theme.colorScheme.onSurface.withOpacity(0.45),
                  ),
                ],
              ],
            ),
          ),
        TextField(
          controller: controller,
          onChanged: onChanged,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            color: customColors?.textColorText ?? theme.colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: customColors?.textColorTextPlaceholder?.withOpacity(0.25) ??
                  theme.colorScheme.onSurface.withOpacity(0.25),
            ),
            prefixIcon: prefixIcon != null
                ? Container(
                    width: 16,
                    height: 16,
                    padding: const EdgeInsets.all(12),
                    child: prefixIcon,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Container(
                    width: 14,
                    height: 14,
                    padding: const EdgeInsets.all(15),
                    child: suffixIcon,
                  )
                : null,
            filled: true,
            fillColor: customColors?.backgroundColorBgContainer ??
                theme.colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: customColors?.borderColorBorder ??
                    theme.colorScheme.outline,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: customColors?.borderColorBorder ??
                    theme.colorScheme.outline,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),
            isDense: true,
          ),
        ),
        if (showDescription)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                height: 22 / 14,
                color: customColors?.textColorTextDescription?.withOpacity(0.45) ??
                    theme.colorScheme.onSurface.withOpacity(0.45),
              ),
            ),
          ),
      ],
    );
  }
}