import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    final typography = Theme.of(context).extension<CustomTypography>()!;

    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colors.fillColorfill,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 120,
                          height: 6,
                          decoration: BoxDecoration(
                            color: colors.warningColorwarning,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "5/5",
                    style: typography.textSmMedium?.copyWith(
                      color: colors.textColortextlightsolid,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  children: [
                    _NotificationItem(
                      icon: Icons.access_time,
                      title: "Günlük Hatırlatmalar",
                      description: "Öğrenme serinle ilgili bi...",
                      colors: colors,
                      typography: typography,
                    ),
                    const SizedBox(height: 24),
                    _NotificationItem(
                      icon: Icons.emoji_events_outlined,
                      title: "Başarı Uyarıları",
                      description: "Kazanımlarını ve kilometr...",
                      colors: colors,
                      typography: typography,
                    ),
                    const SizedBox(height: 24),
                    _NotificationItem(
                      icon: Icons.star_outline,
                      title: "",
                      description: "",
                      colors: colors,
                      typography: typography,
                      showDots: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  Text(
                    "Günlük Görevlerini Kaçırm...",
                    style: typography.displayXsSemibold?.copyWith(
                      color: colors.textColortextlightsolid,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Bildirimleri etkinleştir,...",
                    style: typography.textMdMedium?.copyWith(
                      color: colors.textColortextlightsolid,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.backgroundColorbgbase,
                    foregroundColor: colors.textColortextbase,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Başla!",
                    style: typography.textMdSemibold?.copyWith(
                      color: colors.textColortextbase,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final CustomColors colors;
  final CustomTypography typography;
  final bool showDots;

  const _NotificationItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.colors,
    required this.typography,
    this.showDots = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.warning100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colors.avatarUserSquareMollieHallColorBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: colors.textColortextbase, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: showDots
                ? Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: colors.textColortextlightsolid,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: colors.textColortextlightsolid,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: colors.textColortextlightsolid,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: typography.textXlSemibold?.copyWith(
                          color: colors.textColortextlightsolid,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: typography.textMdRegular?.copyWith(
                          color: colors.textColortextlightsolid,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
