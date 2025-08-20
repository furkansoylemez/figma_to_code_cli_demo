import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class SearchInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final bool showClearButton;
  final bool enabled;

  const SearchInput({
    super.key,
    this.hintText = 'Search',
    this.controller,
    this.onChanged,
    this.onClear,
    this.showClearButton = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: customColors?.borderColorBorder ?? Theme.of(context).colorScheme.outline,
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        enabled: enabled,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.571,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.571,
            color: (customColors?.textColorTextPlaceholder ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.25),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          prefixIcon: Icon(
            Icons.search,
            size: 16,
            color: (customColors?.colorIcon ?? Theme.of(context).colorScheme.onSurfaceVariant).withOpacity(0.45),
          ),
          suffixIcon: showClearButton
              ? GestureDetector(
                  onTap: onClear,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.cancel,
                      size: 12,
                      color: (customColors?.colorIcon ?? Theme.of(context).colorScheme.onSurfaceVariant).withOpacity(0.25),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}