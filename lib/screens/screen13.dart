import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class RenimEriklerimScreen extends StatefulWidget {
  const RenimEriklerimScreen({Key? key}) : super(key: key);

  @override
  State<RenimEriklerimScreen> createState() => _RenimEriklerimScreenState();
}

class _RenimEriklerimScreenState extends State<RenimEriklerimScreen> {
  String selectedFilter = "Yetkinliğe göre filtrele";
  bool isDropdownOpen = false;

  final List<Map<String, dynamic>> learningItems = [
    {
      'title': 'Müşteri yolculuğu nedir?',
      'isCompleted': true,
      'hasVideo': true,
    },
    {
      'title': 'Müşteri yolculuğu deneyim...',
      'isCompleted': false,
      'hasVideo': true,
    },
    {
      'title': 'Tüketiciyi dinlemenin yol...',
      'isCompleted': false,
      'hasVideo': false,
    },
    {
      'title': 'Tüketiciyi dinlemenin yol...',
      'isCompleted': false,
      'hasVideo': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.extension<CustomColors>()?.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: theme.extension<CustomColors>()?.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Text(
                    "08:15",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        size: 16,
                        color: theme.extension<CustomColors>()?.gray800,
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.wifi,
                        size: 16,
                        color: theme.extension<CustomColors>()?.gray800,
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 24,
                        height: 12,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                theme.extension<CustomColors>()?.gray800 ??
                                Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 18,
                            height: 8,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: theme.extension<CustomColors>()?.gray800,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: theme
                        .extension<CustomColors>()
                        ?.iconColoriconsecondary,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Öğrenim İçeriklerim",
                      style: theme
                          .extension<CustomTypography>()
                          ?.textMdMedium
                          ?.copyWith(
                            color: theme
                                .extension<CustomColors>()
                                ?.primaryColorprimarytext,
                          ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: theme
                        .extension<CustomColors>()
                        ?.iconColoriconsecondary,
                    size: 24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sorulara başlamadan önce ...",
                      style: theme
                          .extension<CustomTypography>()
                          ?.textSmMedium
                          ?.copyWith(
                            color: theme
                                .extension<CustomColors>()
                                ?.textColortextsecondary,
                          ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDropdownOpen = !isDropdownOpen;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: theme
                              .extension<CustomColors>()
                              ?.backgroundColorbgbase,
                          border: Border.all(
                            color:
                                theme
                                    .extension<CustomColors>()
                                    ?.borderColorbordersecondary ??
                                Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                selectedFilter,
                                style: theme
                                    .extension<CustomTypography>()
                                    ?.textSmSemibold
                                    ?.copyWith(
                                      color: theme
                                          .extension<CustomColors>()
                                          ?.textColortext,
                                    ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: theme
                                  .extension<CustomColors>()
                                  ?.textColortext,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: ListView.separated(
                        itemCount: learningItems.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final item = learningItems[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                learningItems[index]['isCompleted'] =
                                    !learningItems[index]['isCompleted'];
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: item['isCompleted']
                                    ? theme
                                          .extension<CustomColors>()
                                          ?.successColorsuccessbg
                                    : theme
                                          .extension<CustomColors>()
                                          ?.backgroundColorbgcontainer,
                                border: Border.all(
                                  color:
                                      theme
                                          .extension<CustomColors>()
                                          ?.borderColorbordersecondary ??
                                      Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Stack(
                                      children: [
                                        if (item['hasVideo'])
                                          const Center(
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                          ),
                                        if (item['isCompleted'])
                                          Positioned(
                                            top: 4,
                                            right: 4,
                                            child: Container(
                                              width: 16,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                color: theme
                                                    .extension<CustomColors>()
                                                    ?.success100,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.check,
                                                color: theme
                                                    .extension<CustomColors>()
                                                    ?.success500,
                                                size: 12,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      item['title'],
                                      style: theme
                                          .extension<CustomTypography>()
                                          ?.textSmSemibold
                                          ?.copyWith(
                                            color: theme
                                                .extension<CustomColors>()
                                                ?.textColortext,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: theme
                                        .extension<CustomColors>()
                                        ?.iconColoriconsecondary,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
