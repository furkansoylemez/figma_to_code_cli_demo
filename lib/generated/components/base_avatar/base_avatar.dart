import 'package:flutter/material.dart';

enum AvatarType {
  image,
  icon,
  text,
}

enum AvatarSize {
  small,
  medium,
  large,
}

class BaseAvatar extends StatelessWidget {
  const BaseAvatar({
    super.key,
    required this.type,
    this.size = AvatarSize.medium,
    this.image,
    this.icon,
    this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.textStyle,
    this.iconSize,
    this.onTap,
    this.semanticLabel,
    this.width,
    this.height,
    this.padding,
  });

  final AvatarType type;
  final AvatarSize size;
  final ImageProvider? image;
  final IconData? icon;
  final String? text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? iconSize;
  final VoidCallback? onTap;
  final String? semanticLabel;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  double _getDefaultSize() {
    switch (size) {
      case AvatarSize.small:
        return 24.0;
      case AvatarSize.medium:
        return 32.0;
      case AvatarSize.large:
        return 48.0;
    }
  }

  double _getDefaultIconSize() {
    switch (size) {
      case AvatarSize.small:
        return 12.0;
      case AvatarSize.medium:
        return 16.0;
      case AvatarSize.large:
        return 24.0;
    }
  }

  EdgeInsetsGeometry _getDefaultPadding() {
    switch (size) {
      case AvatarSize.small:
        return const EdgeInsets.all(4.0);
      case AvatarSize.medium:
        return const EdgeInsets.all(8.0);
      case AvatarSize.large:
        return const EdgeInsets.all(12.0);
    }
  }

  TextStyle _getDefaultTextStyle(BuildContext context) {
    switch (size) {
      case AvatarSize.small:
        return Theme.of(context).textTheme.labelSmall ?? const TextStyle();
      case AvatarSize.medium:
        return Theme.of(context).textTheme.labelMedium ?? const TextStyle();
      case AvatarSize.large:
        return Theme.of(context).textTheme.labelLarge ?? const TextStyle();
    }
  }

  Widget _buildContent(BuildContext context) {
    final effectiveForegroundColor = foregroundColor ?? 
        Theme.of(context).colorScheme.onPrimary;

    switch (type) {
      case AvatarType.image:
        if (image != null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(
              borderRadius ?? _getDefaultSize() / 2,
            ),
            child: Image(
              image: image!,
              width: width ?? _getDefaultSize(),
              height: height ?? _getDefaultSize(),
              fit: BoxFit.cover,
            ),
          );
        }
        return Icon(
          Icons.person,
          size: iconSize ?? _getDefaultIconSize(),
          color: effectiveForegroundColor,
        );

      case AvatarType.icon:
        return Icon(
          icon ?? Icons.person,
          size: iconSize ?? _getDefaultIconSize(),
          color: effectiveForegroundColor,
        );

      case AvatarType.text:
        return Text(
          text ?? '',
          style: (textStyle ?? _getDefaultTextStyle(context)).copyWith(
            color: effectiveForegroundColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveSize = width ?? height ?? _getDefaultSize();
    final effectiveBackgroundColor = backgroundColor ?? 
        (type == AvatarType.image 
            ? Theme.of(context).colorScheme.surface.withOpacity(0.25)
            : Theme.of(context).colorScheme.primary);
    final effectiveBorderRadius = borderRadius ?? effectiveSize / 2;
    final effectivePadding = padding ?? 
        (type == AvatarType.image ? EdgeInsets.zero : _getDefaultPadding());

    Widget avatar = Container(
      width: effectiveSize,
      height: effectiveSize,
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        border: borderWidth != null && borderWidth! > 0
            ? Border.all(
                width: borderWidth!,
                color: borderColor ?? Theme.of(context).colorScheme.outline,
              )
            : null,
      ),
      child: type == AvatarType.image 
          ? _buildContent(context)
          : Center(child: _buildContent(context)),
    );

    if (onTap != null) {
      avatar = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        child: avatar,
      );
    }

    if (semanticLabel != null) {
      avatar = Semantics(
        label: semanticLabel,
        button: onTap != null,
        child: avatar,
      );
    }

    return avatar;
  }
}