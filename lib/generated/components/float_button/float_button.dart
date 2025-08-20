import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class FloatButton extends StatelessWidget {
  final Widget? icon;
  final VoidCallback? onPressed;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;

  const FloatButton({
    super.key,
    this.icon,
    this.onPressed,
    this.size = 40.0,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 9),
            blurRadius: 28.0,
            spreadRadius: 8.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 3),
            blurRadius: 6.0,
            spreadRadius: -4.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 6),
            blurRadius: 16.0,
          ),
        ],
      ),
      child: Material(
        color: backgroundColor ?? 
               customColors?.primaryColorPrimary ?? 
               Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(4.0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(4.0),
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            child: IconTheme(
              data: IconThemeData(
                color: iconColor ?? 
                       customColors?.backgroundColorBgContainer ?? 
                       Theme.of(context).colorScheme.onPrimary,
                size: 18.0,
              ),
              child: icon ?? const Icon(Icons.folder_open),
            ),
          ),
        ),
      ),
    );
  }
}