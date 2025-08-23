import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class GeliImimYetkinlikScreen extends StatelessWidget {
  const GeliImimYetkinlikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).extension<CustomColors>()?.backgroundColorbgbase,
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).extension<CustomColors>()?.backgroundColorbgcontainer,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(
              context,
            ).extension<CustomColors>()?.iconColoriconsecondary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Gelişimim',
          style: Theme.of(context)
              .extension<CustomTypography>()
              ?.textMdMedium
              ?.copyWith(
                color: Theme.of(
                  context,
                ).extension<CustomColors>()?.primaryColorprimarytext,
              ),
        ),
        centerTitle: true,
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(right: 24),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildChartSection(context),
            const SizedBox(height: 16),
            _buildTabSection(context),
            const SizedBox(height: 16),
            _buildSkillCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildChartSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).extension<CustomColors>()?.backgroundColorbgcontainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildChart(context),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                'Talentspot uzmanlık seviyesi : ',
                style: Theme.of(context)
                    .extension<CustomTypography>()
                    ?.textSmRegular
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).extension<CustomColors>()?.textColortextsecondary,
                    ),
              ),
              Text(
                '24',
                style: Theme.of(context)
                    .extension<CustomTypography>()
                    ?.textSmMedium
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).extension<CustomColors>()?.textColortext,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildChartLegend(context),
        ],
      ),
    );
  }

  Widget _buildChart(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          _buildYAxisLabels(context),
          _buildXAxisLabels(context),
          _buildChartLines(context),
          _buildLegend(context),
        ],
      ),
    );
  }

  Widget _buildYAxisLabels(BuildContext context) {
    final labels = ['100', '80', '60', '40', '20', '0'];
    return Positioned(
      left: 0,
      top: 0,
      bottom: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: labels
            .map(
              (label) => Row(
                children: [
                  Text(
                    label,
                    style: Theme.of(context)
                        .extension<CustomTypography>()
                        ?.textXsRegular
                        ?.copyWith(
                          color: Theme.of(
                            context,
                          ).extension<CustomColors>()?.textColortextsecondary,
                        ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 4,
                    height: 1,
                    color: Theme.of(
                      context,
                    ).extension<CustomColors>()?.borderColorbordersecondary,
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildXAxisLabels(BuildContext context) {
    final months = ['Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz'];
    return Positioned(
      left: 40,
      right: 0,
      bottom: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: months
            .map(
              (month) => Text(
                month,
                style: Theme.of(context)
                    .extension<CustomTypography>()
                    ?.textXsRegular
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).extension<CustomColors>()?.textColortextsecondary,
                    ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildChartLines(BuildContext context) {
    return Positioned(
      left: 40,
      top: 20,
      right: 20,
      bottom: 40,
      child: CustomPaint(
        painter: ChartPainter(
          primaryColor:
              Theme.of(
                context,
              ).extension<CustomColors>()?.primaryColorprimary ??
              Colors.blue,
          warningColor:
              Theme.of(
                context,
              ).extension<CustomColors>()?.warningColorwarning ??
              Colors.orange,
        ),
      ),
    );
  }

  Widget _buildLegend(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 2,
                color: Theme.of(
                  context,
                ).extension<CustomColors>()?.primaryColorprimary,
              ),
              const SizedBox(width: 4),
              Text(
                'Benim gelişimim',
                style: Theme.of(context)
                    .extension<CustomTypography>()
                    ?.textXsRegular
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).extension<CustomColors>()?.textColortext,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 12,
                height: 2,
                color: Theme.of(
                  context,
                ).extension<CustomColors>()?.warningColorwarning,
              ),
              const SizedBox(width: 4),
              Text(
                'Takım gelişimi',
                style: Theme.of(context)
                    .extension<CustomTypography>()
                    ?.textXsRegular
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).extension<CustomColors>()?.textColortext,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartLegend(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  Theme.of(
                    context,
                  ).extension<CustomColors>()?.borderColorbordersecondary ??
                  Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              '1,000',
              style: Theme.of(
                context,
              ).extension<CustomTypography>()?.textXlSemibold,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLegendItem(
                context,
                'Genel durum',
                Theme.of(
                  context,
                ).extension<CustomColors>()?.primaryColorprimaryactive,
              ),
              _buildLegendItem(
                context,
                'Takımımın durumu',
                Theme.of(
                  context,
                ).extension<CustomColors>()?.primaryColorprimary,
              ),
              _buildLegendItem(
                context,
                'Benim durumum',
                Theme.of(
                  context,
                ).extension<CustomColors>()?.warningColorwarning,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(BuildContext context, String label, Color? color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context)
                .extension<CustomTypography>()
                ?.textSmRegular
                ?.copyWith(
                  color: Theme.of(
                    context,
                  ).extension<CustomColors>()?.textColortext,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildTab(context, 'Yetkinlik', true),
          _buildTab(context, 'Öğrenim içeriği', false),
          _buildTab(context, 'Sorular', false),
        ],
      ),
    );
  }

  Widget _buildTab(BuildContext context, String title, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(
                  context,
                ).extension<CustomColors>()?.backgroundColorbgbase
              : Theme.of(
                  context,
                ).extension<CustomColors>()?.backgroundColorbgcontainer,
          border: Border.all(
            color:
                Theme.of(
                  context,
                ).extension<CustomColors>()?.borderColorbordersecondary ??
                Colors.grey,
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .extension<CustomTypography>()
              ?.textSmMedium
              ?.copyWith(
                color: isSelected
                    ? Theme.of(context).extension<CustomColors>()?.textColortext
                    : Theme.of(
                        context,
                      ).extension<CustomColors>()?.textColortextdescription,
              ),
        ),
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).extension<CustomColors>()?.backgroundColorbgcontainer,
        border: Border.all(
          color:
              Theme.of(
                context,
              ).extension<CustomColors>()?.borderColorbordersecondary ??
              Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Giriş seviye Scrum',
                style: Theme.of(context)
                    .extension<CustomTypography>()
                    ?.textXsRegular
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).extension<CustomColors>()?.textColortext,
                    ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).extension<CustomColors>()?.successColorsuccessbg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'En Yüksek',
                  style: Theme.of(context)
                      .extension<CustomTypography>()
                      ?.textXsMedium
                      ?.copyWith(
                        color: Theme.of(
                          context,
                        ).extension<CustomColors>()?.successColorsuccess,
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
                    color: Theme.of(
                      context,
                    ).extension<CustomColors>()?.backgroundColorbgbase,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).extension<CustomColors>()?.successColorsuccess,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '70%',
                style: Theme.of(context)
                    .extension<CustomTypography>()
                    ?.textSmMedium
                    ?.copyWith(
                      color: Theme.of(
                        context,
                      ).extension<CustomColors>()?.textColortext,
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
    final paint1 = Paint()
      ..color = primaryColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final paint2 = Paint()
      ..color = warningColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path1 = Path();
    final path2 = Path();

    final points1 = [
      Offset(0, size.height * 0.8),
      Offset(size.width * 0.2, size.height * 0.6),
      Offset(size.width * 0.4, size.height * 0.4),
      Offset(size.width * 0.6, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.2),
      Offset(size.width, size.height * 0.1),
    ];

    final points2 = [
      Offset(0, size.height * 0.9),
      Offset(size.width * 0.2, size.height * 0.7),
      Offset(size.width * 0.4, size.height * 0.5),
      Offset(size.width * 0.6, size.height * 0.4),
      Offset(size.width * 0.8, size.height * 0.3),
      Offset(size.width, size.height * 0.2),
    ];

    path1.moveTo(points1[0].dx, points1[0].dy);
    for (int i = 1; i < points1.length; i++) {
      path1.lineTo(points1[i].dx, points1[i].dy);
    }

    path2.moveTo(points2[0].dx, points2[0].dy);
    for (int i = 1; i < points2.length; i++) {
      path2.lineTo(points2[i].dx, points2[i].dy);
    }

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);

    final dotPaint = Paint()..style = PaintingStyle.fill;

    for (final point in points1) {
      dotPaint.color = primaryColor;
      canvas.drawCircle(point, 3, dotPaint);
    }

    for (final point in points2) {
      dotPaint.color = warningColor;
      canvas.drawCircle(point, 3, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
