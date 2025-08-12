import 'package:flutter/material.dart';
import '../base_avatar/base_avatar.dart';
import '../tag/tag.dart';
import '../base_badge/base_badge.dart';

class UserInfo extends StatelessWidget {
  final String userInitials;
  final String userName;
  final String jobTitle;
  final String statusText;
  final bool isActive;
  final Color? avatarBackgroundColor;
  final VoidCallback? onTap;
  final double? width;

  const UserInfo({
    Key? key,
    required this.userInitials,
    required this.userName,
    required this.jobTitle,
    required this.statusText,
    this.isActive = true,
    this.avatarBackgroundColor,
    this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 343,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  BaseAvatar(
                    type: AvatarType.text,
                    size: AvatarSize.large,
                    text: userInitials,
                    backgroundColor:
                        avatarBackgroundColor ?? const Color(0xFF583D97),
                    foregroundColor: Colors.white,
                    borderRadius: 32,
                    textStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.57,
                            color: Color(0xE0000000),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Tag(
                          text: jobTitle,
                          variant: TagVariant.addNew,
                          backgroundColor: const Color(0x05000000),
                          borderColor: const Color(0xFFD9D9D9),
                          textColor: const Color(0xE0000000),
                          textStyle: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            height: 1.67,
                          ),
                          borderRadius: 4,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BaseBadge(
              text: statusText,
              status: isActive ? BadgeStatus.success : BadgeStatus.error,
              showIndicator: true,
              indicatorColor: isActive
                  ? const Color(0xFF52C41A)
                  : const Color(0xFFFF4D4F),
              indicatorBorderColor: Colors.white,
              indicatorSize: 6,
              indicatorBorderWidth: 2,
              textColor: const Color(0xE0000000),
              textStyle: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.57,
              ),
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
