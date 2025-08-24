import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class YeniIfreBelirlemeScreen extends StatefulWidget {
  const YeniIfreBelirlemeScreen({Key? key}) : super(key: key);

  @override
  State<YeniIfreBelirlemeScreen> createState() =>
      _YeniIfreBelirlemeScreenState();
}

class _YeniIfreBelirlemeScreenState extends State<YeniIfreBelirlemeScreen> {
  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<CustomTypography>();
    final colors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      backgroundColor: colors?.blueGray100,
      body: SafeArea(
        child: Container(
          color: colors?.white,
          child: Column(
            children: [
              _buildStatusBar(colors, typography),
              Expanded(child: _buildContent(colors, typography)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar(CustomColors? colors, CustomTypography? typography) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "08:15",
            style: typography?.textSmRegular?.copyWith(color: colors?.gray800),
          ),
          Row(
            children: [
              Icon(
                Icons.signal_cellular_4_bar,
                size: 16,
                color: colors?.gray800,
              ),
              const SizedBox(width: 4),
              Icon(Icons.wifi, size: 16, color: colors?.gray800),
              const SizedBox(width: 4),
              Icon(Icons.battery_full, size: 16, color: colors?.gray800),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(CustomColors? colors, CustomTypography? typography) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          _buildSuccessIcon(colors),
          const SizedBox(height: 32),
          _buildHeader(colors, typography),
          const Spacer(),
          _buildActions(colors, typography),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSuccessIcon(CustomColors? colors) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: colors?.success100,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.check, size: 40, color: colors?.success500),
    );
  }

  Widget _buildHeader(CustomColors? colors, CustomTypography? typography) {
    return Column(
      children: [
        Text(
          "Yeni Şifre Oluşturuldu!",
          style: typography?.displayXsSemibold?.copyWith(
            color: colors?.gray900,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          "Şimdi daha güçlü bir yeni şifreniz var. Giriş yapmak için devam edin.",
          style: typography?.textSmRegular?.copyWith(
            color: colors?.textColortextsecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActions(CustomColors? colors, CustomTypography? typography) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colors?.primaryColorprimary,
          foregroundColor: colors?.textColortextlightsolid,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Text(
          "Giriş Yap",
          style: typography?.textMdSemibold?.copyWith(
            color: colors?.textColortextlightsolid,
          ),
        ),
      ),
    );
  }
}
