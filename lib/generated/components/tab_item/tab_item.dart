import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class TabItem extends StatelessWidget {
  final String title;
  final int? badgeCount;
  final bool showBadge;
  final bool isActive;
  final VoidCallback? onTap;

  const TabItem({
    super.key,
    required this.title,
    this.badgeCount,
    this.showBadge = false,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.zero,
        child: Container(
          constraints: const BoxConstraints(minWidth: 80),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            border: isActive 
              ? Border(
                  bottom: BorderSide(
                    color: customColors?.primaryColorPrimary ?? Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                )
              : const Border(
                  bottom: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    height: 24 / 14,
                    color: isActive
                      ? (customColors?.primaryColorPrimary ?? Theme.of(context).colorScheme.primary)
                      : (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (showBadge && badgeCount != null) ...[
                const SizedBox(width: 4),
                Container(
                  constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isActive
                      ? (customColors?.primaryColorPrimary ?? Theme.of(context).colorScheme.primary)
                      : Theme.of(context).colorScheme.onSurface.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    badgeCount.toString(),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      height: 12 / 12,
                      fontWeight: FontWeight.w500,
                      color: isActive
                        ? Theme.of(context).colorScheme.onPrimary
                        : (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}