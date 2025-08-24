import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class BaseInputFieldBase extends StatefulWidget {
  final String? label;
  final String? placeholder;
  final String? hintText;
  final String? errorText;
  final String? value;
  final bool isDestructive;
  final bool enabled;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? paymentMethodIcon;
  final String? leadingText;
  final String? leadingDropdownValue;
  final List<String>? leadingDropdownItems;
  final String? trailingDropdownValue;
  final List<String>? trailingDropdownItems;
  final String? currencySymbol;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onHelpIconTap;
  final ValueChanged<String?>? onLeadingDropdownChanged;
  final ValueChanged<String?>? onTrailingDropdownChanged;
  final VoidCallback? onLeadingDropdownTap;
  final VoidCallback? onTrailingDropdownTap;

  const BaseInputFieldBase({
    super.key,
    this.label,
    this.placeholder,
    this.hintText,
    this.errorText,
    this.value,
    this.isDestructive = false,
    this.enabled = true,
    this.leadingIcon,
    this.trailingIcon,
    this.paymentMethodIcon,
    this.leadingText,
    this.leadingDropdownValue,
    this.leadingDropdownItems,
    this.trailingDropdownValue,
    this.trailingDropdownItems,
    this.currencySymbol,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.onHelpIconTap,
    this.onLeadingDropdownChanged,
    this.onTrailingDropdownChanged,
    this.onLeadingDropdownTap,
    this.onTrailingDropdownTap,
  });

  @override
  State<BaseInputFieldBase> createState() => _BaseInputFieldBaseState();
}

class _BaseInputFieldBaseState extends State<BaseInputFieldBase> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<CustomTypography>();
    final colors = Theme.of(context).extension<CustomColors>();

    final borderColor = widget.isDestructive
        ? colors!.error300
        : colors!.gray300;
    final backgroundColor = colors.white;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: typography!.textSmMedium?.copyWith(color: colors.gray700),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (widget.leadingDropdownValue != null) ...[
                _buildLeadingDropdown(typography!, colors),
                Container(width: 1, height: 44, color: colors.gray300),
              ],
              if (widget.leadingText != null) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: colors.gray50,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    widget.leadingText!,
                    style: typography!.textMdRegular?.copyWith(
                      color: colors.gray500,
                    ),
                  ),
                ),
              ],
              Expanded(child: _buildTextInput(typography!, colors)),
              if (widget.trailingDropdownValue != null) ...[
                Container(width: 1, height: 44, color: colors.gray300),
                _buildTrailingDropdown(typography, colors),
              ],
            ],
          ),
        ),
        if (widget.hintText != null || widget.errorText != null) ...[
          const SizedBox(height: 6),
          Text(
            widget.isDestructive && widget.errorText != null
                ? widget.errorText!
                : widget.hintText ?? '',
            style: typography!.textSmRegular?.copyWith(
              color: widget.isDestructive && widget.errorText != null
                  ? colors.error500
                  : colors.gray600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTextInput(CustomTypography typography, CustomColors colors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          if (widget.leadingIcon != null) ...[
            widget.leadingIcon!,
            const SizedBox(width: 8),
          ],
          if (widget.paymentMethodIcon != null) ...[
            Container(
              width: 32,
              height: 20,
              decoration: BoxDecoration(
                color: colors.gray100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: widget.paymentMethodIcon!,
            ),
            const SizedBox(width: 8),
          ],
          if (widget.currencySymbol != null) ...[
            Text(
              widget.currencySymbol!,
              style: typography.textMdRegular?.copyWith(color: colors.gray500),
            ),
          ],
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.enabled,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onSubmitted: widget.onSubmitted,
              style: typography.textMdRegular?.copyWith(color: colors.gray900),
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: typography.textMdRegular?.copyWith(
                  color: colors.gray500,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                counterText: '',
              ),
            ),
          ),
          if (widget.onHelpIconTap != null && !widget.isDestructive) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: widget.onHelpIconTap,
              child: Icon(Icons.help_outline, size: 16, color: colors.gray400),
            ),
          ],
          if (widget.isDestructive) ...[
            const SizedBox(width: 8),
            Icon(Icons.error_outline, size: 16, color: colors.error500),
          ],
          if (widget.trailingIcon != null) ...[
            const SizedBox(width: 8),
            widget.trailingIcon!,
          ],
        ],
      ),
    );
  }

  Widget _buildLeadingDropdown(
    CustomTypography typography,
    CustomColors colors,
  ) {
    return GestureDetector(
      onTap: widget.onLeadingDropdownTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.leadingDropdownValue!,
              style: typography.textMdRegular?.copyWith(color: colors.gray900),
            ),
            const SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_down, size: 16, color: colors.gray500),
          ],
        ),
      ),
    );
  }

  Widget _buildTrailingDropdown(
    CustomTypography typography,
    CustomColors colors,
  ) {
    return GestureDetector(
      onTap: widget.onTrailingDropdownTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.trailingDropdownValue!,
              style: typography.textMdRegular?.copyWith(color: colors.gray900),
            ),
            const SizedBox(width: 8),
            Icon(Icons.keyboard_arrow_down, size: 16, color: colors.gray500),
          ],
        ),
      ),
    );
  }
}
