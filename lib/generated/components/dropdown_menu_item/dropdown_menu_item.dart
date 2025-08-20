import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class DropdownMenuItem extends StatelessWidget {
  final Widget? icon;
  final String text;
  final bool showIcon;
  final VoidCallback? onTap;

  const DropdownMenuItem({
    super.key,
    this.icon,
    required this.text,
    this.showIcon = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          height: 32.0,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIcon) ...[
                SizedBox(
                  width: 16.0,
                  height: 16.0,
                  child: icon ?? Icon(
                    Icons.person_outline,
                    size: 16.0,
                    color: (customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
                  ),
                ),
                const SizedBox(width: 8.0),
              ],
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  height: 24.0 / 14.0,
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