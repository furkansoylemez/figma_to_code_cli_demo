import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class CustomAutocomplete extends StatelessWidget {
  final String placeholder;
  final List<String> options;
  final ValueChanged<String>? onChanged;
  final String? value;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomAutocomplete({
    super.key,
    this.placeholder = 'Input',
    required this.options,
    this.onChanged,
    this.value,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Autocomplete<String>(
      initialValue: value != null ? TextEditingValue(text: value!) : null,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return options.where((String option) {
          return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: onChanged,
      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: placeholder,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: customColors?.borderColorBorder ?? Theme.of(context).colorScheme.outline,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: customColors?.borderColorBorder ?? Theme.of(context).colorScheme.outline,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: customColors?.borderColorBorder ?? Theme.of(context).colorScheme.primary,
                width: 1.0,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: (customColors?.textColorTextPlaceholder ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.25),
            ),
          ),
          style: const TextStyle(
            fontSize: 14.0,
            fontFamily: 'DM Sans',
          ),
        );
      },
      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
              width: 360.0,
              constraints: const BoxConstraints(maxHeight: 200.0),
              decoration: BoxDecoration(
                color: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(6.0),
                border: Border.all(
                  color: customColors?.borderColorBorder ?? Theme.of(context).colorScheme.outline,
                  width: 1.0,
                ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(4.0),
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return InkWell(
                    onTap: () => onSelected(option),
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Text(
                        option,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Inter',
                          height: 1.57,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}