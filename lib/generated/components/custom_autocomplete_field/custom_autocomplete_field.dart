import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class CustomAutocompleteField<T extends Object> extends StatefulWidget {
  final String hintText;
  final List<T> options;
  final String Function(T) displayStringForOption;
  final ValueChanged<T?>? onSelected;
  final T? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;

  const CustomAutocompleteField({
    super.key,
    required this.options,
    required this.displayStringForOption,
    this.hintText = 'Input',
    this.onSelected,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
  });

  @override
  State<CustomAutocompleteField<T>> createState() =>
      _CustomAutocompleteFieldState<T>();
}

class _CustomAutocompleteFieldState<T extends Object>
    extends State<CustomAutocompleteField<T>> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialValue != null
          ? widget.displayStringForOption(widget.initialValue!)
          : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Autocomplete<T>(
      displayStringForOption: widget.displayStringForOption,
      onSelected: widget.onSelected,
      initialValue: widget.initialValue != null
          ? TextEditingValue(
              text: widget.displayStringForOption(widget.initialValue!),
            )
          : null,
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              onSubmitted: (value) => onFieldSubmitted(),
              enabled: widget.enabled,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color:
                      customColors?.textColorTextPlaceholder ??
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  fontSize: 14,
                ),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                filled: true,
                fillColor:
                    customColors?.backgroundColorBgContainer ??
                    Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    color:
                        customColors?.borderColorBorder ??
                        Theme.of(context).colorScheme.outline,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    color:
                        customColors?.borderColorBorder ??
                        Theme.of(context).colorScheme.outline,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    color:
                        (customColors?.borderColorBorder ??
                                Theme.of(context).colorScheme.outline)
                            .withOpacity(0.5),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              style: TextStyle(
                fontSize: 14,
                color: widget.enabled
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              ),
            );
          },
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return widget.options;
        }
        return widget.options.where((option) {
          return widget
              .displayStringForOption(option)
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(6),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      customColors?.backgroundColorBgContainer ??
                      Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color:
                        customColors?.borderColorBorder ??
                        Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => onSelected(option),
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Text(
                            widget.displayStringForOption(option),
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onSurface,
                              height: 1.57,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
