import 'package:flutter/material.dart';

enum SearchInputVariant {
  search,
  form,
  basic,
}

enum SearchInputSize {
  small,
  medium,
  large,
}

enum SearchInputState {
  normal,
  focused,
  disabled,
  error,
}

class FlexibleSearchInput extends StatelessWidget {
  const FlexibleSearchInput({
    super.key,
    this.variant = SearchInputVariant.search,
    this.size = SearchInputSize.medium,
    this.state = SearchInputState.normal,
    this.placeholder,
    this.value,
    this.label,
    this.description,
    this.showLeftIcon = true,
    this.showRightIcon = false,
    this.showClearButton = false,
    this.showLabel = true,
    this.showDescription = true,
    this.leftIcon,
    this.rightIcon,
    this.clearIcon,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.placeholderColor,
    this.labelColor,
    this.descriptionColor,
    this.iconColor,
    this.borderRadius,
    this.borderWidth = 1.0,
    this.padding,
    this.textStyle,
    this.labelTextStyle,
    this.placeholderTextStyle,
    this.descriptionTextStyle,
    this.height,
    this.width,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onClear,
    this.onLeftIconTap,
    this.onRightIconTap,
    this.controller,
    this.focusNode,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.search,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
  });

  final SearchInputVariant variant;
  final SearchInputSize size;
  final SearchInputState state;
  final String? placeholder;
  final String? value;
  final String? label;
  final String? description;
  final bool showLeftIcon;
  final bool showRightIcon;
  final bool showClearButton;
  final bool showLabel;
  final bool showDescription;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? clearIcon;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? placeholderColor;
  final Color? labelColor;
  final Color? descriptionColor;
  final Color? iconColor;
  final double? borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? placeholderTextStyle;
  final TextStyle? descriptionTextStyle;
  final double? height;
  final double? width;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onClear;
  final VoidCallback? onLeftIconTap;
  final VoidCallback? onRightIconTap;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool autofocus;
  final bool obscureText;
  final TextAlign textAlign;

  double get _getHeight {
    if (height != null) return height!;
    switch (size) {
      case SearchInputSize.small:
        return 32.0;
      case SearchInputSize.medium:
        return variant == SearchInputVariant.form ? 44.0 : 32.0;
      case SearchInputSize.large:
        return 60.0;
    }
  }

  double get _getBorderRadius {
    if (borderRadius != null) return borderRadius!;
    switch (size) {
      case SearchInputSize.small:
        return 4.0;
      case SearchInputSize.medium:
        return 6.0;
      case SearchInputSize.large:
        return 8.0;
    }
  }

  EdgeInsetsGeometry get _getPadding {
    if (padding != null) return padding!;
    switch (size) {
      case SearchInputSize.small:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case SearchInputSize.medium:
        return variant == SearchInputVariant.form
            ? const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0)
            : const EdgeInsets.symmetric(horizontal: 8.0);
      case SearchInputSize.large:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0);
    }
  }

  double get _getIconSize {
    switch (size) {
      case SearchInputSize.small:
        return 14.0;
      case SearchInputSize.medium:
        return 16.0;
      case SearchInputSize.large:
        return 16.0;
    }
  }

  Widget _buildDefaultLeftIcon(BuildContext context) {
    if (variant == SearchInputVariant.search) {
      return Icon(
        Icons.search,
        size: _getIconSize,
        color: iconColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
      );
    }
    return Icon(
      Icons.person_outline,
      size: _getIconSize,
      color: iconColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
    );
  }

  Widget _buildDefaultRightIcon(BuildContext context) {
    return Icon(
      Icons.info_outline,
      size: _getIconSize,
      color: iconColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
    );
  }

  Widget _buildDefaultClearIcon(BuildContext context) {
    return Icon(
      Icons.cancel,
      size: _getIconSize - 2,
      color: iconColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    if (backgroundColor != null) return backgroundColor!;
    if (state == SearchInputState.disabled) {
      return Theme.of(context).colorScheme.surface.withOpacity(0.12);
    }
    return Theme.of(context).colorScheme.surface;
  }

  Color _getBorderColor(BuildContext context) {
    if (borderColor != null) return borderColor!;
    switch (state) {
      case SearchInputState.focused:
        return Theme.of(context).colorScheme.primary;
      case SearchInputState.error:
        return Theme.of(context).colorScheme.error;
      case SearchInputState.disabled:
        return Theme.of(context).colorScheme.outline.withOpacity(0.12);
      default:
        return Theme.of(context).colorScheme.outline;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (textStyle != null) return textStyle!;
    final baseStyle = size == SearchInputSize.large
        ? Theme.of(context).textTheme.titleMedium
        : Theme.of(context).textTheme.bodyMedium;
    
    return baseStyle!.copyWith(
      color: textColor ?? (enabled 
          ? Theme.of(context).colorScheme.onSurface
          : Theme.of(context).colorScheme.onSurface.withOpacity(0.38)),
    );
  }

  TextStyle _getPlaceholderTextStyle(BuildContext context) {
    if (placeholderTextStyle != null) return placeholderTextStyle!;
    return _getTextStyle(context).copyWith(
      color: placeholderColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
    );
  }

  TextStyle _getLabelTextStyle(BuildContext context) {
    if (labelTextStyle != null) return labelTextStyle!;
    return Theme.of(context).textTheme.labelMedium!.copyWith(
      color: labelColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.88),
    );
  }

  TextStyle _getDescriptionTextStyle(BuildContext context) {
    if (descriptionTextStyle != null) return descriptionTextStyle!;
    return Theme.of(context).textTheme.bodySmall!.copyWith(
      color: descriptionColor ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
    );
  }

  Widget _buildInputField(BuildContext context) {
    final hasValue = controller?.text.isNotEmpty == true || value?.isNotEmpty == true;
    
    return Container(
      height: _getHeight,
      width: width,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        border: Border.all(
          color: _getBorderColor(context),
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(_getBorderRadius),
      ),
      padding: _getPadding,
      child: Row(
        children: [
          if (showLeftIcon) ...[
            GestureDetector(
              onTap: onLeftIconTap,
              child: leftIcon ?? _buildDefaultLeftIcon(context),
            ),
            const SizedBox(width: 8.0),
          ],
          Expanded(
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              enabled: enabled,
              readOnly: readOnly,
              maxLines: maxLines,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              autofocus: autofocus,
              obscureText: obscureText,
              textAlign: textAlign,
              style: _getTextStyle(context),
              decoration: InputDecoration(
                hintText: placeholder ?? (variant == SearchInputVariant.search ? 'Search' : 'Input'),
                hintStyle: _getPlaceholderTextStyle(context),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
              onTap: onTap,
            ),
          ),
          if (showClearButton && hasValue) ...[
            const SizedBox(width: 8.0),
            GestureDetector(
              onTap: onClear,
              child: clearIcon ?? _buildDefaultClearIcon(context),
            ),
          ],
          if (showRightIcon) ...[
            const SizedBox(width: 8.0),
            GestureDetector(
              onTap: onRightIconTap,
              child: rightIcon ?? _buildDefaultRightIcon(context),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    if (!showLabel || label == null) return const SizedBox.shrink();
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          Text(
            label!,
            style: _getLabelTextStyle(context),
          ),
          const SizedBox(width: 4.0),
          Icon(
            Icons.help_outline,
            size: 14.0,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    if (!showDescription || description == null) return const SizedBox.shrink();
    
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        description!,
        style: _getDescriptionTextStyle(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (variant == SearchInputVariant.form) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLabel(context),
          _buildInputField(context),
          _buildDescription(context),
        ],
      );
    }
    
    return _buildInputField(context);
  }
}