import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class BadgeText extends StatelessWidget {
  final String text;
  final BadgeStatus status;
  final Color? dotColor;
  final Color? textColor;

  const BadgeText({
    super.key,
    required this.text,
    this.status = BadgeStatus.success,
    this.dotColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    Color effectiveDotColor = dotColor ?? 
        (status == BadgeStatus.success 
            ? customColors?.successColorSuccess ?? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary);
    
    Color effectiveTextColor = textColor ?? 
        customColors?.textColorText?.withOpacity(0.88) ?? 
        Theme.of(context).colorScheme.onSurface.withOpacity(0.88);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: effectiveDotColor,
            border: Border.all(
              color: customColors?.backgroundColorBgContainer ?? 
                     Theme.of(context).colorScheme.surface,
              width: 2,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: effectiveTextColor,
            height: 22 / 14,
          ),
        ),
      ],
    );
  }
}

enum BadgeStatus {
  success,
  error,
  warning,
  info,
}