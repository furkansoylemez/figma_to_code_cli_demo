import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class YeniIfreBelirlemeScreen extends StatelessWidget {
  const YeniIfreBelirlemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 18,
                        height: 12,
                        child: Stack(
                          children: [
                            Container(
                              width: 18,
                              height: 12,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Positioned(
                              right: -1,
                              top: 3,
                              child: Container(
                                width: 2,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 2,
                              top: 2,
                              child: Container(
                                width: 12,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 16,
                        height: 12,
                        child: Stack(
                          children: [
                            Container(
                              width: 16,
                              height: 12,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Positioned(
                              left: 2,
                              top: 2,
                              child: Container(
                                width: 4,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 7,
                              top: 2,
                              child: Container(
                                width: 4,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 2,
                              top: 2,
                              child: Container(
                                width: 3,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Column(
                      children: [
                        Text(
                          "Yeni Şifre Oluşturuldu!",
                          style: Theme.of(
                            context,
                          ).extension<CustomTypography>()?.displayXsSemibold,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Şimdi daha güçlü bir yeni şifreniz var. Hesabınıza giriş yapmak için aşağıdaki butona tıklayın.",
                          style: Theme.of(context)
                              .extension<CustomTypography>()
                              ?.textSmRegular
                              ?.copyWith(
                                color: Theme.of(context)
                                    .extension<CustomColors>()
                                    ?.textColortextsecondary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).extension<CustomColors>()?.primaryColorprimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Giriş Yap",
                          style: Theme.of(context)
                              .extension<CustomTypography>()
                              ?.textMdSemibold
                              ?.copyWith(
                                color: Theme.of(context)
                                    .extension<CustomColors>()
                                    ?.textColortextlightsolid,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
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
