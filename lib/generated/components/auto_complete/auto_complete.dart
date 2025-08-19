import 'package:flutter/material.dart';

class AutoComplete extends StatelessWidget {
  /// Whether the autocomplete dropdown is currently open
  final bool isOpen;

  /// The text value in the input field
  final String value;

  /// The label text for the input field
  final String label;

  /// The placeholder text when input is empty
  final String? placeholder;

  /// List of autocomplete options to display
  final List<String> options;

  /// The currently selected/highlighted option index
  final int? selectedOptionIndex;

  /// Whether to show the left icon
  final bool showLeftIcon;

  /// The left icon widget
  final Widget? leftIcon;

  /// Whether to show the right icon
  final bool showRightIcon;

  /// The right icon widget
  final Widget? rightIcon;

  /// Whether the input field is focused
  final bool isFocused;

  /// Whether the input field is enabled
  final bool enabled;

  /// Callback when the input text changes
  final ValueChanged<String>? onChanged;

  /// Callback when an option is selected
  final ValueChanged<String>? onOptionSelected;

  /// Callback when the input field is tapped
  final VoidCallback? onTap;

  /// Callback when the input field gains focus
  final VoidCallback? onFocusChanged;

  /// Width of the component
  final double? width;

  /// Height of the input field
  final double inputHeight;

  /// Maximum height of the dropdown
  final double? maxDropdownHeight;

  /// Border radius for both input and dropdown
  final double borderRadius;

  /// Border radius for dropdown items
  final double itemBorderRadius;

  /// Padding inside the input field
  final EdgeInsetsGeometry inputPadding;

  /// Padding inside the dropdown
  final EdgeInsetsGeometry dropdownPadding;

  /// Padding inside dropdown items
  final EdgeInsetsGeometry itemPadding;

  /// Spacing between elements in input field
  final double inputItemSpacing;

  /// Spacing between dropdown and input
  final double dropdownSpacing;

  /// Background color of the input field
  final Color? backgroundColor;

  /// Border color of the input field
  final Color? borderColor;

  /// Focused border color
  final Color? focusedBorderColor;

  /// Background color of the dropdown
  final Color? dropdownBackgroundColor;

  /// Border color of the dropdown
  final Color? dropdownBorderColor;

  /// Background color of hovered dropdown items
  final Color? itemHoverColor;

  /// Text color of the label
  final Color? labelColor;

  /// Text color of the input value
  final Color? valueColor;

  /// Text color of the placeholder
  final Color? placeholderColor;

  /// Text color of dropdown items
  final Color? itemTextColor;

  /// Text style for the label
  final TextStyle? labelStyle;

  /// Text style for the input value
  final TextStyle? valueStyle;

  /// Text style for the placeholder
  final TextStyle? placeholderStyle;

  /// Text style for dropdown items
  final TextStyle? itemTextStyle;

  /// Elevation of the dropdown
  final double dropdownElevation;

  /// Shadow color of the dropdown
  final Color? dropdownShadowColor;

  const AutoComplete({
    super.key,
    this.isOpen = false,
    this.value = '',
    this.label = 'Label',
    this.placeholder,
    this.options = const [
      'Select Menu Item',
      'Select Menu Item',
      'Select Menu Item',
    ],
    this.selectedOptionIndex,
    this.showLeftIcon = false,
    this.leftIcon,
    this.showRightIcon = false,
    this.rightIcon,
    this.isFocused = false,
    this.enabled = true,
    this.onChanged,
    this.onOptionSelected,
    this.onTap,
    this.onFocusChanged,
    this.width,
    this.inputHeight = 60.0,
    this.maxDropdownHeight,
    this.borderRadius = 6.0,
    this.itemBorderRadius = 4.0,
    this.inputPadding = const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 8.0,
    ),
    this.dropdownPadding = const EdgeInsets.all(4.0),
    this.itemPadding = const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 5.0,
    ),
    this.inputItemSpacing = 8.0,
    this.dropdownSpacing = 4.0,
    this.backgroundColor,
    this.borderColor,
    this.focusedBorderColor,
    this.dropdownBackgroundColor,
    this.dropdownBorderColor,
    this.itemHoverColor,
    this.labelColor,
    this.valueColor,
    this.placeholderColor,
    this.itemTextColor,
    this.labelStyle,
    this.valueStyle,
    this.placeholderStyle,
    this.itemTextStyle,
    this.dropdownElevation = 8.0,
    this.dropdownShadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final effectiveBackgroundColor = backgroundColor ?? colorScheme.surface;
    final effectiveBorderColor = borderColor ?? colorScheme.outline;
    final effectiveFocusedBorderColor =
        focusedBorderColor ?? colorScheme.primary;
    final effectiveDropdownBackgroundColor =
        dropdownBackgroundColor ?? colorScheme.surface;
    final effectiveDropdownBorderColor =
        dropdownBorderColor ?? colorScheme.surface;
    final effectiveItemHoverColor =
        itemHoverColor ?? colorScheme.onSurface.withOpacity(0.04);
    final effectiveLabelColor =
        labelColor ??
        (isFocused
            ? colorScheme.primary
            : colorScheme.onSurface.withOpacity(0.65));
    final effectiveValueColor =
        valueColor ?? colorScheme.onSurface.withOpacity(0.25);
    final effectivePlaceholderColor =
        placeholderColor ?? colorScheme.onSurface.withOpacity(0.25);
    final effectiveItemTextColor =
        itemTextColor ?? colorScheme.onSurface.withOpacity(0.88);
    final effectiveDropdownShadowColor =
        dropdownShadowColor ?? colorScheme.shadow;

