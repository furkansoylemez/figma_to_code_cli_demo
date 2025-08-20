import 'package:flutter/material.dart';
import '../avatar/avatar.dart';
import '../tag/tag.dart';
import '../../theme/color_theme.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    this.name = 'Yeşim Poyraz',
    this.role = 'UI/UX Designer',
    this.initials = 'YP',
    this.status = 'Aktif',
    this.imageUrl,
  });

  final String name;
  final String role;
  final String initials;
  final String status;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Avatar(
              type: AvatarType.text,
              text: initials,
              size: 32.0,
              imageUrl: imageUrl,
              backgroundColor: customColors?.primaryColorPrimary ?? Theme.of(context).colorScheme.primary,
              foregroundColor: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.57,
                    color: customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Tag(
                  text: role,
                  type: TagType.colorful,
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: customColors?.successColorSuccess ?? Theme.of(context).colorScheme.primary,
                border: Border.all(
                  color: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              status,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.57,
                color: customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}