import 'package:figma_to_code_light/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class DevelopmentScreen extends StatefulWidget {
  @override
  _DevelopmentScreenState createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  int selectedTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      backgroundColor: customColors?.backgroundColorBgBase,
      appBar: AppBar(
        backgroundColor: customColors?.backgroundColorBgBase,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: customColors?.primaryColorPrimary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Gelişimim',
          style: TextStyle(
            color: customColors?.primaryColorPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DevelopmentChart(),
              SizedBox(height: 32),
              Text(
                'Talentspot uzmanlık seviyesi : 24',
                style: TextStyle(
                  color: customColors?.textColorTextSecondary,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),
              CircularProgressChart(),
              SizedBox(height: 32),
              TabSection(
                selectedIndex: selectedTabIndex,
                onTabChanged: (index) =>
                    setState(() => selectedTabIndex = index),
              ),
              SizedBox(height: 20),
              SkillProgressCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class DevelopmentChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Container(
      height: 280,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendItem(
                color: customColors?.primaryColorPrimary ?? Colors.purple,
                label: 'Benim gelişimim',
              ),
              SizedBox(width: 24),
              LegendItem(
                color: customColors?.warningColorWarning ?? Colors.orange,
                label: 'Takım gelişimi',
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: CustomPaint(
              painter: LineChartPainter(customColors),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).extension<CustomColors>()?.textColorText,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class LineChartPainter extends CustomPainter {
  final CustomColors? customColors;

  LineChartPainter(this.customColors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = customColors?.primaryColorPrimary ?? Colors.purple
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final paint2 = Paint()
      ..color = customColors?.warningColorWarning ?? Colors.orange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final pointPaint1 = Paint()
      ..color = customColors?.primaryColorPrimary ?? Colors.purple
      ..style = PaintingStyle.fill;

    final pointPaint2 = Paint()
      ..color = customColors?.warningColorWarning ?? Colors.orange
      ..style = PaintingStyle.fill;

    final months = ['Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz'];
    final myProgress = [5.0, 50.0, 40.0, 28.0, 12.0, 25.0];
    final teamProgress = [40.0, 35.0, 48.0, 33.0, 50.0, 43.0];

    final stepX = size.width / (months.length - 1);

    Path path1 = Path();
    Path path2 = Path();

    for (int i = 0; i < months.length; i++) {
      final x = i * stepX;
      final y1 = size.height - (myProgress[i] / 100 * size.height);
      final y2 = size.height - (teamProgress[i] / 100 * size.height);

      if (i == 0) {
        path1.moveTo(x, y1);
        path2.moveTo(x, y2);
      } else {
        path1.lineTo(x, y1);
        path2.lineTo(x, y2);
      }

      canvas.drawCircle(Offset(x, y1), 4, pointPaint1);
      canvas.drawCircle(Offset(x, y2), 4, pointPaint2);
    }

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CircularProgressChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: CircularChartPainter(customColors),
                size: Size(120, 120),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendItem(
              color:
                  customColors?.primaryColorPrimaryActive ?? Color(0xFF710BAE),
              label: 'Genel durum',
            ),
            SizedBox(height: 8),
            LegendItem(
              color: customColors?.primaryColorPrimary ?? Colors.purple,
              label: 'Takımımın durumu',
            ),
            SizedBox(height: 8),
            LegendItem(
              color: customColors?.primaryColorPrimaryBg ?? Color(0xFFF7E8FF),
              label: 'Benim durumum',
            ),
          ],
        ),
      ],
    );
  }
}

class CircularChartPainter extends CustomPainter {
  final CustomColors? customColors;

  CircularChartPainter(this.customColors);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    final paint1 = Paint()
      ..color = customColors?.primaryColorPrimaryActive ?? Color(0xFF710BAE)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paint2 = Paint()
      ..color = customColors?.primaryColorPrimary ?? Colors.purple
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paint3 = Paint()
      ..color = customColors?.primaryColorPrimaryBg ?? Color(0xFFF7E8FF)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708,
      4.7124,
      false,
      paint1,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 12),
      -1.5708,
      3.6652,
      false,
      paint2,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 24),
      -1.5708,
      2.094,
      false,
      paint3,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TabSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChanged;

  const TabSection({required this.selectedIndex, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final tabs = ['Yetkinlik', 'Öğrenim içeriği', 'Sorular'];

    return Container(
      decoration: BoxDecoration(
        color: customColors?.backgroundColorBgContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = index == selectedIndex;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? customColors?.primaryColorPrimaryBg
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tab,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected
                        ? customColors?.primaryColorPrimaryText
                        : customColors?.textColorTextSecondary,
                    fontSize: 14,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class SkillProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: customColors?.backgroundColorBgContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              customColors?.borderColorBorderSecondary ?? Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Giriş seviye Scrum',
                style: TextStyle(
                  color: customColors?.textColorText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: customColors?.successColorSuccessBg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'En Yüksek',
                  style: TextStyle(
                    color: customColors?.successColorSuccess,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: customColors?.borderColorBorderSecondary,
                  valueColor: AlwaysStoppedAnimation(
                    customColors?.successColorSuccess,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text(
                '70%',
                style: TextStyle(
                  color: customColors?.textColorText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
