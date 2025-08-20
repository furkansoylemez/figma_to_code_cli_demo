import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class DefaultPagination extends StatelessWidget {
  final String? resultsText;
  final int currentPage;
  final List<int> pageNumbers;
  final int itemsPerPage;
  final int totalPages;
  final bool showPreviousButton;
  final bool showNextButton;
  final bool enablePreviousButton;
  final bool enableNextButton;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final ValueChanged<int>? onPagePressed;
  final ValueChanged<int>? onItemsPerPageChanged;
  final bool showItemsPerPageSelector;
  final String? pageInfoText;

  const DefaultPagination({
    super.key,
    this.resultsText,
    this.currentPage = 1,
    this.pageNumbers = const [1, 2, 3],
    this.itemsPerPage = 10,
    this.totalPages = 0,
    this.showPreviousButton = true,
    this.showNextButton = true,
    this.enablePreviousButton = false,
    this.enableNextButton = true,
    this.onPreviousPressed,
    this.onNextPressed,
    this.onPagePressed,
    this.onItemsPerPageChanged,
    this.showItemsPerPageSelector = true,
    this.pageInfoText,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Container(
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildResultsInfo(context, customColors),
          _buildPaginationControls(context, customColors),
          if (showItemsPerPageSelector) _buildItemsPerPageSelector(context, customColors),
        ],
      ),
    );
  }

  Widget _buildResultsInfo(BuildContext context, CustomColors? customColors) {
    return Container(
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultsText ?? '1.000 veriden 10 tanesi listeleniyor.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: (customColors?.textColorTextSecondary ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.65),
              height: 1.83,
              fontFamily: 'DM Sans',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaginationControls(BuildContext context, CustomColors? customColors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showPreviousButton) _buildArrowButton(context, customColors, true),
        if (showPreviousButton) const SizedBox(width: 8),
        ...pageNumbers.map((pageNumber) => _buildPageButton(context, customColors, pageNumber)),
        const SizedBox(width: 8),
        if (showNextButton) _buildArrowButton(context, customColors, false),
      ],
    );
  }

  Widget _buildArrowButton(BuildContext context, CustomColors? customColors, bool isPrevious) {
    final isEnabled = isPrevious ? enablePreviousButton : enableNextButton;
    final onPressed = isPrevious ? onPreviousPressed : onNextPressed;
    
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: BorderRadius.circular(6),
          child: Center(
            child: SizedBox(
              width: 14,
              height: 14,
              child: Icon(
                isPrevious ? Icons.chevron_left : Icons.chevron_right,
                size: 14,
                color: isEnabled 
                  ? (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.88)
                  : (customColors?.textColorTextDisabled ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.25),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageButton(BuildContext context, CustomColors? customColors, int pageNumber) {
    final isActive = pageNumber == currentPage;
    
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: isActive ? Border.all(
            color: customColors?.secondaryColorSecondary ?? Theme.of(context).colorScheme.primary,
            width: 1,
          ) : null,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: () => onPagePressed?.call(pageNumber),
            borderRadius: BorderRadius.circular(6),
            child: Center(
              child: Text(
                pageNumber.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isActive 
                    ? (customColors?.secondaryColorSecondary ?? Theme.of(context).colorScheme.primary)
                    : (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
                  fontFamily: 'DM Sans',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemsPerPageSelector(BuildContext context, CustomColors? customColors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          pageInfoText ?? '$itemsPerPage / $totalPages',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: (customColors?.textColorTextTertiary ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.45),
            fontFamily: 'DM Sans',
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 104,
          height: 32,
          decoration: BoxDecoration(
            color: customColors?.backgroundColorBgBase ?? Theme.of(context).colorScheme.surface,
            border: Border.all(
              color: customColors?.borderColorBorder ?? Theme.of(context).colorScheme.outline,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '$itemsPerPage / Page',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
                          fontFamily: 'DM Sans',
                        ),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}