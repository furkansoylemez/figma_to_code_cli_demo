import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

enum AvatarType { image, icon, text }

class Avatar extends StatelessWidget {
  final AvatarType type;
  final String? imageUrl;
  final Widget? image;
  final IconData? icon;
  final String? text;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const Avatar({
    super.key,
    this.type = AvatarType.text,
    this.imageUrl,
    this.image,
    this.icon,
    this.text,
    this.size = 32.0,
    this.backgroundColor,
    this.foregroundColor,
  });

  const Avatar.image({
    super.key,
    required this.imageUrl,
    this.image,
    this.size = 32.0,
    this.backgroundColor,
    this.foregroundColor,
  }) : type = AvatarType.image,
       icon = null,
       text = null;

  const Avatar.icon({
    super.key,
    required this.icon,
    this.size = 32.0,
    this.backgroundColor,
    this.foregroundColor,
  }) : type = AvatarType.icon,
       imageUrl = null,
       image = null,
       text = null;

  const Avatar.text({
    super.key,
    required this.text,
    this.size = 32.0,
    this.backgroundColor,
    this.foregroundColor,
  }) : type = AvatarType.text,
       imageUrl = null,
       image = null,
       icon = null;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final theme = Theme.of(context);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _getBackgroundColor(customColors, theme),
      ),
      child: _buildContent(customColors, theme),
    );
  }

  Color _getBackgroundColor(CustomColors? customColors, ThemeData theme) {
    if (backgroundColor != null) return backgroundColor!;
    
    switch (type) {
      case AvatarType.image:
        return (customColors?.textColorTextDisabled ?? theme.colorScheme.onSurface).withOpacity(0.25);
      case AvatarType.icon:
      case AvatarType.text:
        return customColors?.primaryColorPrimary ?? theme.colorScheme.primary;
    }
  }

  Color _getForegroundColor(CustomColors? customColors, ThemeData theme) {
    if (foregroundColor != null) return foregroundColor!;
    return customColors?.backgroundColorBgContainer ?? theme.colorScheme.onPrimary;
  }

  Widget _buildContent(CustomColors? customColors, ThemeData theme) {
    switch (type) {
      case AvatarType.image:
        if (image != null) {
          return ClipOval(child: image!);
        }
        if (imageUrl != null) {
          return ClipOval(
            child: Image.network(
              imageUrl!,
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _buildFallback(customColors, theme),
            ),
          );
        }
        return _buildFallback(customColors, theme);
        
      case AvatarType.icon:
        return Icon(
          icon ?? Icons.person,
          size: size * 0.5,
          color: _getForegroundColor(customColors, theme),
        );
        
      case AvatarType.text:
        return Center(
          child: Text(
            text ?? '',
            style: TextStyle(
              fontSize: size * 0.375,
              fontWeight: FontWeight.w500,
              color: _getForegroundColor(customColors, theme),
            ),
          ),
        );
    }
  }

  Widget _buildFallback(CustomColors? customColors, ThemeData theme) {
    return Icon(
      Icons.person,
      size: size * 0.5,
      color: _getForegroundColor(customColors, theme),
    );
  }
}