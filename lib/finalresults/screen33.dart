import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class GeliImimYetkinlikScreen33 extends StatefulWidget {
  const GeliImimYetkinlikScreen33({Key? key}) : super(key: key);

  @override
  State<GeliImimYetkinlikScreen33> createState() =>
      _GeliImimYetkinlikScreen33State();
}

class _GeliImimYetkinlikScreen33State extends State<GeliImimYetkinlikScreen33> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<CustomTypography>();
    final colors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      backgroundColor: colors?.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(colors, typography),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildChartSection(colors, typography),
                    const SizedBox(height: 16),
                    _buildDivider(colors),
                    const SizedBox(height: 16),
                    _buildGaugeSection(colors, typography),
                    const SizedBox(height: 16),
                    _buildDivider(colors),
                    const SizedBox(height: 16),
                    _buildTabSection(colors, typography),
                    const SizedBox(height: 16),
                    _buildSkillCard(colors, typography),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(CustomColors? colors, CustomTypography? typography) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.chevron_left,
            size: 24,
            color: colors?.iconColoriconsecondary,
          ),
          Text(
            'Gelişimim',
            style: typography?.textMdMedium?.copyWith(
              color: colors?.primaryColorprimarytext,
            ),
          ),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colors?.gray800 ?? Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection(
    CustomColors? colors,
    CustomTypography? typography,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors?.backgroundColorbgcontainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildChartLegend(colors, typography),
          const SizedBox(height: 16),
          _buildChart(colors, typography),
          const SizedBox(height: 16),
          _buildChartLabels(colors, typography),
          const SizedBox(height: 24),
          _buildTalentspotLevel(colors, typography),
        ],
      ),
    );
  }

  Widget _buildChartLegend(CustomColors? colors, CustomTypography? typography) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(
          'Benim gelişimim',
          colors?.primaryColorprimary,
          colors,
          typography,
        ),
        const SizedBox(width: 16),
        _buildLegendItem(
          'Takım gelişimi',
          colors?.warningColorwarning,
          colors,
          typography,
        ),
      ],
    );
  }

  Widget _buildLegendItem(
    String text,
    Color? color,
    CustomColors? colors,
    CustomTypography? typography,
  ) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: typography?.textXsRegular?.copyWith(
            color: colors?.textColortext,
          ),
        ),
      ],
    );
  }

  Widget _buildChart(CustomColors? colors, CustomTypography? typography) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          _buildChartGrid(colors, typography),
          _buildChartLines(colors),
          _buildChartPoints(colors),
        ],
      ),
    );
  }

  Widget _buildChartGrid(CustomColors? colors, CustomTypography? typography) {
    final labels = ['100', '80', '60', '40', '20', '0'];
    return Column(
      children: labels.map((label) {
        return Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 47,
                child: Text(
                  label,
                  style: typography?.textXsRegular?.copyWith(
                    color: colors?.textColortextsecondary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 1,
                  color: colors?.borderColorbordersecondary,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildChartLines(CustomColors? colors) {
    return CustomPaint(
      size: const Size(double.infinity, 200),
      painter: ChartPainter(
        primaryColor: colors?.primaryColorprimary ?? Colors.blue,
        warningColor: colors?.warningColorwarning ?? Colors.orange,
      ),
    );
  }

  Widget _buildChartPoints(CustomColors? colors) {
    final primaryPoints = [
      const Offset(64, 140),
      const Offset(130, 126),
      const Offset(181, 162),
      const Offset(235, 165),
      const Offset(289, 188),
      const Offset(347, 165),
    ];

    final warningPoints = [
      const Offset(64, 140),
      const Offset(129, 150),
      const Offset(185, 128),
      const Offset(235, 153),
      const Offset(288, 124),
      const Offset(349, 135),
    ];

    return Stack(
      children: [
        ...primaryPoints.map(
          (point) => Positioned(
            left: point.dx - 2.5,
            top: point.dy - 2.5,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: colors?.primaryColorprimary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors?.backgroundColorbgbase ?? Colors.white,
                ),
              ),
            ),
          ),
        ),
        ...warningPoints.map(
          (point) => Positioned(
            left: point.dx - 2.5,
            top: point.dy - 2.5,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: colors?.warningColorwarning,
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors?.backgroundColorbgbase ?? Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChartLabels(CustomColors? colors, CustomTypography? typography) {
    final months = ['Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz'];
    return Row(
      children: [
        const SizedBox(width: 55),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: months
                .map(
                  (month) => Text(
                    month,
                    style: typography?.textXsRegular?.copyWith(
                      color: colors?.textColortextsecondary,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTalentspotLevel(
    CustomColors? colors,
    CustomTypography? typography,
  ) {
    return Row(
      children: [
        Text(
          'Talentspot uzmanlık seviyesi : ',
          style: typography?.textSmRegular?.copyWith(
            color: colors?.textColortextsecondary,
          ),
        ),
        Text(
          '24',
          style: typography?.textSmRegular?.copyWith(
            color: colors?.textColortext,
          ),
        ),
      ],
    );
  }

  Widget _buildGaugeSection(
    CustomColors? colors,
    CustomTypography? typography,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 39),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildGaugeChart(colors),
          const SizedBox(width: 16),
          _buildGaugeLegend(colors, typography),
        ],
      ),
    );
  }

  Widget _buildGaugeChart(CustomColors? colors) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 152,
            height: 152,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors?.primaryColorprimarybg,
            ),
          ),
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors?.primaryColorprimarybg,
            ),
          ),
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors?.primaryColorprimarybg,
            ),
          ),
          CustomPaint(
            size: const Size(160, 160),
            painter: GaugePainter(
              primaryColor: colors?.primaryColorprimary ?? Colors.blue,
              primaryActiveColor:
                  colors?.primaryColorprimaryactive ?? Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGaugeLegend(CustomColors? colors, CustomTypography? typography) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGaugeLegendItem(
          'Genel durum',
          colors?.primaryColorprimaryactive,
          colors,
          typography,
        ),
        const SizedBox(height: 4),
        _buildGaugeLegendItem(
          'Takımımın durumu',
          colors?.primaryColorprimary,
          colors,
          typography,
        ),
        const SizedBox(height: 4),
        _buildGaugeLegendItem('Benim durumum', Colors.grey, colors, typography),
      ],
    );
  }

  Widget _buildGaugeLegendItem(
    String text,
    Color? dotColor,
    CustomColors? colors,
    CustomTypography? typography,
  ) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: typography?.textSmRegular?.copyWith(
            color: colors?.textColortext,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(CustomColors? colors) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: 1,
      color: colors?.gray100,
    );
  }

  Widget _buildTabSection(CustomColors? colors, CustomTypography? typography) {
    final tabs = ['Yetkinlik', 'Öğrenim içeriği', 'Sorular'];

    return Row(
      children: tabs.asMap().entries.map((entry) {
        final index = entry.key;
        final tab = entry.value;
        final isSelected = selectedTabIndex == index;

        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => selectedTabIndex = index),
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: isSelected ? colors?.backgroundColorbgbase : null,
                border: Border.all(
                  color:
                      colors?.borderColorbordersecondary ??
                      Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  tab,
                  style: typography?.textSmMedium?.copyWith(
                    color: isSelected
                        ? colors?.textColortext
                        : colors?.textColortextdescription,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSkillCard(CustomColors? colors, CustomTypography? typography) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors?.backgroundColorbgcontainer,
        border: Border.all(
          color: colors?.borderColorbordersecondary ?? Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Giriş seviye Scrum',
                  style: typography?.textXsRegular?.copyWith(
                    color: colors?.textColortext,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colors?.successColorsuccessbg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'En Yüksek',
                  style: typography?.textXsMedium?.copyWith(
                    color: colors?.successColorsuccess,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: colors?.backgroundColorbgbase,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors?.successColorsuccess,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '70%',
                style: typography?.textSmMedium?.copyWith(
                  color: colors?.textColortext,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  final Color primaryColor;
  final Color warningColor;

  ChartPainter({required this.primaryColor, required this.warningColor});

  @override
  void paint(Canvas canvas, Size size) {
    final primaryPaint = Paint()
      ..color = primaryColor.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final warningPaint = Paint()
      ..color = warningColor.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final primaryPath = Path();
    final warningPath = Path();

    final primaryPoints = [
      Offset(size.width * 0.2, size.height * 0.7),
      Offset(size.width * 0.35, size.height * 0.63),
      Offset(size.width * 0.5, size.height * 0.81),
      Offset(size.width * 0.65, size.height * 0.825),
      Offset(size.width * 0.8, size.height * 0.94),
      Offset(size.width * 0.95, size.height * 0.825),
    ];

    final warningPoints = [
      Offset(size.width * 0.2, size.height * 0.7),
      Offset(size.width * 0.35, size.height * 0.75),
      Offset(size.width * 0.5, size.height * 0.64),
      Offset(size.width * 0.65, size.height * 0.765),
      Offset(size.width * 0.8, size.height * 0.62),
      Offset(size.width * 0.95, size.height * 0.675),
    ];

    primaryPath.moveTo(primaryPoints.first.dx, size.height);
    for (final point in primaryPoints) {
      primaryPath.lineTo(point.dx, point.dy);
    }
    primaryPath.lineTo(primaryPoints.last.dx, size.height);
    primaryPath.close();

    warningPath.moveTo(warningPoints.first.dx, size.height);
    for (final point in warningPoints) {
      warningPath.lineTo(point.dx, point.dy);
    }
    warningPath.lineTo(warningPoints.last.dx, size.height);
    warningPath.close();

    canvas.drawPath(primaryPath, primaryPaint);
    canvas.drawPath(warningPath, warningPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class GaugePainter extends CustomPainter {
  final Color primaryColor;
  final Color primaryActiveColor;

  GaugePainter({required this.primaryColor, required this.primaryActiveColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final outerPaint = Paint()
      ..color = primaryActiveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    final middlePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 70),
      -3.14159,
      3.14159 * 0.7,
      false,
      outerPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 58),
      -3.14159,
      3.14159 * 0.8,
      false,
      middlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
