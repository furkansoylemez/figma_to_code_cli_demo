import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

enum BaseInputFieldType {
  defaultType,
  paymentInput,
  leadingDropdown,
  leadingText,
  trailingDropdown,
}

class BaseInputFieldBase extends StatefulWidget {
  final BaseInputFieldType type;
  final bool destructive;
  final String label;
  final String? value;
  final String? placeholder;
  final String? hintText;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final String? leadingText;
  final String? dropdownValue;
  final List<String>? dropdownItems;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onDropdownChanged;
  final TextEditingController? controller;

  const BaseInputFieldBase({
    Key? key,
    required this.type,
    this.destructive = false,
    required this.label,
    this.value,
    this.placeholder,
    this.hintText,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingText,
    this.dropdownValue,
    this.dropdownItems,
    this.onChanged,
    this.onDropdownChanged,
    this.controller,
  }) : super(key: key);

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
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: theme.typographyy.textSmMedium.copyWith(
            color: theme.colors.gray700,
          ),
        ),
        const SizedBox(height: 6),
        _buildInputField(theme),
        if (widget.hintText != null) ...[
          const SizedBox(height: 6),
          Text(
            widget.hintText!,
            style: theme.typographyy.textSmRegular.copyWith(
              color: widget.destructive
                  ? theme.colors.error500
                  : theme.colors.gray600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInputField(ThemeData theme) {
    final borderColor = widget.destructive
        ? theme.colors.error300
        : theme.colors.gray300;

    switch (widget.type) {
      case BaseInputFieldType.defaultType:
        return _buildDefaultInput(theme, borderColor);
      case BaseInputFieldType.paymentInput:
        return _buildPaymentInput(theme, borderColor);
      case BaseInputFieldType.leadingDropdown:
        return _buildLeadingDropdownInput(theme, borderColor);
      case BaseInputFieldType.leadingText:
        return _buildLeadingTextInput(theme, borderColor);
      case BaseInputFieldType.trailingDropdown:
        return _buildTrailingDropdownInput(theme, borderColor);
    }
  }

  Widget _buildDefaultInput(ThemeData theme, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (widget.leadingIcon != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: widget.leadingIcon,
            ),
          ],
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              style: theme.typographyy.textMdRegular.copyWith(
                color: theme.colors.gray500,
              ),
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: theme.typographyy.textMdRegular.copyWith(
                  color: theme.colors.gray500,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: widget.leadingIcon != null ? 12 : 14,
                  right: 14,
                  top: 10,
                  bottom: 10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: widget.destructive
                ? Icon(
                    Icons.error_outline,
                    size: 20,
                    color: theme.colors.error500,
                  )
                : Icon(
                    Icons.help_outline,
                    size: 20,
                    color: theme.colors.gray400,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentInput(ThemeData theme, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: _buildMastercardIcon(theme),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              style: theme.typographyy.textMdRegular.copyWith(
                color: theme.colors.gray500,
              ),
              decoration: InputDecoration(
                hintText: widget.placeholder ?? "Card number",
                hintStyle: theme.typographyy.textMdRegular.copyWith(
                  color: theme.colors.gray500,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  left: 12,
                  right: 14,
                  top: 10,
                  bottom: 10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: widget.destructive
                ? Icon(
                    Icons.error_outline,
                    size: 20,
                    color: theme.colors.error500,
                  )
                : Icon(
                    Icons.help_outline,
                    size: 20,
                    color: theme.colors.gray400,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingDropdownInput(ThemeData theme, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.dropdownValue ?? "US",
                  style: theme.typographyy.textMdRegular.copyWith(
                    color: theme.colors.gray900,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: theme.colors.gray500,
                ),
              ],
            ),
          ),
          Container(width: 1, height: 44, color: theme.colors.gray300),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              style: theme.typographyy.textMdRegular.copyWith(
                color: theme.colors.gray500,
              ),
              decoration: InputDecoration(
                hintText: widget.placeholder ?? "+1 (555) 000-0000",
                hintStyle: theme.typographyy.textMdRegular.copyWith(
                  color: theme.colors.gray500,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  left: 14,
                  right: 14,
                  top: 10,
                  bottom: 10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: widget.destructive
                ? Icon(
                    Icons.error_outline,
                    size: 20,
                    color: theme.colors.error500,
                  )
                : Icon(
                    Icons.help_outline,
                    size: 20,
                    color: theme.colors.gray400,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingTextInput(ThemeData theme, Color borderColor) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.colors.white,
            border: Border.all(color: theme.colors.gray300),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            widget.leadingText ?? "http://",
            style: theme.typographyy.textMdRegular.copyWith(
              color: theme.colors.gray500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: theme.colors.white,
              border: Border.all(color: borderColor),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: widget.onChanged,
                    style: theme.typographyy.textMdRegular.copyWith(
                      color: theme.colors.gray500,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.placeholder ?? "www.untitledui.com",
                      hintStyle: theme.typographyy.textMdRegular.copyWith(
                        color: theme.colors.gray500,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                        top: 10,
                        bottom: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: widget.destructive
                      ? Icon(
                          Icons.error_outline,
                          size: 20,
                          color: theme.colors.error500,
                        )
                      : Icon(
                          Icons.help_outline,
                          size: 20,
                          color: theme.colors.gray400,
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrailingDropdownInput(ThemeData theme, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: widget.onChanged,
                    style: theme.typographyy.textMdRegular.copyWith(
                      color: theme.colors.gray500,
                    ),
                    decoration: InputDecoration(
                      prefixText: "\$",
                      prefixStyle: theme.typographyy.textMdRegular.copyWith(
                        color: theme.colors.gray500,
                      ),
                      hintText: widget.placeholder ?? "1,000.00",
                      hintStyle: theme.typographyy.textMdRegular.copyWith(
                        color: theme.colors.gray500,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                        top: 10,
                        bottom: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: widget.destructive
                      ? Icon(
                          Icons.error_outline,
                          size: 20,
                          color: theme.colors.error500,
                        )
                      : Icon(
                          Icons.help_outline,
                          size: 20,
                          color: theme.colors.gray400,
                        ),
                ),
              ],
            ),
          ),
          Container(width: 1, height: 44, color: theme.colors.gray300),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.dropdownValue ?? "USD",
                  style: theme.typographyy.textMdRegular.copyWith(
                    color: theme.colors.gray900,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: theme.colors.gray500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMastercardIcon(ThemeData theme) {
    return Container(
      width: 32,
      height: 20,
      decoration: BoxDecoration(
        color: theme.colors.gray100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 4,
            top: 2,
            child: Container(
              width: 12,
              height: 16,
              decoration: const BoxDecoration(
                color: Color(0xFFEB001B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 2,
            child: Container(
              width: 12,
              height: 16,
              decoration: const BoxDecoration(
                color: Color(0xFFF79E1B),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on ThemeData {
  get colors => this.extension<CustomColors>();
}

extension on ThemeData {
  get typographyy => this.extension<CustomTypography>();
}
