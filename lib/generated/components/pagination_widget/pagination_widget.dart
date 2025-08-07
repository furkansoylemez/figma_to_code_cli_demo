import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final String? informationText;
  final TextStyle? informationTextStyle;
  final List<int> pages;
  final int currentPage;
  final bool showPreviousButton;
  final bool showNextButton;
  final bool previousButtonEnabled;
  final bool nextButtonEnabled;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final Function(int)? onPagePressed;
  final String? pageCountText;
  final TextStyle? pageCountTextStyle;
  final String? itemsPerPageText;
  final TextStyle? itemsPerPageTextStyle;
  final VoidCallback? onItemsPerPagePressed;
  final Color? activePageColor;
  final Color? activePageBorderColor;
  final Color? activePageTextColor;
  final Color? inactivePageColor;
  final Color? inactivePageBorderColor;
  final Color? inactivePageTextColor;
  final Color? disabledButtonColor;
  final Color? enabledButtonColor;
  final Color? buttonBorderColor;
  final Color? dropdownBackgroundColor;
  final Color? dropdownBorderColor;
  final double pageButtonSize;
  final double arrowButtonSize;
  final double borderRadius;
  final double spacing;
  final double itemSpacing;
  final EdgeInsetsGeometry padding;
  final TextStyle? pageButtonTextStyle;
  final Widget? previousIcon;
  final Widget? nextIcon;
  final Widget? dropdownIcon;
  final bool showInformation;
  final bool showPageCount;
  final bool showItemsPerPage;
  final MainAxisAlignment mainAxisAlignment;

  const PaginationWidget({
    super.key,
    this.informationText,
    this.informationTextStyle,
    required this.pages,
    required this.currentPage,
    this.showPreviousButton = true,
    this.showNextButton = true,
    this.previousButtonEnabled = true,
    this.nextButtonEnabled = true,
    this.onPreviousPressed,
    this.onNextPressed,
    this.onPagePressed,
    this.pageCountText,
    this.pageCountTextStyle,
    this.itemsPerPageText,
    this.itemsPerPageTextStyle,
    this.onItemsPerPagePressed,
    this.activePageColor,
    this.activePageBorderColor,
    this.activePageTextColor,
    this.inactivePageColor,
    this.inactivePageBorderColor,
    this.inactivePageTextColor,
    this.disabledButtonColor,
    this.enabledButtonColor,
    this.buttonBorderColor,
    this.dropdownBackgroundColor,
    this.dropdownBorderColor,
    this.pageButtonSize = 32.0,
    this.arrowButtonSize = 32.0,
    this.borderRadius = 6.0,
    this.spacing = 16.0,
    this.itemSpacing = 8.0,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    this.pageButtonTextStyle,
    this.previousIcon,
    this.nextIcon,
    this.dropdownIcon,
    this.showInformation = true,
    this.showPageCount = true,
    this.showItemsPerPage = true,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final defaultActivePageColor = activePageColor ?? Colors.transparent;
    final defaultActivePageBorderColor = activePageBorderColor ?? colorScheme.primary;
    final defaultActivePageTextColor = activePageTextColor ?? colorScheme.primary;
    
    final defaultInactivePageColor = inactivePageColor ?? Colors.transparent;
    final defaultInactivePageBorderColor = inactivePageBorderColor ?? Colors.transparent;
    final defaultInactivePageTextColor = inactivePageTextColor ?? colorScheme.onSurface.withOpacity(0.88);
    
    final defaultDisabledButtonColor = disabledButtonColor ?? colorScheme.onSurface.withOpacity(0.25);
    final defaultEnabledButtonColor = enabledButtonColor ?? colorScheme.onSurface.withOpacity(0.88);
    
    final defaultDropdownBackgroundColor = dropdownBackgroundColor ?? colorScheme.surface;
    final defaultDropdownBorderColor = dropdownBorderColor ?? colorScheme.outline;
    
    final defaultInformationTextStyle = informationTextStyle ?? theme.textTheme.bodySmall?.copyWith(
      color: colorScheme.onSurface.withOpacity(0.65),
      fontSize: 12.0,
    );
    
    final defaultPageCountTextStyle = pageCountTextStyle ?? theme.textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurface.withOpacity(0.45),
      fontWeight: FontWeight.w500,
    );
    
    final defaultItemsPerPageTextStyle = itemsPerPageTextStyle ?? theme.textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurface.withOpacity(0.88),
      fontWeight: FontWeight.w500,
    );
    
    final defaultPageButtonTextStyle = pageButtonTextStyle ?? theme.textTheme.labelMedium?.copyWith(
      fontWeight: FontWeight.w400,
    );

    return Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showInformation) _buildInformationSection(defaultInformationTextStyle),
          _buildPaginationControls(
            context,
            defaultActivePageColor,
            defaultActivePageBorderColor,
            defaultActivePageTextColor,
            defaultInactivePageColor,
            defaultInactivePageBorderColor,
            defaultInactivePageTextColor,
            defaultDisabledButtonColor,
            defaultEnabledButtonColor,
            defaultPageButtonTextStyle,
          ),
          if (showPageCount || showItemsPerPage) _buildPageInfoSection(
            context,
            defaultPageCountTextStyle,
            defaultItemsPerPageTextStyle,
            defaultDropdownBackgroundColor,
            defaultDropdownBorderColor,
          ),
        ],
      ),
    );
  }

  Widget _buildInformationSection(TextStyle? textStyle) {
    return Container(
      height: 36.0,
      alignment: Alignment.center,
      child: Text(
        informationText ?? '1.000 veriden 10 tanesi listeleniyor.',
        style: textStyle,
      ),
    );
  }

  Widget _buildPaginationControls(
    BuildContext context,
    Color activePageColor,
    Color activePageBorderColor,
    Color activePageTextColor,
    Color inactivePageColor,
    Color inactivePageBorderColor,
    Color inactivePageTextColor,
    Color disabledButtonColor,
    Color enabledButtonColor,
    TextStyle? pageButtonTextStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showPreviousButton) _buildArrowButton(
          icon: previousIcon ?? const Icon(Icons.chevron_left, size: 14.0),
          enabled: previousButtonEnabled,
          onPressed: onPreviousPressed,
          enabledColor: enabledButtonColor,
          disabledColor: disabledButtonColor,
        ),
        if (showPreviousButton) SizedBox(width: itemSpacing),
        ...pages.map((page) => _buildPageButton(
          page: page,
          isActive: page == currentPage,
          onPressed: () => onPagePressed?.call(page),
          activeColor: activePageColor,
          activeBorderColor: activePageBorderColor,
          activeTextColor: activePageTextColor,
          inactiveColor: inactivePageColor,
          inactiveBorderColor: inactivePageBorderColor,
          inactiveTextColor: inactivePageTextColor,
          textStyle: pageButtonTextStyle,
        )).expand((widget) => [widget, SizedBox(width: itemSpacing)]).take(pages.length * 2 - 1),
        if (showNextButton) SizedBox(width: itemSpacing),
        if (showNextButton) _buildArrowButton(
          icon: nextIcon ?? const Icon(Icons.chevron_right, size: 14.0),
          enabled: nextButtonEnabled,
          onPressed: onNextPressed,
          enabledColor: enabledButtonColor,
          disabledColor: disabledButtonColor,
        ),
      ],
    );
  }

  Widget _buildArrowButton({
    required Widget icon,
    required bool enabled,
    required VoidCallback? onPressed,
    required Color enabledColor,
    required Color disabledColor,
  }) {
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        width: arrowButtonSize,
        height: arrowButtonSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.transparent,
        ),
        child: Center(
          child: IconTheme(
            data: IconThemeData(
              color: enabled ? enabledColor : disabledColor,
              size: 14.0,
            ),
            child: icon,
          ),
        ),
      ),
    );
  }

  Widget _buildPageButton({
    required int page,
    required bool isActive,
    required VoidCallback onPressed,
    required Color activeColor,
    required Color activeBorderColor,
    required Color activeTextColor,
    required Color inactiveColor,
    required Color inactiveBorderColor,
    required Color inactiveTextColor,
    required TextStyle? textStyle,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: pageButtonSize,
        height: pageButtonSize,
        decoration: BoxDecoration(
          color: isActive ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isActive ? activeBorderColor : inactiveBorderColor,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text(
            page.toString(),
            style: textStyle?.copyWith(
              color: isActive ? activeTextColor : inactiveTextColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageInfoSection(
    BuildContext context,
    TextStyle? pageCountTextStyle,
    TextStyle? itemsPerPageTextStyle,
    Color dropdownBackgroundColor,
    Color dropdownBorderColor,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showPageCount) Text(
          pageCountText ?? '10 / 0',
          style: pageCountTextStyle,
        ),
        if (showPageCount && showItemsPerPage) SizedBox(width: spacing),
        if (showItemsPerPage) _buildItemsPerPageDropdown(
          itemsPerPageTextStyle,
          dropdownBackgroundColor,
          dropdownBorderColor,
        ),
      ],
    );
  }

  Widget _buildItemsPerPageDropdown(
    TextStyle? textStyle,
    Color backgroundColor,
    Color borderColor,
  ) {
    return GestureDetector(
      onTap: onItemsPerPagePressed,
      child: Container(
        height: 32.0,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              itemsPerPageText ?? '10 / Page',
              style: textStyle,
            ),
            const SizedBox(width: 8.0),
            dropdownIcon ?? Icon(
              Icons.keyboard_arrow_down,
              size: 16.0,
              color: textStyle?.color,
            ),
          ],
        ),
      ),
    );
  }
}