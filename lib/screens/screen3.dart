import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class GeliImimYetkinlikScreen extends StatelessWidget {
  const GeliImimYetkinlikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;
    final customTypography = theme.extension<CustomTypography>()!;

    return Scaffold(
      backgroundColor: customColors.backgroundColorbgbase,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: customColors.backgroundColorbgcontainer,
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
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('08:15', style: customTypography.textMdMedium),
                        Row(
                          children: [
                            Icon(
                              Icons.signal_cellular_4_bar,
                              size: 16,
                              color: customColors.iconColoriconsecondary,
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.wifi,
                              size: 16,
                              color: customColors.iconColoriconsecondary,
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.battery_full,
                              size: 16,
                              color: customColors.iconColoriconsecondary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: customColors.iconColoriconsecondary,
                        ),
                        Text(
                          'Gelişimim',
                          style: customTypography.textMdMedium.copyWith(
                            color: customColors.primaryColorprimarytext,
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
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: customColors.backgroundColorbgcontainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          _buildChart(context),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                'Talentspot uzmanlık seviyesi : ',
                                style: customTypography.textSmRegular.copyWith(
                                  color: customColors.textColortextsecondary,
                                ),
                              ),
                              Text(
                                '24',
                                style: customTypography.textSmMedium.copyWith(
                                  color: customColors.textColortext,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Divider(color: customColors.borderColorbordersecondary),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        _buildRadarChart(context),
                        SizedBox(width: 12),
                        Expanded(child: _buildLegend(context)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Divider(color: customColors.borderColorbordersecondary),
                    SizedBox(height: 12),
                    _buildTabBar(context),
                    SizedBox(height: 12),
                    _buildSkillCard(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChart(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final customTypography = Theme.of(context).extension<CustomTypography>()!;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: customColors.primaryColorprimary,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  'Benim gelişimim',
                  style: customTypography.textXsRegular.copyWith(
                    color: customColors.textColortext,
                  ),
                ),
              ],
            ),
            SizedBox(width: 12),
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: customColors.warningColorwarning,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 6),
                Text(
                  'Takım gelişimi',
                  style: customTypography.textXsRegular.copyWith(
                    color: customColors.textColortext,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildYAxisLabel(context, '100'),
                  _buildYAxisLabel(context, '80'),
                  _buildYAxisLabel(context, '60'),
                  _buildYAxisLabel(context, '40'),
                  _buildYAxisLabel(context, '20'),
                  _buildYAxisLabel(context, '0'),
                ],
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildBar(context, 0.6, 0.4),
                          _buildBar(context, 0.8, 0.6),
                          _buildBar(context, 0.7, 0.5),
                          _buildBar(context, 0.9, 0.7),
                          _buildBar(context, 0.5, 0.3),
                          _buildBar(context, 0.6, 0.4),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildXAxisLabel(context, 'Şubat'),
                        _buildXAxisLabel(context, 'Mart'),
                        _buildXAxisLabel(context, 'Nisan'),
                        _buildXAxisLabel(context, 'Mayıs'),
                        _buildXAxisLabel(context, 'Haziran'),
                        _buildXAxisLabel(context, 'Temmuz'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildYAxisLabel(BuildContext context, String label) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final customTypography = Theme.of(context).extension<CustomTypography>()!;

    return Text(
      label,
      style: customTypography.textXsRegular.copyWith(
        color: customColors.textColortextsecondary,
      ),
    );
  }

  Widget _buildXAxisLabel(BuildContext context, String label) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final customTypography = Theme.of(context).extension<CustomTypography>()!;

    return Text(
      label,
      style: customTypography.textXsRegular.copyWith(
        color: customColors.textColortextsecondary,
      ),
    );
  }

  Widget _buildBar(
    BuildContext context,
    double primaryHeight,
    double warningHeight,
  ) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return SizedBox(
      width: 20,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: primaryHeight * 150,
            width: 8,
            decoration: BoxDecoration(
              color: customColors.primaryColorprimary,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: warningHeight * 150,
              width: 8,
              decoration: BoxDecoration(
                color: customColors.warningColorwarning,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadarChart(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(
            context,
          ).extension<CustomColors>()!.borderColorbordersecondary,
        ),
      ),
      child: Center(
        child: Text(
          '1,000',
          style: Theme.of(
            context,
          ).extension<CustomTypography>()!.textXlSemibold,
        ),
      ),
    );
  }

  Widget _buildLegend(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final customTypography = Theme.of(context).extension<CustomTypography>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLegendItem(
          context,
          customColors.primaryColorprimaryactive,
          'Genel durum',
        ),
        SizedBox(height: 6),
        _buildLegendItem(
          context,
          customColors.primaryColorprimary,
          'Takımımın durumu',
        ),
        SizedBox(height: 6),
        _buildLegendItem(
          context,
          customColors.successColorsuccess,
          'Benim durumum',
        ),
      ],
    );
  }

  Widget _buildLegendItem(BuildContext context, Color color, String label) {
    final customTypography = Theme.of(context).extension<CustomTypography>()!;
    final customColors = Theme.of(context).extension<CustomColors>()!;

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
          style: customTypography.textSmRegular.copyWith(
            color: customColors.textColortext,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final customTypography = Theme.of(context).extension<CustomTypography>()!;

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: customColors.backgroundColorbgcontainer,
              border: Border.all(
                color: customColors.borderColorbordersecondary,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Yetkinlik',
                style: customTypography.textSmMedium.copyWith(
                  color: customColors.textColortext,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: customColors.backgroundColorbgbase,
              border: Border.all(
                color: customColors.borderColorbordersecondary,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Öğrenim içeriği',
                style: customTypography.textSmMedium.copyWith(
                  color: customColors.textColortextdescription,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: customColors.backgroundColorbgbase,
              border: Border.all(
                color: customColors.borderColorbordersecondary,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Sorular',
                style: customTypography.textSmMedium.copyWith(
                  color: customColors.textColortextdescription,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillCard(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final customTypography = Theme.of(context).extension<CustomTypography>()!;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: customColors.backgroundColorbgcontainer,
        border: Border.all(color: customColors.borderColorbordersecondary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Giriş seviye Scrum',
                style: customTypography.textXsRegular.copyWith(
                  color: customColors.textColortext,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: customColors.successColorsuccessbg,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'En Yüksek',
                  style: customTypography.textXsMedium.copyWith(
                    color: customColors.successColorsuccess,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: customColors.backgroundColorbgbase,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                        color: customColors.successColorsuccess,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                '70%',
                style: customTypography.textSmMedium.copyWith(
                  color: customColors.textColortext,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
