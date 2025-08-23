import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class ParolamUnuttumScreen extends StatefulWidget {
  @override
  _ParolamUnuttumScreenState createState() => _ParolamUnuttumScreenState();
}

class _ParolamUnuttumScreenState extends State<ParolamUnuttumScreen> {
  List<String> code = ['', '', '', ''];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        child: Container(
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(1),
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
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      "Kodu gir",
                      style:
                          theme
                              .extension<CustomTypography>()
                              ?.displayXsSemibold ??
                          TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "E-posta adresine gönderdiğimiz 4 haneli kodu gir",
                      style:
                          theme
                              .extension<CustomTypography>()
                              ?.textSmRegular
                              ?.copyWith(
                                color: theme
                                    .extension<CustomColors>()
                                    ?.textColortextsecondary,
                              ) ??
                          TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    theme
                                        .extension<CustomColors>()
                                        ?.borderColorbordersecondary ??
                                    Colors.grey[300]!,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color:
                                  theme
                                      .extension<CustomColors>()
                                      ?.textColortextlightsolid ??
                                  Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                code[index].isEmpty ? "0" : code[index],
                                style:
                                    theme
                                        .extension<CustomTypography>()
                                        ?.displaySmMedium
                                        ?.copyWith(
                                          color: theme
                                              .extension<CustomColors>()
                                              ?.textColortextsecondary,
                                        ) ??
                                    TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey[600],
                                    ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              theme
                                  .extension<CustomColors>()
                                  ?.primaryColorprimary ??
                              Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Devam Et",
                          style:
                              theme
                                  .extension<CustomTypography>()
                                  ?.textMdSemibold
                                  ?.copyWith(
                                    color: theme
                                        .extension<CustomColors>()
                                        ?.textColortextlightsolid,
                                  ) ??
                              TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
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
