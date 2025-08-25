import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseInputFieldBase extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? errorText;
  final bool hasError;
  final TextEditingController? controller;
  final String? leadingIconAsset;
  final String? trailingIconAsset;
  final String? leadingText;
  final String? trailingDropdownText;
  final String? leadingDropdownText;
  final Widget? paymentMethodIcon;
  final bool showHelpIcon;
  final VoidCallback? onTap;
  final VoidCallback? onHelpIconTap;
  final VoidCallback? onTrailingDropdownTap;
  final VoidCallback? onLeadingDropdownTap;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final TextInputType? keyboardType;
  final bool readOnly;
  final String? helpIconAsset;
  final String? errorIconAsset;
  final String? dropdownChevronAsset;

  const BaseInputFieldBase({
    super.key,
    required this.label,
    this.hintText,
    this.errorText,
    this.hasError = false,
    this.controller,
    this.leadingIconAsset,
    this.trailingIconAsset,
    this.leadingText,
    this.trailingDropdownText,
    this.leadingDropdownText,
    this.paymentMethodIcon,
    this.showHelpIcon = false,
    this.onTap,
    this.onHelpIconTap,
    this.onTrailingDropdownTap,
    this.onLeadingDropdownTap,
    this.onChanged,
    this.enabled = true,
    this.keyboardType,
    this.readOnly = false,
    this.helpIconAsset,
    this.errorIconAsset,
    this.dropdownChevronAsset,
  });

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<CustomTypography>();
    final colors = Theme.of(context).extension<CustomColors>();

    final borderColor = hasError ? colors!.error300 : colors!.gray300;
    final displayText = hasError ? errorText : hintText;
    final displayTextColor = hasError ? colors.error500 : colors.gray600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: typography!.textSmMedium?.copyWith(color: colors.gray700),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: colors.white,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (leadingText != null) _buildLeadingText(typography, colors),
              if (leadingDropdownText != null)
                _buildLeadingDropdown(typography, colors),
              Expanded(child: _buildMainInput(typography, colors)),
              if (trailingDropdownText != null)
                _buildTrailingDropdown(typography, colors),
            ],
          ),
        ),
        if (displayText != null) ...[
          const SizedBox(height: 6),
          Text(
            displayText,
            style: typography.textSmRegular?.copyWith(color: displayTextColor),
          ),
        ],
      ],
    );
  }

  Widget _buildLeadingText(CustomTypography typography, CustomColors colors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: colors.gray300)),
      ),
      child: Text(
        leadingText!,
        style: typography.textMdRegular?.copyWith(color: colors.gray500),
      ),
    );
  }

  Widget _buildLeadingDropdown(
    CustomTypography typography,
    CustomColors colors,
  ) {
    return GestureDetector(
      onTap: onLeadingDropdownTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(color: colors.gray300)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              leadingDropdownText!,
              style: typography.textMdRegular?.copyWith(color: colors.gray900),
            ),
            const SizedBox(width: 8),
            if (dropdownChevronAsset != null)
              SvgPicture.asset(
                dropdownChevronAsset!,
                colorFilter: ColorFilter.mode(colors.gray500, BlendMode.srcIn),
                width: 20,
                height: 20,
              )
            else
              SvgPicture.asset(
                'assets/icons/chevron_down.svg',
                colorFilter: ColorFilter.mode(colors.gray500, BlendMode.srcIn),
                width: 20,
                height: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainInput(CustomTypography typography, CustomColors colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          if (leadingIconAsset != null) ...[
            SvgPicture.asset(
              leadingIconAsset!,
              colorFilter: ColorFilter.mode(colors.gray500, BlendMode.srcIn),
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8),
          ],
          if (paymentMethodIcon != null) ...[
            paymentMethodIcon!,
            const SizedBox(width: 8),
          ],
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              onTap: onTap,
              enabled: enabled,
              readOnly: readOnly,
              keyboardType: keyboardType,
              style: typography.textMdRegular?.copyWith(color: colors.gray500),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: typography.textMdRegular?.copyWith(
                  color: colors.gray500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (hasError && errorIconAsset != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onHelpIconTap,
              child: SvgPicture.asset(
                errorIconAsset!,
                colorFilter: ColorFilter.mode(colors.error500, BlendMode.srcIn),
                width: 20,
                height: 20,
              ),
            ),
          ] else if (hasError) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onHelpIconTap,
              child: SvgPicture.asset(
                'assets/icons/alert_circle.svg',
                colorFilter: ColorFilter.mode(colors.error500, BlendMode.srcIn),
                width: 20,
                height: 20,
              ),
            ),
          ] else if (showHelpIcon && helpIconAsset != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onHelpIconTap,
              child: SvgPicture.asset(
                helpIconAsset!,
                colorFilter: ColorFilter.mode(colors.gray400, BlendMode.srcIn),
                width: 20,
                height: 20,
              ),
            ),
          ] else if (showHelpIcon) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onHelpIconTap,
              child: SvgPicture.asset(
                'assets/icons/help_circle.svg',
                colorFilter: ColorFilter.mode(colors.gray400, BlendMode.srcIn),
                width: 20,
                height: 20,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTrailingDropdown(
    CustomTypography typography,
    CustomColors colors,
  ) {
    return GestureDetector(
      onTap: onTrailingDropdownTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: colors.gray300)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              trailingDropdownText!,
              style: typography.textMdRegular?.copyWith(color: colors.gray900),
            ),
            const SizedBox(width: 8),
            if (dropdownChevronAsset != null)
              SvgPicture.asset(
                dropdownChevronAsset!,
                colorFilter: ColorFilter.mode(colors.gray500, BlendMode.srcIn),
                width: 20,
                height: 20,
              )
            else
              SvgPicture.asset(
                'assets/icons/chevron_down.svg',
                colorFilter: ColorFilter.mode(colors.gray500, BlendMode.srcIn),
                width: 20,
                height: 20,
              ),
          ],
        ),
      ),
    );
  }
}
