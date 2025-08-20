import 'package:flutter/material.dart';
import '../custom_autocomplete/custom_autocomplete.dart';
import '../../theme/color_theme.dart';

class AutoCompleteTrue extends StatelessWidget {
  final String? placeholder;
  final List<String> options;
  final ValueChanged<String?>? onChanged;
  final String? value;
  final bool enabled;

  const AutoCompleteTrue({
    super.key,
    this.placeholder = 'Input',
    required this.options,
    this.onChanged,
    this.value,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomAutocomplete(
          placeholder: placeholder ?? 'Input',
          options: options,
          onChanged: onChanged,
          value: value,
          enabled: enabled,
        ),
        const SizedBox(height: 4),
        Container(
          width: 360,
          decoration: BoxDecoration(
            color: customColors?.backgroundColorBgElevated ?? Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.surface,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 28,
                offset: const Offset(0, 9),
                spreadRadius: 8,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 6,
                offset: const Offset(0, 3),
                spreadRadius: -4,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                _buildMenuItem('Select Menu Item', true),
                _buildMenuItem('Select Menu Item', false),
                _buildMenuItem('Select Menu Item', false),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String text, bool isHighlighted) {
    return Builder(
      builder: (context) {
        final customColors = Theme.of(context).extension<CustomColors>();
        
        return Container(
          height: 32,
          decoration: BoxDecoration(
            color: isHighlighted
                ? (customColors?.textColorText ?? Colors.black).withOpacity(0.04)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: (customColors?.textColorText ?? Colors.black).withOpacity(0.88),
                  height: 22 / 14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}