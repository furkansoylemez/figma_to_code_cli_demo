import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.iconLeft,
    this.iconRight,
    this.showIconLeft = false,
    this.showIconRight = false,
    this.showText = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final Widget? iconLeft;
  final Widget? iconRight;
  final bool showIconLeft;
  final bool showIconRight;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: customColors?.primaryColorPrimary ?? Theme.of(context).colorScheme.primary,
        foregroundColor: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        minimumSize: const Size(0, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showIconLeft && iconLeft != null) ...[
            SizedBox(
              width: 18,
              height: 18,
              child: iconLeft,
            ),
            const SizedBox(width: 8),
          ],
          if (showText)
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.25,
              ),
            ),
          if (showIconRight && iconRight != null) ...[
            const SizedBox(width: 8),
            SizedBox(
              width: 18,
              height: 18,
              child: iconRight,
            ),
          ],
        ],
      ),
    );
  }
}