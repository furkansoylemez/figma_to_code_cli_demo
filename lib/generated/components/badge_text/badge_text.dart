import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class BadgeText extends StatelessWidget {
  final String text;
  final BadgeStatus status;

  const BadgeText({
    super.key,
    required this.text,
    this.status = BadgeStatus.success,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getStatusColor(context, customColors),
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
            height: 22 / 14,
            color: (customColors?.textColorText ?? 
                   Theme.of(context).colorScheme.onSurface).withOpacity(0.88),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(BuildContext context, CustomColors? customColors) {
    switch (status) {
      case BadgeStatus.success:
        return customColors?.successColorSuccess ?? 
               Theme.of(context).colorScheme.primary;
      case BadgeStatus.error:
        return Theme.of(context).colorScheme.error;
      case BadgeStatus.warning:
        return Theme.of(context).colorScheme.tertiary;
      case BadgeStatus.info:
        return Theme.of(context).colorScheme.secondary;
    }
  }
}

enum BadgeStatus { success, error, warning, info }