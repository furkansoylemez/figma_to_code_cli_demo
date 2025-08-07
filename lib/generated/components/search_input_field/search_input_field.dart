import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final VoidCallback? onClear;
  final bool showClearButton;
  final bool enabled;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final TextStyle? textStyle;
  final TextStyle? placeholderStyle;
  final Color? searchIconColor;
  final Color? clearIconColor;
  final double iconSize;
  final double itemSpacing;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool autofocus;
  final String? semanticLabel;

  const SearchInputField({
    super.key,
    this.placeholder,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.showClearButton = true,
    this.enabled = true,
    this.width,
    this.height = 32.0,
    this.padding,
    this.borderRadius = 6.0,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.textStyle,
    this.placeholderStyle,
    this.searchIconColor,
    this.clearIconColor,
    this.iconSize = 16.0,
    this.itemSpacing = 8.0,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    
    final effectiveBackgroundColor = backgroundColor ?? colorScheme.surface;
    final effectiveBorderColor = borderColor ?? colorScheme.outline;
    final effectiveTextStyle = textStyle ?? textTheme.bodyMedium?.copyWith(
      fontSize: 14.0,
      height: 1.57,
    );
    final effectivePlaceholderStyle = placeholderStyle ?? effectiveTextStyle?.copyWith(
      color: (effectiveTextStyle?.color ?? colorScheme.onSurface).withOpacity(0.25),
    );
    final effectiveSearchIconColor = searchIconColor ?? colorScheme.onSurface.withOpacity(0.45);
    final effectiveClearIconColor = clearIconColor ?? colorScheme.onSurface.withOpacity(0.25);
    final effectivePadding = padding ?? const EdgeInsets.symmetric(horizontal: 8.0);

    return Semantics(
      label: semanticLabel ?? 'Search input field',
      textField: true,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: effectiveBorderColor,
            width: borderWidth,
          ),
        ),
        child: Padding(
          padding: effectivePadding,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  onSubmitted: onSubmitted != null ? (_) => onSubmitted!() : null,
                  enabled: enabled,
                  autofocus: autofocus,
                  style: effectiveTextStyle,
                  decoration: InputDecoration(
                    hintText: placeholder ?? 'Search',
                    hintStyle: effectivePlaceholderStyle,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
              if (itemSpacing > 0) SizedBox(width: itemSpacing),
              if (showClearButton && controller?.text.isNotEmpty == true)
                GestureDetector(
                  onTap: enabled && onClear != null ? onClear : () => controller?.clear(),
                  child: Container(
                    width: iconSize,
                    height: iconSize,
                    alignment: Alignment.center,
                    child: suffixIcon ?? Icon(
                      Icons.close,
                      size: iconSize * 0.75,
                      color: effectiveClearIconColor,
                    ),
                  ),
                )
              else
                Container(
                  width: iconSize,
                  height: iconSize,
                  alignment: Alignment.center,
                  child: prefixIcon ?? Icon(
                    Icons.search,
                    size: iconSize,
                    color: effectiveSearchIconColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}