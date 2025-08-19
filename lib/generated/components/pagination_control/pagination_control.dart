import 'package:flutter/material.dart';

class PaginationControl extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int itemsPerPage;
  final int totalItems;
  final String? itemsDisplayText;
  final String? pageDisplayText;
  final String? itemsPerPageText;
  final List<int> itemsPerPageOptions;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final ValueChanged<int>? onPageChanged;
  final ValueChanged<int>? onItemsPerPageChanged;
  final bool showItemsPerPageSelector;
  final bool showPageNumbers;
  final bool showItemsInfo;
  final int maxVisiblePages;
  final double spacing;
  final double buttonSize;
  final double cornerRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? surfaceColor;
  final Color? borderColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? disabledColor;
  final Color? textColor;
  final Color? activeTextColor;
  final Color? inactiveTextColor;
  final Color? disabledTextColor;
  final TextStyle? itemsInfoTextStyle;
  final TextStyle? pageNumberTextStyle;
  final TextStyle? itemsPerPageTextStyle;
  final Widget? previousIcon;
  final Widget? nextIcon;
  final Widget? dropdownIcon;

  const PaginationControl({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.itemsPerPage = 10,
    this.totalItems = 0,
    this.itemsDisplayText,
    this.pageDisplayText,
    this.itemsPerPageText,
    this.itemsPerPageOptions = const [10, 25, 50, 100],
    this.onPreviousPressed,
    this.onNextPressed,
    this.onPageChanged,
    this.onItemsPerPageChanged,
    this.showItemsPerPageSelector = true,
    this.showPageNumbers = true,
    this.showItemsInfo = true,
    this.maxVisiblePages = 3,
    this.spacing = 8.0,
    this.buttonSize = 32.0,
    this.cornerRadius = 6.0,
    this.padding,
    this.backgroundColor,
    this.surfaceColor,
    this.borderColor,
    this.activeColor,
    this.inactiveColor,
    this.disabledColor,
    this.textColor,
    this.activeTextColor,
    this.inactiveTextColor,
    this.disabledTextColor,
    this.itemsInfoTextStyle,
    this.pageNumberTextStyle,
    this.itemsPerPageTextStyle,
    this.previousIcon,
    this.nextIcon,
    this.dropdownIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final effectiveBackgroundColor = backgroundColor ?? Colors.transparent;
    final effectiveSurfaceColor = surfaceColor ?? colorScheme.surface;
    final effectiveBorderColor = borderColor ?? colorScheme.outline;
    final effectiveActiveColor = activeColor ?? colorScheme.primary;
    final effectiveInactiveColor = inactiveColor ?? Colors.transparent;
    final effectiveDisabledColor = disabledColor ?? Colors.transparent;
    final effectiveTextColor =
        textColor ?? colorScheme.onSurface.withOpacity(0.88);
    final effectiveActiveTextColor = activeTextColor ?? colorScheme.primary;
    final effectiveInactiveTextColor =
        inactiveTextColor ?? colorScheme.onSurface.withOpacity(0.88);
    final effectiveDisabledTextColor =
        disabledTextColor ?? colorScheme.onSurface.withOpacity(0.25);

    final effectiveItemsInfoTextStyle =
        itemsInfoTextStyle ??
        theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurface.withOpacity(0.65),
        );
    final effectivePageNumberTextStyle =
        pageNumberTextStyle ?? theme.textTheme.labelLarge;
    final effectiveItemsPerPageTextStyle =
        itemsPerPageTextStyle ??
        theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500);

    return Container(
      padding: padding ?? const EdgeInsets.all(16.0),
      color: effectiveBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showItemsInfo) _buildItemsInfo(effectiveItemsInfoTextStyle),
          if (showPageNumbers)
            _buildPageNavigation(
              context,
              effectiveSurfaceColor,
              effectiveBorderColor,
              effectiveActiveColor,
              effectiveInactiveColor,
              effectiveDisabledColor,
              effectiveActiveTextColor,
              effectiveInactiveTextColor,
              effectiveDisabledTextColor,
              effectivePageNumberTextStyle,
            ),
          if (showItemsPerPageSelector)
            _buildItemsPerPageSelector(
              context,
              effectiveSurfaceColor,
              effectiveBorderColor,
              effectiveTextColor,
              effectiveItemsPerPageTextStyle,
            ),
        ],
      ),
    );
  }

  Widget _buildItemsInfo(TextStyle? textStyle) {
    final displayText =
        itemsDisplayText ??
        '$totalItems veriden $itemsPerPage tanesi listeleniyor.';

    return Text(displayText, style: textStyle);
  }

  Widget _buildPageNavigation(
    BuildContext context,
    Color surfaceColor,
    Color borderColor,
    Color activeColor,
    Color inactiveColor,
    Color disabledColor,
    Color activeTextColor,
    Color inactiveTextColor,
    Color disabledTextColor,
    TextStyle? textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildNavigationButton(
          context,
          icon: previousIcon ?? const Icon(Icons.chevron_left, size: 14),
          onPressed: currentPage > 1 ? onPreviousPressed : null,
          backgroundColor: inactiveColor,
          textColor: currentPage > 1 ? inactiveTextColor : disabledTextColor,
        ),
        SizedBox(width: spacing),
        ..._buildPageNumbers(
          activeColor,
          inactiveColor,
          activeTextColor,
          inactiveTextColor,
          textStyle,
          borderColor,
        ),
        SizedBox(width: spacing),
        _buildNavigationButton(
          context,
          icon: nextIcon ?? const Icon(Icons.chevron_right, size: 14),
          onPressed: currentPage < totalPages ? onNextPressed : null,
          backgroundColor: inactiveColor,
          textColor: currentPage < totalPages
              ? inactiveTextColor
              : disabledTextColor,
        ),
      ],
    );
  }

  List<Widget> _buildPageNumbers(
    Color activeColor,
    Color inactiveColor,
    Color activeTextColor,
    Color inactiveTextColor,
    TextStyle? textStyle,
    Color borderColor,
  ) {
    final List<Widget> pageNumbers = [];
    final startPage = (currentPage - maxVisiblePages ~/ 2).clamp(1, totalPages);
    final endPage = (startPage + maxVisiblePages - 1).clamp(1, totalPages);

    for (int page = startPage; page <= endPage; page++) {
      final isActive = page == currentPage;
      pageNumbers.add(
        _buildPageButton(
          page: page,
          isActive: isActive,
          backgroundColor: isActive ? activeColor : inactiveColor,
          textColor: isActive ? activeTextColor : inactiveTextColor,
          textStyle: textStyle,
          borderColor: isActive ? activeColor : null,
        ),
      );

      if (page < endPage) {
        pageNumbers.add(SizedBox(width: spacing));
      }
    }

    return pageNumbers;
  }

  Widget _buildPageButton({
    required int page,
    required bool isActive,
    required Color backgroundColor,
    required Color textColor,
    required TextStyle? textStyle,
    Color? borderColor,
  }) {
    return GestureDetector(
      onTap: () => onPageChanged?.call(page),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(cornerRadius),
          border: borderColor != null ? Border.all(color: borderColor) : null,
        ),
        child: Center(
          child: Text(
            page.toString(),
            style: textStyle?.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
    BuildContext context, {
    required Widget icon,
    required VoidCallback? onPressed,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: Center(
          child: IconTheme(
            data: IconThemeData(color: textColor),
            child: icon,
          ),
        ),
      ),
    );
  }

  Widget _buildItemsPerPageSelector(
    BuildContext context,
    Color surfaceColor,
    Color borderColor,
    Color textColor,
    TextStyle? textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$itemsPerPage / ${totalPages}',
          style: textStyle?.copyWith(color: textColor.withOpacity(0.45)),
        ),
        SizedBox(width: 16),
        Container(
          height: buttonSize,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.circular(cornerRadius),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                itemsPerPageText ?? '$itemsPerPage / Page',
                style: textStyle?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                dropdownIcon?.key != null
                    ? dropdownIcon as IconData?
                    : Icons.keyboard_arrow_down,
                size: 16,
                color: textColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
