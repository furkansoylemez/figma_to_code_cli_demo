import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GeliImimYetkinlikScreen extends StatelessWidget {
  const GeliImimYetkinlikScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.extension<CustomColors>()?.backgroundColorbgbase,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: theme
                    .extension<CustomColors>()
                    ?.backgroundColorbgcontainer,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '08:15',
                          style: theme
                              .extension<CustomTypography>()
                              ?.textXsRegular
                              ?.copyWith(
                                color: theme
                                    .extension<CustomColors>()
                                    ?.textColortext,
                              ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.signal_cellular_4_bar,
                              size: 16,
                              color: theme
                                  .extension<CustomColors>()
                                  ?.iconColoriconsecondary,
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.wifi,
                              size: 16,
                              color: theme
                                  .extension<CustomColors>()
                                  ?.iconColoriconsecondary,
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.battery_full,
                              size: 16,
                              color: theme
                                  .extension<CustomColors>()
                                  ?.iconColoriconsecondary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: theme
                              .extension<CustomColors>()
                              ?.iconColoriconsecondary,
                        ),
                        Text(
                          'Gelişimim',
                          style: theme
                              .extension<CustomTypography>()
                              ?.textMdMedium
                              ?.copyWith(
                                color: theme
                                    .extension<CustomColors>()
                                    ?.primaryColorprimarytext,
                              ),
                        ),
                        const SizedBox(width: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme
                            .extension<CustomColors>()
                            ?.backgroundColorbgcontainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 300,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: true,
                                  drawVerticalLine: false,
                                  horizontalInterval: 20,
                                  getDrawingHorizontalLine: (value) {
                                    return FlLine(
                                      color:
                                          theme
                                              .extension<CustomColors>()
                                              ?.borderColorbordersecondary ??
                                          Colors.grey,
                                      strokeWidth: 1,
                                    );
                                  },
                                ),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 20,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          value.toInt().toString(),
                                          style: theme
                                              .extension<CustomTypography>()
                                              ?.textXsRegular
                                              ?.copyWith(
                                                color: theme
                                                    .extension<CustomColors>()
                                                    ?.textColortextsecondary,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        const months = [
                                          'Şubat',
                                          'Mart',
                                          'Nisan',
                                          'Mayıs',
                                          'Haziran',
                                          'Temmuz',
                                        ];
                                        if (value.toInt() < months.length) {
                                          return Text(
                                            months[value.toInt()],
                                            style: theme
                                                .extension<CustomTypography>()
                                                ?.textXsRegular
                                                ?.copyWith(
                                                  color: theme
                                                      .extension<CustomColors>()
                                                      ?.textColortextsecondary,
                                                ),
                                          );
                                        }
                                        return const Text('');
                                      },
                                    ),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                ),
                                borderData: FlBorderData(show: false),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: const [
                                      FlSpot(0, 60),
                                      FlSpot(1, 70),
                                      FlSpot(2, 65),
                                      FlSpot(3, 80),
                                      FlSpot(4, 75),
                                      FlSpot(5, 85),
                                    ],
                                    isCurved: true,
                                    color: theme
                                        .extension<CustomColors>()
                                        ?.primaryColorprimary,
                                    barWidth: 3,
                                    dotData: const FlDotData(show: true),
                                  ),
                                  LineChartBarData(
                                    spots: const [
                                      FlSpot(0, 40),
                                      FlSpot(1, 50),
                                      FlSpot(2, 45),
                                      FlSpot(3, 60),
                                      FlSpot(4, 55),
                                      FlSpot(5, 65),
                                    ],
                                    isCurved: true,
                                    color: theme
                                        .extension<CustomColors>()
                                        ?.warningColorwarning,
                                    barWidth: 3,
                                    dotData: const FlDotData(show: true),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: theme
                                          .extension<CustomColors>()
                                          ?.primaryColorprimary,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Benim gelişimim',
                                    style: theme
                                        .extension<CustomTypography>()
                                        ?.textSmRegular
                                        ?.copyWith(
                                          color: theme
                                              .extension<CustomColors>()
                                              ?.textColortext,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: theme
                                          .extension<CustomColors>()
                                          ?.warningColorwarning,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            theme
                                                .extension<CustomColors>()
                                                ?.warningColorwarning ??
                                            Colors.orange,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Takım gelişimi',
                                    style: theme
                                        .extension<CustomTypography>()
                                        ?.textSmRegular
                                        ?.copyWith(
                                          color: theme
                                              .extension<CustomColors>()
                                              ?.textColortext,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'Talentspot uzmanlık seviyesi : ',
                          style: theme
                              .extension<CustomTypography>()
                              ?.textSmRegular
                              ?.copyWith(
                                color: theme
                                    .extension<CustomColors>()
                                    ?.textColortextsecondary,
                              ),
                        ),
                        Text(
                          '24',
                          style: theme
                              .extension<CustomTypography>()
                              ?.textSmMedium
                              ?.copyWith(
                                color: theme
                                    .extension<CustomColors>()
                                    ?.textColortext,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: theme
                                .extension<CustomColors>()
                                ?.primaryColorprimarybg,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                                  theme
                                      .extension<CustomColors>()
                                      ?.primaryColorprimaryactive ??
                                  Colors.blue,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '1,000',
                              style: theme
                                  .extension<CustomTypography>()
                                  ?.textXlSemibold
                                  ?.copyWith(
                                    color: theme
                                        .extension<CustomColors>()
                                        ?.primaryColorprimary,
                                  ),
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
                                theme
                                        .extension<CustomColors>()
                                        ?.primaryColorprimaryactive ??
                                    Colors.blue,
                              ),
                              const SizedBox(height: 4),
                              _buildLegendItem(
                                context,
                                'Takımımın durumu',
                                theme
                                        .extension<CustomColors>()
                                        ?.primaryColorprimary ??
                                    Colors.blue,
                              ),
                              const SizedBox(height: 4),
                              _buildLegendItem(
                                context,
                                'Benim durumum',
                                Colors.purple,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: theme
                                  .extension<CustomColors>()
                                  ?.backgroundColorbgbase,
                              border: Border.all(
                                color:
                                    theme
                                        .extension<CustomColors>()
                                        ?.borderColorbordersecondary ??
                                    Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Yetkinlik',
                                style: theme
                                    .extension<CustomTypography>()
                                    ?.textSmMedium
                                    ?.copyWith(
                                      color: theme
                                          .extension<CustomColors>()
                                          ?.textColortext,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color:
                                    theme
                                        .extension<CustomColors>()
                                        ?.borderColorbordersecondary ??
                                    Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Öğrenim içeriği',
                                style: theme
                                    .extension<CustomTypography>()
                                    ?.textSmMedium
                                    ?.copyWith(
                                      color: theme
                                          .extension<CustomColors>()
                                          ?.textColortextdescription,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color:
                                    theme
                                        .extension<CustomColors>()
                                        ?.borderColorbordersecondary ??
                                    Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Sorular',
                                style: theme
                                    .extension<CustomTypography>()
                                    ?.textSmMedium
                                    ?.copyWith(
                                      color: theme
                                          .extension<CustomColors>()
                                          ?.textColortextdescription,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme
                            .extension<CustomColors>()
                            ?.backgroundColorbgcontainer,
                        border: Border.all(
                          color:
                              theme
                                  .extension<CustomColors>()
                                  ?.borderColorbordersecondary ??
                              Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Giriş seviye Scrum',
                                  style: theme
                                      .extension<CustomTypography>()
                                      ?.textXsRegular
                                      ?.copyWith(
                                        color: theme
                                            .extension<CustomColors>()
                                            ?.textColortext,
                                      ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: theme
                                      .extension<CustomColors>()
                                      ?.successColorsuccessbg,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'En Yüksek',
                                  style: theme
                                      .extension<CustomTypography>()
                                      ?.textXsMedium
                                      ?.copyWith(
                                        color: theme
                                            .extension<CustomColors>()
                                            ?.successColorsuccess,
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
                                    color: theme
                                        .extension<CustomColors>()
                                        ?.backgroundColorbgbase,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: FractionallySizedBox(
                                    alignment: Alignment.centerLeft,
                                    widthFactor: 0.7,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: theme
                                            .extension<CustomColors>()
                                            ?.successColorsuccess,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '70%',
                                style: theme
                                    .extension<CustomTypography>()
                                    ?.textSmMedium
                                    ?.copyWith(
                                      color: theme
                                          .extension<CustomColors>()
                                          ?.textColortext,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context, String label, Color color) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: theme.extension<CustomTypography>()?.textSmRegular?.copyWith(
            color: theme.extension<CustomColors>()?.textColortext,
          ),
        ),
      ],
    );
  }
}
