import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

enum TabState { active, inactive }

class TabItem extends StatefulWidget {
  const TabItem({
    super.key,
    required this.title,
    this.state = TabState.inactive,
    this.badgeCount,
    this.icon,
    this.onTap,
  });

  final String title;
  final TabState state;
  final int? badgeCount;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final theme = Theme.of(context);
    
    final isActive = widget.state == TabState.active;
    
    Color textColor;
    Color? backgroundColor;
    Color? borderColor;
    
    if (isActive) {
      textColor = customColors?.primaryColorPrimary ?? theme.colorScheme.primary;
      borderColor = customColors?.primaryColorPrimary ?? theme.colorScheme.primary;
    } else {
      textColor = (customColors?.textColorText ?? theme.colorScheme.onSurface).withOpacity(0.88);
      if (_isHovered) {
        backgroundColor = Colors.black.withOpacity(0.03);
      }
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: 80),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border(
              bottom: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: isActive ? 2.0 : 0.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                SizedBox(
                  width: 16,
                  height: 16,
                  child: widget.icon,
                ),
                const SizedBox(width: 4),
              ],
              Flexible(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 24 / 14,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (widget.badgeCount != null) ...[
                const SizedBox(width: 4),
                Container(
                  constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isActive 
                      ? (customColors?.primaryColorPrimary ?? theme.colorScheme.primary)
                      : Colors.black.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    widget.badgeCount.toString(),
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      color: isActive 
                        ? Colors.white 
                        : (customColors?.textColorText ?? theme.colorScheme.onSurface).withOpacity(0.88),
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