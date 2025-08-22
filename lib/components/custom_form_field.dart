import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final String? value;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final int? maxLines;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool enabled;
  final Color? fillColor;
  final Color? borderColor;
  final Color? errorBorderColor;
  final Color? focusedBorderColor;
  final double borderRadius;
  final EdgeInsets contentPadding;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final bool showDropdownArrow;
  final VoidCallback? onDropdownTap;
  final String? dropdownValue;
  final double? height;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final String? counterText;
  final int? maxLength;
  final bool showCounter;
  final Color? cursorColor;
  final double cursorWidth;
  final Radius? cursorRadius;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final String? semanticLabel;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final Color? iconColor;
  final double? iconSize;

  const CustomFormField({
    Key? key,
    this.label,
    this.hintText,
    this.errorText,
    this.value,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.controller,
    this.focusNode,
    this.enabled = true,
    this.fillColor,
    this.borderColor,
    this.errorBorderColor,
    this.focusedBorderColor,
    this.borderRadius = 8.0,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 16.0,
    ),
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.showDropdownArrow = false,
    this.onDropdownTap,
    this.dropdownValue,
    this.height,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.counterText,
    this.maxLength,
    this.showCounter = false,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.semanticLabel,
    this.onEditingComplete,
    this.onSubmitted,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    if (widget.value != null) {
      _controller.text = widget.value!;
    }

    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void didUpdateWidget(CustomFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && widget.value != null) {
      _controller.text = widget.value!;
    }
  }

  Color get _borderColor {
    if (widget.errorText != null) {
      return widget.errorBorderColor ?? Colors.red;
    }
    if (_isFocused) {
      return widget.focusedBorderColor ?? Theme.of(context).primaryColor;
    }
    return widget.borderColor ?? Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget suffixWidget = widget.suffixIcon ?? SizedBox.shrink();

    if (widget.showDropdownArrow) {
      suffixWidget = GestureDetector(
        onTap: widget.onDropdownTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.dropdownValue != null) ...[
                Text(
                  widget.dropdownValue!,
                  style: widget.textStyle ?? theme.textTheme.bodyMedium,
                ),
                const SizedBox(width: 8.0),
              ],
              Icon(
                Icons.keyboard_arrow_down,
                color: widget.iconColor ?? Colors.grey.shade600,
                size: widget.iconSize ?? 20.0,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style:
                widget.labelStyle ??
                theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 8.0),
        ],
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(color: _borderColor, width: 1.0),
            color: widget.fillColor ?? Colors.grey.shade50,
          ),
          child: TextFormField(
            controller: _controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            textCapitalization: widget.textCapitalization,
            textAlign: widget.textAlign,
            textAlignVertical: widget.textAlignVertical,
            autofocus: widget.autofocus,
            autocorrect: widget.autocorrect,
            enableSuggestions: widget.enableSuggestions,
            cursorColor: widget.cursorColor ?? theme.primaryColor,
            cursorWidth: widget.cursorWidth,
            cursorRadius: widget.cursorRadius,
            style: widget.textStyle ?? theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle:
                  widget.hintStyle ??
                  theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                  ),
              prefixIcon: widget.prefixIcon,
              prefixText: widget.prefixText,
              suffixIcon: suffixWidget,
              suffixText: widget.suffixText,
              contentPadding: widget.contentPadding,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              counterText: widget.showCounter ? null : '',
            ),
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: widget.onSubmitted,
          ),
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: 6.0),
          Text(
            widget.errorText!,
            style:
                widget.errorStyle ??
                theme.textTheme.bodySmall?.copyWith(color: Colors.red),
          ),
        ],
      ],
    );
  }
}
