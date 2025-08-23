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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.extension<CustomColors>()!.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: theme.extension<CustomColors>()!.success100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        size: 40,
                        color: theme.extension<CustomColors>()!.success500,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Yeni Şifre Oluşturuldu!",
                      style: theme
                          .extension<CustomTypography>()!
                          .displayXsSemibold
                          .copyWith(
                            color: theme.extension<CustomColors>()!.gray900,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Şimdi daha güçlü bir yeni şifreniz var. Giriş yapmak için devam edin.",
                      style: theme
                          .extension<CustomTypography>()!
                          .textSmRegular
                          .copyWith(
                            color: theme
                                .extension<CustomColors>()!
                                .textColortextsecondary,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme
                              .extension<CustomColors>()!
                              .primaryColorprimary,
                          foregroundColor: theme
                              .extension<CustomColors>()!
                              .textColortextlightsolid,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Giriş Yap",
                          style: theme
                              .extension<CustomTypography>()!
                              .textMdSemibold
                              .copyWith(
                                color: theme
                                    .extension<CustomColors>()!
                                    .textColortextlightsolid,
                              ),
                        ),
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