    final effectiveLabelStyle =
        labelStyle ??
        textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          textBaseline: TextBaseline.alphabetic,
        );
    final effectiveValueStyle = valueStyle ?? textTheme.bodyMedium;
    final effectivePlaceholderStyle = placeholderStyle ?? textTheme.bodyMedium;
    final effectiveItemTextStyle = itemTextStyle ?? textTheme.bodyMedium;

    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildInputField(
            context,
            effectiveBackgroundColor,
            isFocused ? effectiveFocusedBorderColor : effectiveBorderColor,
            effectiveLabelColor,
            effectiveValueColor,
            effectivePlaceholderColor,
            effectiveLabelStyle,
            effectiveValueStyle,
            effectivePlaceholderStyle,
          ),
          if (isOpen) ...[
            SizedBox(height: dropdownSpacing),
            _buildDropdown(
              context,
              effectiveDropdownBackgroundColor,
              effectiveDropdownBorderColor,
              effectiveItemHoverColor,
              effectiveItemTextColor,
              effectiveItemTextStyle,
              effectiveDropdownShadowColor,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInputField(
    BuildContext context,
    Color backgroundColor,
    Color borderColor,
    Color labelColor,
    Color valueColor,
    Color placeholderColor,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    TextStyle? placeholderStyle,
  ) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: inputHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: isFocused ? 2.0 : 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: isFocused
              ? [
                  BoxShadow(
                    color: borderColor.withOpacity(0.2),
                    blurRadius: 0,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        padding: inputPadding,
        child: Row(
          children: [
            if (showLeftIcon && leftIcon != null) ...[
              SizedBox(width: 16, height: 16, child: leftIcon),
              SizedBox(width: inputItemSpacing),
            ],
            Expanded(
              child: _buildInputContent(
                labelColor,
                valueColor,
                placeholderColor,
                labelStyle,
                valueStyle,
                placeholderStyle,
              ),
            ),
            if (showRightIcon && rightIcon != null) ...[
              SizedBox(width: inputItemSpacing),
              SizedBox(width: 16, height: 16, child: rightIcon),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInputContent(
    Color labelColor,
    Color valueColor,
    Color placeholderColor,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    TextStyle? placeholderStyle,
  ) {
    if (isFocused || value.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: labelStyle?.copyWith(color: labelColor),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Expanded(
                child: Text(
                  value.isEmpty ? (placeholder ?? '') : value,
                  style: value.isEmpty
                      ? placeholderStyle?.copyWith(color: placeholderColor)
                      : valueStyle?.copyWith(color: valueColor),
                ),
              ),
              if (isFocused && value.isNotEmpty)
                Container(
                  width: 1,
                  height: 18,
                  color: valueColor.withOpacity(0.65),
                ),
            ],
          ),
        ],
      );
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        placeholder ?? label,
        style: placeholderStyle?.copyWith(color: placeholderColor),
      ),
    );
  }

  Widget _buildDropdown(
    BuildContext context,
    Color backgroundColor,
    Color borderColor,
    Color itemHoverColor,
    Color itemTextColor,
    TextStyle? itemTextStyle,
    Color shadowColor,
  ) {
    return Container(
      constraints: BoxConstraints(maxHeight: maxDropdownHeight ?? 200),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.05),
            offset: const Offset(0, 9),
            blurRadius: 28,
            spreadRadius: 8,
          ),
          BoxShadow(
            color: shadowColor.withOpacity(0.12),
            offset: const Offset(0, 3),
            blurRadius: 6,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: shadowColor.withOpacity(0.08),
            offset: const Offset(0, 6),
            blurRadius: 16,
          ),
        ],
      ),
      padding: dropdownPadding,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (context, index) {
          final isHovered =
              index == 0; // Simulate hover for first item as shown in design

          return GestureDetector(
            onTap: () => onOptionSelected?.call(options[index]),
            child: Container(
              height: 32,
              margin: index > 0
                  ? const EdgeInsets.only(top: 0)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: isHovered ? itemHoverColor : Colors.transparent,
                borderRadius: BorderRadius.circular(itemBorderRadius),
              ),
              padding: itemPadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  options[index],
                  style: itemTextStyle?.copyWith(color: itemTextColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
