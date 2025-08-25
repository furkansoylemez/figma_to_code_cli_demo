import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class BaseInputFieldBase extends StatefulWidget {
  final String? label;
  final String? hintText;
  final String? value;
  final String? helperText;
  final String? errorText;
  final bool isDestructive;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? paymentIcon;
  final String? leadingText;
  final String? leadingDropdownValue;
  final List<String>? leadingDropdownItems;
  final String? trailingDropdownValue;
  final List<String>? trailingDropdownItems;
  final String? currencySymbol;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onHelpIconTap;
  final ValueChanged<String?>? onLeadingDropdownChanged;
  final ValueChanged<String?>? onTrailingDropdownChanged;
  final bool enabled;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool obscureText;
  final FocusNode? focusNode;

  const BaseInputFieldBase({
    super.key,
    this.label,
    this.hintText,
    this.value,
    this.helperText,
    this.errorText,
    this.isDestructive = false,
    this.leadingIcon,
    this.trailingIcon,
    this.paymentIcon,
    this.leadingText,
    this.leadingDropdownValue,
    this.leadingDropdownItems,
    this.trailingDropdownValue,
    this.trailingDropdownItems,
    this.currencySymbol,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onHelpIconTap,
    this.onLeadingDropdownChanged,
    this.onTrailingDropdownChanged,
    this.enabled = true,
    this.keyboardType,
    this.maxLines = 1,
    this.obscureText = false,
    this.focusNode,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: typography?.textSmMedium?.copyWith(color: colors?.gray700),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          decoration: BoxDecoration(
            color: colors?.white,
            border: Border.all(
              color: widget.isDestructive
                  ? colors?.error300 ?? Colors.red
                  : colors?.gray300 ?? Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (widget.leadingDropdownValue != null &&
                  widget.leadingDropdownItems != null)
                _buildLeadingDropdown(typography, colors),
              if (widget.leadingText != null)
                _buildLeadingText(typography, colors),
              Expanded(child: _buildTextInput(typography, colors)),
              if (widget.trailingDropdownValue != null &&
                  widget.trailingDropdownItems != null)
                _buildTrailingDropdown(typography, colors),
            ],
          ),
        ),
        if (widget.helperText != null || widget.errorText != null) ...[
          const SizedBox(height: 6),
          Text(
            widget.isDestructive
                ? (widget.errorText ?? '')
                : (widget.helperText ?? ''),
            style: typography?.textSmRegular?.copyWith(
              color: widget.isDestructive ? colors?.error500 : colors?.gray600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildLeadingDropdown(
    CustomTypography? typography,
    CustomColors? colors,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: colors?.gray300 ?? Colors.grey),
        ),
      ),
      child: DropdownButton<String>(
        value: widget.leadingDropdownValue,
        items: widget.leadingDropdownItems?.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: typography?.textMdRegular?.copyWith(
                color: colors?.gray900,
              ),
            ),
          );
        }).toList(),
        onChanged: widget.enabled ? widget.onLeadingDropdownChanged : null,
        underline: const SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down, color: colors?.gray500, size: 20),
      ),
    );
  }

  Widget _buildLeadingText(CustomTypography? typography, CustomColors? colors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: colors?.gray50,
        border: Border(
          right: BorderSide(color: colors?.gray300 ?? Colors.grey),
        ),
      ),
      child: Text(
        widget.leadingText!,
        style: typography?.textMdRegular?.copyWith(color: colors?.gray500),
      ),
    );
  }

  Widget _buildTextInput(CustomTypography? typography, CustomColors? colors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          if (widget.leadingIcon != null) ...[
            widget.leadingIcon!,
            const SizedBox(width: 8),
          ],
          if (widget.paymentIcon != null) ...[
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: colors?.gray100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: widget.paymentIcon!,
            ),
            const SizedBox(width: 8),
          ],
          if (widget.currencySymbol != null) ...[
            Text(
              widget.currencySymbol!,
              style: typography?.textMdRegular?.copyWith(
                color: colors?.gray500,
              ),
            ),
            const SizedBox(width: 4),
          ],
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.enabled,
              keyboardType: widget.keyboardType,
              maxLines: widget.maxLines,
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              style: typography?.textMdRegular?.copyWith(
                color: colors?.gray500,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: typography?.textMdRegular?.copyWith(
                  color: colors?.gray500,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
          if (widget.onHelpIconTap != null && !widget.isDestructive)
            GestureDetector(
              onTap: widget.onHelpIconTap,
              child: Icon(Icons.help_outline, color: colors?.gray400, size: 20),
            ),
          if (widget.isDestructive)
            Icon(Icons.error_outline, color: colors?.error500, size: 20),
          if (widget.trailingIcon != null) ...[
            const SizedBox(width: 8),
            widget.trailingIcon!,
          ],
        ],
      ),
    );
  }

  Widget _buildTrailingDropdown(
    CustomTypography? typography,
    CustomColors? colors,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: colors?.gray300 ?? Colors.grey)),
      ),
      child: DropdownButton<String>(
        value: widget.trailingDropdownValue,
        items: widget.trailingDropdownItems?.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: typography?.textMdRegular?.copyWith(
                color: colors?.gray900,
              ),
            ),
          );
        }).toList(),
        onChanged: widget.enabled ? widget.onTrailingDropdownChanged : null,
        underline: const SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down, color: colors?.gray500, size: 20),
      ),
    );
  }
}
