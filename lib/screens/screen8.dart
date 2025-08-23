import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class ParolamUnuttumScreen extends StatefulWidget {
  @override
  _ParolamUnuttumScreenState createState() => _ParolamUnuttumScreenState();
}

class _ParolamUnuttumScreenState extends State<ParolamUnuttumScreen> {
  List<String> codeDigits = ['0', '0', '0', '0'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("08:15"),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 5),
                            Container(
                              width: 17,
                              height: 10,
                              child: Stack(
                                children: [
                                  Container(
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
                                      width: 1,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.wifi, size: 15),
                            SizedBox(width: 5),
                            Icon(Icons.signal_cellular_4_bar, size: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.arrow_back, size: 24),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kodu gir",
                                      style: theme
                                          .extension<CustomTypography>()!
                                          .displayXsSemibold,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "E-posta adresine gönderdiğimiz...",
                                      style: theme
                                          .extension<CustomTypography>()!
                                          .textSmRegular
                                          .copyWith(
                                            color: theme
                                                .extension<CustomColors>()!
                                                .textColortextsecondary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(child: _buildCodeInput(0)),
                                          SizedBox(width: 8),
                                          Expanded(child: _buildCodeInput(1)),
                                          SizedBox(width: 8),
                                          Expanded(child: _buildCodeInput(2)),
                                          SizedBox(width: 8),
                                          Expanded(child: _buildCodeInput(3)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Container(
                                        width: double.infinity,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: theme
                                                .extension<CustomColors>()!
                                                .primaryColorprimary,
                                            border: Border.all(
                                              color: theme
                                                  .extension<CustomColors>()!
                                                  .primaryColorprimary,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.1,
                                                ),
                                                blurRadius: 1,
                                                offset: Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                          padding: EdgeInsets.all(18),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Devam Et",
                                                style: theme
                                                    .extension<
                                                      CustomTypography
                                                    >()!
                                                    .textMdSemibold
                                                    .copyWith(
                                                      color: theme
                                                          .extension<
                                                            CustomColors
                                                          >()!
                                                          .textColortextlightsolid,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeInput(int index) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          codeDigits[index] = (int.parse(codeDigits[index]) + 1).toString();
          if (int.parse(codeDigits[index]) > 9) {
            codeDigits[index] = '0';
          }
        });
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.extension<CustomColors>()!.textColortextlightsolid,
                border: Border.all(
                  color: theme
                      .extension<CustomColors>()!
                      .textColortextsecondary,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    codeDigits[index],
                    style: theme
                        .extension<CustomTypography>()!
                        .displaySmMedium
                        .copyWith(
                          color: theme
                              .extension<CustomColors>()!
                              .textColortextsecondary,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
