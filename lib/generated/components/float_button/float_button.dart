import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class FloatButton extends StatelessWidget {
  final Widget? icon;
  final VoidCallback? onPressed;

  const FloatButton({
    super.key,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: customColors?.primaryColorPrimary ?? Theme.of(context).colorScheme.primary,
      foregroundColor: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.onPrimary,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: icon ?? const Icon(Icons.folder_open),
    );
  }
}