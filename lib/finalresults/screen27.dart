import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GeliImimYetkinlikScreen extends StatefulWidget {
  @override
  _GeliImimYetkinlikScreenState createState() =>
      _GeliImimYetkinlikScreenState();
}

class _GeliImimYetkinlikScreenState extends State<GeliImimYetkinlikScreen> {
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
                    _buildDivider(colors),
                    _buildTabSection(colors, typography),
                    _buildContentSection(colors, typography),
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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left,
              color: colors?.iconColoriconsecondary,
              size: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Gelişimim',
                style: typography?.textMdMedium?.copyWith(
                  color: colors?.primaryColorprimarytext,
                ),
              ),
            ),
          ),
          Container(width: 24),
        ],
      ),
    );
  }

  Widget _buildChartSection(
    CustomColors? colors,
    CustomTypography? typography,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(flex: 2, child: _buildAreaChart(colors, typography)),
          SizedBox(width: 16),
          Expanded(flex: 1, child: _buildGaugeChart(colors, typography)),
        ],
      ),
    );
  }

  Widget _buildAreaChart(CustomColors? colors, CustomTypography? typography) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors?.backgroundColorbgcontainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Talentspot uzmanlık seviy...',
                style: TextStyle(
                  color: colors?.textColortextsecondary,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '24',
                style: TextStyle(
                  color: colors?.textColortext,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: colors?.borderColorbordersecondary,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: typography?.textXsRegular?.copyWith(
                          color: colors?.textColortextsecondary,
                        ),
                      ),
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
                            style: typography?.textXsRegular?.copyWith(
                              color: colors?.textColortextsecondary,
                            ),
                          );
                        }
                        return Text('');
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 40),
                      FlSpot(1, 60),
                      FlSpot(2, 45),
                      FlSpot(3, 70),
                      FlSpot(4, 55),
                      FlSpot(5, 80),
                    ],
                    isCurved: true,
                    color: colors?.primaryColorprimary,
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: true,
                      color: colors?.primaryColorprimary?.withOpacity(0.3),
                    ),
                  ),
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 30),
                      FlSpot(1, 50),
                      FlSpot(2, 35),
                      FlSpot(3, 60),
                      FlSpot(4, 45),
                      FlSpot(5, 65),
                    ],
                    isCurved: true,
                    color: colors?.warningColorwarning,
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: true,
                      color: colors?.warningColorwarning?.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _buildLegendItem(
                colors,
                'Benim gelişimim',
                colors?.primaryColorprimary,
              ),
              SizedBox(width: 16),
              _buildLegendItem(
                colors,
                'Takım gelişimi',
                colors?.warningColorwarning,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(CustomColors? colors, String text, Color? color) {
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
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: colors?.textColortext, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildGaugeChart(CustomColors? colors, CustomTypography? typography) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  value: 0.8,
                  strokeWidth: 8,
                  backgroundColor: colors?.primaryColorprimarybg,
                  valueColor: AlwaysStoppedAnimation(
                    colors?.primaryColorprimaryactive,
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: 0.6,
                  strokeWidth: 8,
                  backgroundColor: colors?.primaryColorprimarybg,
                  valueColor: AlwaysStoppedAnimation(
                    colors?.primaryColorprimary,
                  ),
                ),
              ),
              Container(
                width: 90,
                height: 90,
                child: CircularProgressIndicator(
                  value: 0.4,
                  strokeWidth: 8,
                  backgroundColor: colors?.primaryColorprimarybg,
                  valueColor: AlwaysStoppedAnimation(Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGaugeLegendItem(
              colors,
              typography,
              'Genel durum',
              colors?.primaryColorprimaryactive,
            ),
            SizedBox(height: 8),
            _buildGaugeLegendItem(
              colors,
              typography,
              'Takımımın durumu',
              colors?.primaryColorprimary,
            ),
            SizedBox(height: 8),
            _buildGaugeLegendItem(
              colors,
              typography,
              'Benim durumum',
              Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGaugeLegendItem(
    CustomColors? colors,
    CustomTypography? typography,
    String text,
    Color? color,
  ) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8),
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
      height: 1,
      color: colors?.borderColorbordersecondary,
      margin: EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildTabSection(CustomColors? colors, CustomTypography? typography) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          _buildTabItem(colors, typography, 'Yetkinlik', 0),
          _buildTabItem(colors, typography, 'Öğrenim içeriği', 1),
          _buildTabItem(colors, typography, 'Sorular', 2),
        ],
      ),
    );
  }

  Widget _buildTabItem(
    CustomColors? colors,
    CustomTypography? typography,
    String text,
    int index,
  ) {
    final isSelected = selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTabIndex = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? colors?.backgroundColorbgbase : null,
            border: Border.all(
              color: colors?.borderColorbordersecondary ?? Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
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
  }

  Widget _buildContentSection(
    CustomColors? colors,
    CustomTypography? typography,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(children: [_buildSkillCard(colors, typography)]),
    );
  }

  Widget _buildSkillCard(CustomColors? colors, CustomTypography? typography) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors?.backgroundColorbgcontainer,
        border: Border.all(
          color: colors?.borderColorbordersecondary ?? Colors.grey,
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
                style: typography?.textXsRegular?.copyWith(
                  color: colors?.textColortext,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          SizedBox(height: 12),
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
              SizedBox(width: 8),
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
