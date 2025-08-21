import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

enum TagType {
  colorful,
  close,
  addNew,
}

class Tag extends StatelessWidget {
  final String text;
  final TagType type;
  final VoidCallback? onTap;
  final VoidCallback? onClose;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const Tag({
    super.key,
    required this.text,
    this.type = TagType.colorful,
    this.onTap,
    this.onClose,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final colorScheme = Theme.of(context).colorScheme;
    
    final effectiveBackgroundColor = backgroundColor ??
        customColors?.fillColorFillQuaternary ??
        colorScheme.surfaceContainerHighest.withOpacity(0.02);
    
    final effectiveBorderColor = borderColor ??
        customColors?.borderColorBorder ??
        colorScheme.outline;
    
    final effectiveTextColor = textColor ??
        customColors?.textColorText ??
        colorScheme.onSurface.withOpacity(0.88);
    
    final iconColor = customColors?.colorIcon ?? 
        colorScheme.onSurface.withOpacity(0.45);

    final borderStyle = type == TagType.addNew
        ? BorderSide(
            color: effectiveBorderColor,
            width: 1.0,
            style: BorderStyle.solid,
          )
        : BorderSide(
            color: effectiveBorderColor,
            width: 1.0,
          );

    Widget content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
      decoration: BoxDecoration(
        color: type == TagType.addNew ? Colors.transparent : effectiveBackgroundColor,
        border: Border.fromBorderSide(borderStyle),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (type == TagType.addNew) ...[
            Icon(
              Icons.add,
              size: 12.0,
              color: iconColor,
            ),
            const SizedBox(width: 4.0),
          ],
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              height: 20.0 / 12.0,
              color: effectiveTextColor,
            ),
          ),
          if (type == TagType.close) ...[
            const SizedBox(width: 4.0),
            GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                size: 12.0,
                color: iconColor,
              ),
            ),
          ],
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }
}