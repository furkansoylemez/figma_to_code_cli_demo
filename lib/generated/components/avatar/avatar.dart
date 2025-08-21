import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

enum AvatarType { image, icon, text }

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.type,
    this.image,
    this.icon,
    this.text,
    this.size = 32.0,
    this.backgroundColor,
    this.foregroundColor,
  });

  final AvatarType type;
  final ImageProvider? image;
  final Widget? icon;
  final String? text;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    final effectiveBackgroundColor = backgroundColor ?? 
        (type == AvatarType.image 
            ? customColors?.textColorTextDisabled?.withOpacity(0.25) ?? Theme.of(context).colorScheme.surface
            : customColors?.primaryColorPrimary ?? Theme.of(context).colorScheme.primary);
    
    final effectiveForegroundColor = foregroundColor ?? 
        customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.onPrimary;

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      backgroundImage: type == AvatarType.image ? image : null,
      child: type == AvatarType.image ? null : _buildContent(),
    );
  }

  Widget? _buildContent() {
    switch (type) {
      case AvatarType.icon:
        return icon ?? const Icon(Icons.person, size: 16);
      case AvatarType.text:
        return Text(
          text ?? 'TW',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.67,
          ),
        );
      case AvatarType.image:
        return null;
    }
  }
}