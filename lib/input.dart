import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

enum BaseInputFieldType {
  defaultType,
  leadingDropdown,
  trailingDropdown,
  leadingText,
  paymentInput,
}

enum BaseInputFieldDestructive { falseValue, trueValue }

class BaseInputFieldBase extends StatelessWidget {
  final BaseInputFieldType type;
  final BaseInputFieldDestructive destructive;
  final String? label;
  final String? inputText;
  final String? hintText;
  final String? leadingText;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool enabled;

  const BaseInputFieldBase({
    super.key,
    this.type = BaseInputFieldType.defaultType,
    this.destructive = BaseInputFieldDestructive.falseValue,
    this.label,
    this.inputText,
    this.hintText,
    this.leadingText,
    this.onTap,
    this.onChanged,
    this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    final typography = Theme.of(context).extension<CustomTypography>()!;

    return Semantics(
      label: label,
      textField: true,
      enabled: enabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: typography.textSmMedium?.copyWith(
                color: destructive == BaseInputFieldDestructive.trueValue
                    ? colors.error100
                    : colors.textColortext,
              ),
            ),
            SizedBox(height: 8),
          ],
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: destructive == BaseInputFieldDestructive.trueValue
                    ? colors.error100
                    : colors.borderColorborder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
              color: enabled
                  ? colors.backgroundColorbgbase
                  : colors.backgroundColorbgcontainer,
            ),
            child: _buildInputContent(context, colors, typography),
          ),
          if (hintText != null) ...[
            SizedBox(height: 8),
            Text(
              hintText!,
              style: typography.textSmRegular?.copyWith(
                color: destructive == BaseInputFieldDestructive.trueValue
                    ? colors.error100
                    : colors.textColortextsecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInputContent(
    BuildContext context,
    CustomColors colors,
    CustomTypography typography,
  ) {
    switch (type) {
      case BaseInputFieldType.leadingDropdown:
        return Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    leadingText ?? '',
                    style: typography.textMdRegular?.copyWith(
                      color: enabled
                          ? colors.textColortext
                          : colors.textColortextdisabled,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 16,
                    color: enabled
                        ? colors.iconColoriconsecondary
                        : colors.backgroundColorbgcontainer,
                  ),
                ],
              ),
            ),
            Container(width: 1, height: 24, color: colors.borderColorborder),
            Expanded(child: _buildTextField(context, colors, typography)),
          ],
        );

      case BaseInputFieldType.trailingDropdown:
        return Row(
          children: [
            Expanded(child: _buildTextField(context, colors, typography)),
            Container(width: 1, height: 24, color: colors.borderColorborder),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: enabled
                    ? colors.iconColoriconsecondary
                    : colors.iconColoricon,
              ),
            ),
          ],
        );

      case BaseInputFieldType.leadingText:
        return Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                leadingText ?? '',
                style: typography.textMdRegular?.copyWith(
                  color: enabled
                      ? colors.textColortextsecondary
                      : colors.textColortextdisabled,
                ),
              ),
            ),
            Expanded(child: _buildTextField(context, colors, typography)),
          ],
        );

      case BaseInputFieldType.paymentInput:
        return Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Icon(
                Icons.credit_card,
                size: 16,
                color: enabled
                    ? colors.iconColoriconsecondary
                    : colors.iconColoricon,
              ),
            ),
            Expanded(child: _buildTextField(context, colors, typography)),
          ],
        );

      case BaseInputFieldType.defaultType:
      default:
        return _buildTextField(context, colors, typography);
    }
  }

  Widget _buildTextField(
    BuildContext context,
    CustomColors colors,
    CustomTypography typography,
  ) {
    return TextField(
      controller: controller,
      enabled: enabled,
      onChanged: onChanged,
      onTap: onTap,
      style: typography.textMdRegular?.copyWith(
        color: enabled ? colors.textColortext : colors.textColortext,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        hintText: inputText,
        hintStyle: typography.textMdRegular?.copyWith(
          color: colors.textColortextplaceholder,
        ),
        isDense: true,
      ),
      keyboardType: type == BaseInputFieldType.paymentInput
          ? TextInputType.number
          : TextInputType.text,
    );
  }
}
