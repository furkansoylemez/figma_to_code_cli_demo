import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class Frame1Screen extends StatelessWidget {
  const Frame1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "08:15",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        size: 16,
                        color: Colors.black,
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16, color: Colors.black),
                      SizedBox(width: 4),
                      Container(
                        width: 24,
                        height: 12,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 18,
                            height: 8,
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check, size: 40, color: Colors.green),
                    ),
                    SizedBox(height: 32),
                    Column(
                      children: [
                        Text(
                          "Yeni Şifre Oluşturuldu!",
                          style: theme
                              .extension<CustomTypography>()
                              ?.displayXsSemibold,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Şimdi daha güçlü bir yeni şifreniz var. Hesabınıza giriş yapmak için bu yeni şifreyi kullanabilirsiniz.",
                          style: theme
                              .extension<CustomTypography>()
                              ?.textSmRegular
                              ?.copyWith(
                                color: theme
                                    .extension<CustomColors>()
                                    ?.textColortextsecondary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 48),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme
                              .extension<CustomColors>()
                              ?.primaryColorprimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Giriş Yap",
                          style: theme
                              .extension<CustomTypography>()
                              ?.textMdSemibold
                              ?.copyWith(
                                color: theme
                                    .extension<CustomColors>()
                                    ?.textColortextlightsolid,
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
