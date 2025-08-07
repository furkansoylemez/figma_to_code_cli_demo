import 'package:flutter/material.dart';

enum AvatarType { image, icon, text }

enum AvatarSize { small, medium, large }

class BaseAvatar extends StatelessWidget {
  /// The type of avatar content to display
  final AvatarType type;
  
  /// The size of the avatar
  final AvatarSize size;
  
  /// Custom diameter for the avatar. Overrides size if provided
  final double? diameter;
  
  /// Background color of the avatar
  final Color? backgroundColor;
  
  /// Text color for text and icon avatars
  final Color? textColor;
  
  /// Icon color for icon avatars
  final Color? iconColor;
  
  /// Image provider for image avatars
  final ImageProvider? imageProvider;
  
  /// Fallback image provider if main image fails to load
  final ImageProvider? fallbackImageProvider;
  
  /// Icon to display for icon avatars
  final IconData? icon;
  
  /// Text to display for text avatars
  final String? text;
  
  /// Text style for text avatars
  final TextStyle? textStyle;
  
  /// Icon size for icon avatars
  final double? iconSize;
  
  /// Border radius of the avatar
  final double? borderRadius;
  
  /// Border color of the avatar
  final Color? borderColor;
  
  /// Border width of the avatar
  final double borderWidth;
  
  /// Callback when avatar is tapped
  final VoidCallback? onTap;
  
  /// Whether the avatar should respond to touches
  final bool enabled;
  
  /// Semantic label for accessibility
  final String? semanticLabel;

  const BaseAvatar({
    super.key,
    required this.type,
    this.size = AvatarSize.medium,
    this.diameter,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.imageProvider,
    this.fallbackImageProvider,
    this.icon,
    this.text,
    this.textStyle,
    this.iconSize,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 0,
    this.onTap,
    this.enabled = true,
    this.semanticLabel,
  });

  /// Factory constructor for image avatar
  factory BaseAvatar.image({
    Key? key,
    required ImageProvider imageProvider,
    ImageProvider? fallbackImageProvider,
    AvatarSize size = AvatarSize.medium,
    double? diameter,
    Color? backgroundColor,
    double? borderRadius,
    Color? borderColor,
    double borderWidth = 0,
    VoidCallback? onTap,
    bool enabled = true,
    String? semanticLabel,
  }) {
    return BaseAvatar(
      key: key,
      type: AvatarType.image,
      imageProvider: imageProvider,
      fallbackImageProvider: fallbackImageProvider,
      size: size,
      diameter: diameter,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      onTap: onTap,
      enabled: enabled,
      semanticLabel: semanticLabel,
    );
  }

  /// Factory constructor for icon avatar
  factory BaseAvatar.icon({
    Key? key,
    required IconData icon,
    AvatarSize size = AvatarSize.medium,
    double? diameter,
    Color? backgroundColor,
    Color? iconColor,
    double? iconSize,
    double? borderRadius,
    Color? borderColor,
    double borderWidth = 0,
    VoidCallback? onTap,
    bool enabled = true,
    String? semanticLabel,
  }) {
    return BaseAvatar(
      key: key,
      type: AvatarType.icon,
      icon: icon,
      size: size,
      diameter: diameter,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      iconSize: iconSize,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      onTap: onTap,
      enabled: enabled,
      semanticLabel: semanticLabel,
    );
  }

  /// Factory constructor for text avatar
  factory BaseAvatar.text({
    Key? key,
    required String text,
    AvatarSize size = AvatarSize.medium,
    double? diameter,
    Color? backgroundColor,
    Color? textColor,
    TextStyle? textStyle,
    double? borderRadius,
    Color? borderColor,
    double borderWidth = 0,
    VoidCallback? onTap,
    bool enabled = true,
    String? semanticLabel,
  }) {
    return BaseAvatar(
      key: key,
      type: AvatarType.text,
      text: text,
      size: size,
      diameter: diameter,
      backgroundColor: backgroundColor,
      textColor: textColor,
      textStyle: textStyle,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      onTap: onTap,
      enabled: enabled,
      semanticLabel: semanticLabel,
    );
  }

  double _getAvatarSize() {
    if (diameter != null) return diameter!;
    
    switch (size) {
      case AvatarSize.small:
        return 24;
      case AvatarSize.medium:
        return 32;
      case AvatarSize.large:
        return 48;
    }
  }

  double _getIconSize() {
    if (iconSize != null) return iconSize!;
    
    final avatarSize = _getAvatarSize();
    return avatarSize * 0.5;
  }

  TextStyle _getTextStyle(BuildContext context) {
    final theme = Theme.of(context);
    final avatarSize = _getAvatarSize();
    
    final baseStyle = avatarSize <= 24 
        ? theme.textTheme.labelSmall
        : avatarSize <= 32 
            ? theme.textTheme.labelMedium
            : theme.textTheme.labelLarge;
    
    return textStyle ?? baseStyle?.copyWith(
      color: textColor ?? theme.colorScheme.onPrimary,
      fontWeight: FontWeight.w500,
    ) ?? TextStyle(
      color: textColor ?? theme.colorScheme.onPrimary,
      fontSize: avatarSize * 0.375,
      fontWeight: FontWeight.w500,
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    final theme = Theme.of(context);
    
    switch (type) {
      case AvatarType.image:
        return backgroundColor ?? theme.colorScheme.surface.withOpacity(0.25);
      case AvatarType.icon:
      case AvatarType.text:
        return backgroundColor ?? theme.colorScheme.primary;
    }
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    final avatarSize = _getAvatarSize();
    
    switch (type) {
      case AvatarType.image:
        if (imageProvider == null) {
          return _buildFallbackContent(context);
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? avatarSize / 2),
          child: Image(
            image: imageProvider!,
            width: avatarSize,
            height: avatarSize,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              if (fallbackImageProvider != null) {
                return Image(
                  image: fallbackImageProvider!,
                  width: avatarSize,
                  height: avatarSize,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildFallbackContent(context);
                  },
                );
              }
              return _buildFallbackContent(context);
            },
          ),
        );
      
      case AvatarType.icon:
        if (icon == null) {
          return _buildFallbackContent(context);
        }
        return Icon(
          icon!,
          size: _getIconSize(),
          color: iconColor ?? theme.colorScheme.onPrimary,
        );
      
      case AvatarType.text:
        if (text == null || text!.isEmpty) {
          return _buildFallbackContent(context);
        }
        return Text(
          text!.length > 2 ? text!.substring(0, 2).toUpperCase() : text!.toUpperCase(),
          style: _getTextStyle(context),
          textAlign: TextAlign.center,
        );
    }
  }

  Widget _buildFallbackContent(BuildContext context) {
    final theme = Theme.of(context);
    return Icon(
      Icons.person,
      size: _getIconSize(),
      color: iconColor ?? textColor ?? theme.colorScheme.onSurface.withOpacity(0.6),
    );
  }

  @override
  Widget build(BuildContext context) {
    final avatarSize = _getAvatarSize();
    final effectiveBorderRadius = borderRadius ?? avatarSize / 2;
    
    Widget avatar = Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        border: borderWidth > 0 
            ? Border.all(
                color: borderColor ?? Theme.of(context).colorScheme.outline,
                width: borderWidth,
              )
            : null,
      ),
      child: Center(
        child: _buildContent(context),
      ),
    );

    if (onTap != null && enabled) {
      avatar = Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          onTap: onTap,
          child: avatar,
        ),
      );
    }

    if (semanticLabel != null) {
      avatar = Semantics(
        label: semanticLabel,
        child: avatar,
      );
    }

    return avatar;
  }
}