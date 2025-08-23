import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class GiriYapScreen extends StatelessWidget {
  const GiriYapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;
    final customTypography = theme.extension<CustomTypography>()!;

    return Scaffold(
      backgroundColor: customColors.textColortextlightsolid,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '08:15',
                    style: customTypography.textMdSemibold?.copyWith(
                      color: customColors.textColortextbase,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        size: 16,
                        color: customColors.textColortextbase,
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.wifi,
                        size: 16,
                        color: customColors.textColortextbase,
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.battery_full,
                        size: 16,
                        color: customColors.textColortextbase,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: customColors.primaryColorprimary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.close,
                              size: 24,
                              color: customColors.textColortextbase,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Giriş yap!',
                                style: customTypography.displayXsSemibold
                                    ?.copyWith(
                                      color: customColors.textColortextbase,
                                    ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Kaldığın yerden devam et. Eğitimlerin, hedeflerin ve ekibin seni bekliyor.',
                                style: customTypography.textSmRegular?.copyWith(
                                  color: customColors.textColortextsecondary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Column(
                            children: [
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Parolamı unuttum',
                                      style: customTypography.textSmSemibold
                                          ?.copyWith(
                                            color: customColors
                                                .primaryColorprimary,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        customColors.primaryColorprimary,
                                    foregroundColor:
                                        customColors.textColortextlightsolid,
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 1,
                                  ),
                                  child: Text(
                                    'Giriş Yap',
                                    style: customTypography.textMdSemibold
                                        ?.copyWith(
                                          color: customColors
                                              .textColortextlightsolid,
                                        ),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
