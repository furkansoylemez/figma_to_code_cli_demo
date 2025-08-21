import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class DefaultPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int itemsPerPage;
  final int totalItems;
  final ValueChanged<int>? onPageChanged;
  final ValueChanged<int?>? onItemsPerPageChanged;
  final List<int> itemsPerPageOptions;
  final bool showItemsPerPageSelector;
  final bool showItemsSummary;

  const DefaultPagination({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    this.itemsPerPage = 10,
    this.totalItems = 0,
    this.onPageChanged,
    this.onItemsPerPageChanged,
    this.itemsPerPageOptions = const [10, 20, 50, 100],
    this.showItemsPerPageSelector = true,
    this.showItemsSummary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Container(
      height: 36,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showItemsSummary) _buildItemsSummary(context, customColors),
          _buildPaginationControls(context, customColors),
          if (showItemsPerPageSelector)
            _buildItemsPerPageSelector(context, customColors),
        ],
      ),
    );
  }

  Widget _buildItemsSummary(BuildContext context, CustomColors? customColors) {
    return Text(
      '$totalItems veriden $itemsPerPage tanesi listeleniyor.',
      style: TextStyle(
        fontSize: 12,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w400,
        color:
            (customColors?.textColorTextSecondary ??
                    Theme.of(context).colorScheme.onSurface)
                .withOpacity(0.65),
        height: 22 / 12,
      ),
    );
  }

  Widget _buildPaginationControls(
    BuildContext context,
    CustomColors? customColors,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildArrowButton(
          context: context,
          customColors: customColors,
          icon: Icons.chevron_left,
          onPressed: currentPage > 1
              ? () => onPageChanged?.call(currentPage - 1)
              : null,
        ),
        const SizedBox(width: 8),
        ..._buildPageNumbers(context, customColors),
        const SizedBox(width: 8),
        _buildArrowButton(
          context: context,
          customColors: customColors,
          icon: Icons.chevron_right,
          onPressed: currentPage < totalPages
              ? () => onPageChanged?.call(currentPage + 1)
              : null,
        ),
      ],
    );
  }

  List<Widget> _buildPageNumbers(
    BuildContext context,
    CustomColors? customColors,
  ) {
    final List<Widget> pages = [];

    for (int i = 1; i <= totalPages.clamp(0, 3); i++) {
      if (pages.isNotEmpty) {
        pages.add(const SizedBox(width: 8));
      }
      pages.add(
        _buildPageButton(
          context: context,
          customColors: customColors,
          pageNumber: i,
          isActive: i == currentPage,
        ),
      );
    }

    return pages;
  }

  Widget _buildPageButton({
    required BuildContext context,
    required CustomColors? customColors,
    required int pageNumber,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => onPageChanged?.call(pageNumber),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          border: isActive
              ? Border.all(
                  color:
                      customColors?.secondaryColorSecondary ??
                      Theme.of(context).colorScheme.primary,
                )
              : null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            pageNumber.toString(),
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
              color: isActive
                  ? customColors?.secondaryColorSecondary ??
                        Theme.of(context).colorScheme.primary
                  : (customColors?.textColorText ??
                            Theme.of(context).colorScheme.onSurface)
                        .withOpacity(0.88),
              height: 18.228 / 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArrowButton({
    required BuildContext context,
    required CustomColors? customColors,
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Icon(
          icon,
          size: 14,
          color: onPressed != null
              ? (customColors?.textColorText ??
                        Theme.of(context).colorScheme.onSurface)
                    .withOpacity(0.88)
              : (customColors?.textColorTextDisabled ??
                        Theme.of(context).colorScheme.onSurface)
                    .withOpacity(0.25),
        ),
      ),
    );
  }

  Widget _buildItemsPerPageSelector(
    BuildContext context,
    CustomColors? customColors,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$itemsPerPage / 0',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
            color:
                (customColors?.textColorTextTertiary ??
                        Theme.of(context).colorScheme.onSurface)
                    .withOpacity(0.45),
            height: 18.228 / 14,
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 104,
          height: 32,
          decoration: BoxDecoration(
            color:
                customColors?.backgroundColorBgBase ??
                Theme.of(context).colorScheme.surface,
            border: Border.all(
              color:
                  customColors?.borderColorBorder ??
                  Theme.of(context).colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: itemsPerPage,
              onChanged: onItemsPerPageChanged,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color:
                    (customColors?.textColorText ??
                            Theme.of(context).colorScheme.onSurface)
                        .withOpacity(0.88),
              ),
              items: itemsPerPageOptions
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(
                        '$value / Page',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          color:
                              (customColors?.textColorText ??
                                      Theme.of(context).colorScheme.onSurface)
                                  .withOpacity(0.88),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
