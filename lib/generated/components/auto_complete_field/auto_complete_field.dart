import 'package:flutter/material.dart';
import '../custom_autocomplete_field/custom_autocomplete_field.dart';
import '../../theme/color_theme.dart';

class AutoCompleteField extends StatelessWidget {
  final List<String> options;
  final String? labelText;
  final String? hintText;
  final ValueChanged<String?>? onSelected;
  final String? initialValue;
  final bool enabled;
  final bool showDropdown;

  const AutoCompleteField({
    Key? key,
    required this.options,
    this.labelText,
    this.hintText = 'Input',
    this.onSelected,
    this.initialValue,
    this.enabled = true,
    this.showDropdown = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAutocompleteField<String>(
          displayStringForOption: (p0) {
            return p0;
          },
          options: options,
          hintText: hintText ?? 'Input',
          onSelected: onSelected,
          initialValue: initialValue,
          enabled: enabled,
        ),
        if (showDropdown) ...[
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color:
                  customColors?.backgroundColorBgElevated ??
                  Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color:
                    customColors?.backgroundColorBgContainer ??
                    Theme.of(context).colorScheme.outline,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 9),
                  blurRadius: 28,
                  spreadRadius: 8,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: -4,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: const Offset(0, 6),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: options.take(3).map((option) {
                  final isHovered = option == options.first;
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isHovered
                          ? (customColors?.textColorText ?? Colors.black)
                                .withOpacity(0.04)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          color: (customColors?.textColorText ?? Colors.black)
                              .withOpacity(0.88),
                          fontSize: 14,
                          height: 22 / 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
