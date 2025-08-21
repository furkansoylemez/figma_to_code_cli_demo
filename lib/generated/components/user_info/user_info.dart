import 'package:flutter/material.dart';
import '../avatar/avatar.dart';
import '../tag/tag.dart';
import '../badge_text/badge_text.dart';
import '../../theme/color_theme.dart';

class UserInfo extends StatelessWidget {
  final String userName;
  final String userInitials;
  final String roleText;
  final String statusText;
  final BadgeStatus badgeStatus;
  final String? avatarImage;

  const UserInfo({
    super.key,
    required this.userName,
    required this.userInitials,
    required this.roleText,
    required this.statusText,
    this.badgeStatus = BadgeStatus.success,
    this.avatarImage,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return SizedBox(
      width: 343,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Avatar(
                type: AvatarType.text,
                text: userInitials,
                size: 32.0,
                backgroundColor: customColors?.primaryColorPrimary ?? 
                    Theme.of(context).colorScheme.primary,
                foregroundColor: customColors?.backgroundColorBgContainer ?? 
                    Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: (customColors?.textColorText ?? 
                          Theme.of(context).colorScheme.onSurface)
                          .withOpacity(0.88),
                      fontSize: 14,
                      height: 22 / 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Tag(
                    text: roleText,
                    type: TagType.colorful,
                    backgroundColor: customColors?.fillColorFillQuaternary ?? 
                        Theme.of(context).colorScheme.surface,
                    borderColor: customColors?.borderColorBorder ?? 
                        Theme.of(context).colorScheme.outline,
                    textColor: customColors?.textColorText ?? 
                        Theme.of(context).colorScheme.onSurface,
                  ),
                ],
              ),
            ],
          ),
          BadgeText(
            text: statusText,
            status: badgeStatus,
          ),
        ],
      ),
    );
  }
}