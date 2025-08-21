import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class DropdownMenuItem extends StatelessWidget {
  const DropdownMenuItem({
    super.key,
    required this.text,
    this.icon,
    this.showIcon = true,
    this.onTap,
  });

  final String text;
  final Widget? icon;
  final bool showIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIcon && icon != null) ...[
                SizedBox(
                  width: 16,
                  height: 16,
                  child: icon,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  height: 24 / 14,
                  color: (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}