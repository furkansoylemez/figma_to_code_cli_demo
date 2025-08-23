import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class RenimEriklerimScreen extends StatelessWidget {
  const RenimEriklerimScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    final typography = Theme.of(context).extension<CustomTypography>()!;

    return Scaffold(
      backgroundColor: colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "08:15",
                    style: typography.textMdMedium?.copyWith(
                      color: colors.gray800,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        size: 16,
                        color: colors.gray800,
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16, color: colors.gray800),
                      const SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 16, color: colors.gray800),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: colors.iconColoriconsecondary,
                    size: 24,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Öğrenim İçeriklerim",
                        style: typography.textMdMedium?.copyWith(
                          color: colors.primaryColorprimarytext,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: colors.iconColoriconsecondary,
                    size: 24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colors.brand50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.brand50,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "DAILY SCRUM",
                                  style: typography.textXsMedium?.copyWith(
                                    color: colors.brand700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "Günlük Koordinasyon",
                                  style: typography.textXsMedium?.copyWith(
                                    color: colors.brand700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "15 Dakika, 3 Soru, Tam Se...",
                            style: typography.textMdMedium?.copyWith(
                              color: colors.textColortext,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Daily Scrum, ekibin ilerl...",
                            style: typography.textSmMedium?.copyWith(
                              color: colors.textColortextsecondary,
                            ),
                          ),
                          const SizedBox(height: 16),
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
}
