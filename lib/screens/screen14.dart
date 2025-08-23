import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GeliImimYetkinlikScreen extends StatelessWidget {
  const GeliImimYetkinlikScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    final typography = Theme.of(context).extension<CustomTypography>()!;

    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        backgroundColor: colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: colors.iconColoriconsecondary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Gelişimim',
          style: typography.textMdMedium?.copyWith(
            color: colors.primaryColorprimarytext,
          ),
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colors.borderColorbordersecondary!),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.backgroundColorbgcontainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildAreaChart(colors, typography),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Talentspot uzmanlık seviy...',
                              style: typography.textSmRegular?.copyWith(
                                color: colors.textColortextsecondary,
                              ),
                            ),
                            Text(
                              '24',
                              style: typography.textXlSemibold?.copyWith(
                                color: colors.textColortext,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildGaugeChart(colors, typography),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildTabBar(colors, typography),
            const SizedBox(height: 16),
            _buildSkillCard(colors, typography),
          ],
        ),
      ),
    );
  }

  Widget _buildAreaChart(CustomColors colors, CustomTypography typography) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          _buildChartLegend(colors, typography),
          const SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: colors.borderColorbordersecondary!,
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
                          style: typography.textXsRegular?.copyWith(
                            color: colors.textColortextsecondary,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final months = [
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
                            style: typography.textXsRegular?.copyWith(
                              color: colors.textColortextsecondary,
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
                      FlSpot(0, 30),
                      FlSpot(1, 45),
                      FlSpot(2, 60),
                      FlSpot(3, 55),
                      FlSpot(4, 70),
                      FlSpot(5, 80),
                    ],
                    isCurved: true,
                    color: colors.primaryColorprimary,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: colors.primaryColorprimary!.withOpacity(0.1),
                    ),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 20),
                      FlSpot(1, 35),
                      FlSpot(2, 50),
                      FlSpot(3, 45),
                      FlSpot(4, 60),
                      FlSpot(5, 65),
                    ],
                    isCurved: true,
                    color: colors.warningColorwarning,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: colors.warningColorwarning!.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartLegend(CustomColors colors, CustomTypography typography) {
    return Row(
      children: [
        _buildLegendItem(
          colors,
          typography,
          colors.primaryColorprimary!,
          'Benim gelişimim',
        ),
        const SizedBox(width: 24),
        _buildLegendItem(
          colors,
          typography,
          colors.warningColorwarning!,
          'Takım gelişimi',
        ),
      ],
    );
  }

  Widget _buildLegendItem(
    CustomColors colors,
    CustomTypography typography,
    Color color,
    String label,
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
        const SizedBox(width: 8),
        Text(
          label,
          style: typography.textSmRegular?.copyWith(
            color: colors.textColortext,
          ),
        ),
      ],
    );
  }

  Widget _buildGaugeChart(CustomColors colors, CustomTypography typography) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: 0.8,
                  strokeWidth: 8,
                  backgroundColor: colors.primaryColorprimarybg,
                  valueColor: AlwaysStoppedAnimation(
                    colors.primaryColorprimaryactive!,
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: 0.6,
                  strokeWidth: 8,
                  backgroundColor: colors.primaryColorprimarybg,
                  valueColor: AlwaysStoppedAnimation(
                    colors.primaryColorprimary!,
                  ),
                ),
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: 0.4,
                  strokeWidth: 8,
                  backgroundColor: colors.primaryColorprimarybg,
                  valueColor: const AlwaysStoppedAnimation(Colors.grey),
                ),
              ),
              Text(
                '1,000',
                style: typography.textXlSemibold?.copyWith(
                  color: colors.gray900,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGaugeLegendItem(
              colors,
              typography,
              colors.primaryColorprimaryactive!,
              'Genel durum',
            ),
            _buildGaugeLegendItem(
              colors,
              typography,
              colors.primaryColorprimary!,
              'Takımımın durumu',
            ),
            _buildGaugeLegendItem(
              colors,
              typography,
              Colors.grey,
              'Benim durumum',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGaugeLegendItem(
    CustomColors colors,
    CustomTypography typography,
    Color color,
    String label,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: typography.textSmRegular?.copyWith(
              color: colors.textColortext,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(CustomColors colors, CustomTypography typography) {
    return Row(
      children: [
        _buildTab(colors, typography, 'Yetkinlik', true),
        _buildTab(colors, typography, 'Öğrenim içeriği', false),
        _buildTab(colors, typography, 'Sorular', false),
      ],
    );
  }

  Widget _buildTab(
    CustomColors colors,
    CustomTypography typography,
    String title,
    bool isSelected,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? colors.backgroundColorbgbase : Colors.transparent,
          border: Border.all(color: colors.borderColorbordersecondary!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: typography.textSmMedium?.copyWith(
            color: isSelected
                ? colors.textColortext
                : colors.textColortextdescription,
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCard(CustomColors colors, CustomTypography typography) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.backgroundColorbgcontainer,
        border: Border.all(color: colors.borderColorbordersecondary!),
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
                  style: typography.textXsRegular?.copyWith(
                    color: colors.textColortext,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colors.successColorsuccessbg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'En Yüksek',
                  style: typography.textXsMedium?.copyWith(
                    color: colors.successColorsuccess,
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
                    color: colors.backgroundColorbgbase,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors.successColorsuccess,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '70%',
                style: typography.textSmMedium?.copyWith(
                  color: colors.textColortext,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
