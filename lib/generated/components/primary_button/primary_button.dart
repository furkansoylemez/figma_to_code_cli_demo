import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool showText;
  final bool showLeftIcon;
  final bool showRightIcon;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.showText = true,
    this.showLeftIcon = false,
    this.showRightIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: customColors?.primaryColorPrimary ?? Theme.of(context).colorScheme.primary,
        foregroundColor: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        minimumSize: const Size(0, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showLeftIcon && leftIcon != null) ...[
            SizedBox(
              width: 18,
              height: 18,
              child: leftIcon,
            ),
            if (showText) const SizedBox(width: 8),
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
          if (showRightIcon && rightIcon != null) ...[
            if (showText) const SizedBox(width: 8),
            SizedBox(
              width: 18,
              height: 18,
              child: rightIcon,
            ),
          ],
        ],
      ),
    );
  }
}