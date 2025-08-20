import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

enum TagType { colorful, close, addNew }

class Tag extends StatelessWidget {
  const Tag({
    super.key,
    required this.text,
    this.type = TagType.colorful,
    this.onTap,
    this.onClose,
  });

  final String text;
  final TagType type;
  final VoidCallback? onTap;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: type == TagType.colorful 
              ? (customColors?.fillColorFillQuaternary ?? Colors.black.withOpacity(0.02))
              : Colors.transparent,
          border: Border.all(
            color: customColors?.borderColorBorder ?? Colors.grey.shade300,
            strokeAlign: BorderSide.strokeAlignInside,
            style: type == TagType.addNew ? BorderStyle.none : BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: type == TagType.addNew 
            ? CustomPaint(
                painter: DashedBorderPainter(
                  color: customColors?.borderColorBorder ?? Colors.grey.shade300,
                  strokeWidth: 1,
                  dashArray: [2, 2],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: _buildContent(context, customColors),
              )
            : _buildContent(context, customColors),
      ),
    );
  }

  Widget _buildContent(BuildContext context, CustomColors? customColors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (type == TagType.addNew) ...[
            Icon(
              Icons.add,
              size: 12,
              color: (customColors?.colorIcon ?? Colors.black).withOpacity(0.45),
            ),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 20 / 12,
              color: (customColors?.textColorText ?? Colors.black).withOpacity(0.88),
            ),
          ),
          if (type == TagType.close) ...[
            const SizedBox(width: 4),
            GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close,
                size: 12,
                color: (customColors?.colorIcon ?? Colors.black).withOpacity(0.45),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final List<double> dashArray;
  final BorderRadius borderRadius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashArray,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();
    final rrect = borderRadius.toRRect(Rect.fromLTWH(0, 0, size.width, size.height));
    path.addRRect(rrect);

    _drawDashedPath(canvas, path, paint, dashArray);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint, List<double> dashArray) {
    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      double distance = 0;
      bool draw = true;
      while (distance < pathMetric.length) {
        final length = dashArray[draw ? 0 : 1];
        if (draw) {
          canvas.drawPath(
            pathMetric.extractPath(distance, distance + length),
            paint,
          );
        }
        distance += length;
        draw = !draw;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}