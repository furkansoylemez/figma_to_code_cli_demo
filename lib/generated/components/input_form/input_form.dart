import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class InputForm extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? descriptionText;
  final bool showLabel;
  final bool showDescription;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showTooltip;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const InputForm({
    super.key,
    this.labelText = 'Input Label',
    this.hintText = 'Input',
    this.descriptionText = 'This is a caption under a text input.',
    this.showLabel = true,
    this.showDescription = true,
    this.prefixIcon,
    this.suffixIcon,
    this.showTooltip = true,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showLabel)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              children: [
                Text(
                  labelText ?? 'Input Label',
                  style: TextStyle(
                    fontSize: 14,
                    color: (customColors?.textColorText ?? 
                           Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
                    height: 24 / 14,
                  ),
                ),
                if (showTooltip) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.help_outline,
                    size: 14,
                    color: (customColors?.colorIcon ?? 
                           Theme.of(context).colorScheme.onSurface).withOpacity(0.45),
                  ),
                ],
              ],
            ),
          ),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: customColors?.textColorTextPlaceholder ?? 
                     Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
            ),
            prefixIcon: prefixIcon != null 
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: prefixIcon,
                  ),
                )
              : null,
            suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 14,
                    height: 14,
                    child: suffixIcon,
                  ),
                )
              : null,
            filled: true,
            fillColor: customColors?.backgroundColorBgContainer ?? 
                      Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: customColors?.borderColorBorder ?? 
                       Theme.of(context).colorScheme.outline,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: customColors?.borderColorBorder ?? 
                       Theme.of(context).colorScheme.outline,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          ),
          style: TextStyle(
            fontSize: 14,
            color: customColors?.textColorText ?? 
                   Theme.of(context).colorScheme.onSurface,
          ),
        ),
        if (showDescription)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              descriptionText ?? 'This is a caption under a text input.',
              style: TextStyle(
                fontSize: 14,
                color: (customColors?.textColorTextDescription ?? 
                       Theme.of(context).colorScheme.onSurface).withOpacity(0.45),
                height: 22 / 14,
              ),
            ),
          ),
      ],
    );
  }
}