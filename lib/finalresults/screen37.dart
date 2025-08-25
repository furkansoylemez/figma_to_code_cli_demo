import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class AKlamaScreen extends StatefulWidget {
  const AKlamaScreen({Key? key}) : super(key: key);

  @override
  State<AKlamaScreen> createState() => _AKlamaScreenState();
}

class _AKlamaScreenState extends State<AKlamaScreen> {
  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<CustomTypography>();
    final colors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      backgroundColor: colors?.white,
      body: Column(
        children: [
          _buildHeader(typography, colors),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Container(
                    width: 159,
                    height: 159,
                    decoration: BoxDecoration(
                      color: colors?.backgroundColorbgcontainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.lightbulb_outline,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildContentSection(typography, colors),
                  const SizedBox(height: 24),
                  _buildFooterSection(typography, colors),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(CustomTypography? typography, CustomColors? colors) {
    return Container(
      color: colors?.backgroundColorbgbase,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("08:15", style: TextStyle(color: colors?.textColortext)),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        size: 17,
                        color: colors?.textColortext,
                      ),
                      const SizedBox(width: 5),
                      Icon(Icons.wifi, size: 15, color: colors?.textColortext),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.battery_full,
                        size: 24,
                        color: colors?.textColortext,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: colors?.iconColoriconsecondary,
                    ),
                  ),
                  Text(
                    "Açıklama",
                    style: typography?.textMdMedium?.copyWith(
                      color: colors?.primaryColorprimarytext,
                    ),
                  ),
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            colors?.borderColorbordersecondary ?? Colors.grey,
                      ),
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      size: 16,
                      color: colors?.iconColoriconsecondary,
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

  Widget _buildContentSection(
    CustomTypography? typography,
    CustomColors? colors,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mutsuz Müşteriler için Özel Yollar Belirlemek",
          style: typography?.textMdSemibold?.copyWith(
            color: colors?.textColortext,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Bir marka ile ilgili olumsuz bir kanınız varsa o marka sizi almaya istemediğiniz her ne yolla olursa olsun karar vermişse yaptığınız pazarlama yatırımı ile verdiğiniz mesajların dinlenmesi imkansızdır. Yani TV reklamını izlemeyen kanal değiştirir. Sosyal medya ve dijital kanallarda verdiğiniz reklamı hızla kapatır. Hatta daha da ileriye giderek negatif olumsuz marka hakkında konuşmaya başlayabilir. Onun için mutsuz müşteriler ile iletişim kuracak farklı yollar belirlemeniz bir marka için olmazsa olmazdır.",
          style: typography?.textSmMedium?.copyWith(
            color: colors?.textColortextdescription,
          ),
        ),
      ],
    );
  }

  Widget _buildFooterSection(
    CustomTypography? typography,
    CustomColors? colors,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildActionButton(
            "Yeni Soru",
            isPrimary: true,
            typography: typography,
            colors: colors,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _buildActionButton(
            "İtiraz Et",
            isPrimary: false,
            typography: typography,
            colors: colors,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _buildActionButton(
            "Görüş Bildir",
            isPrimary: false,
            typography: typography,
            colors: colors,
            onTap: () {},
          ),
          const SizedBox(height: 8),
          _buildActionButton(
            "Kapat",
            isPrimary: false,
            isTextButton: true,
            typography: typography,
            colors: colors,
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String text, {
    required bool isPrimary,
    bool isTextButton = false,
    required CustomTypography? typography,
    required CustomColors? colors,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 36,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? colors?.primaryColorprimary
              : isTextButton
              ? Colors.transparent
              : colors?.backgroundColorbgcontainer,
          foregroundColor: isPrimary
              ? colors?.textColortextlightsolid
              : isTextButton
              ? colors?.primaryColorprimary
              : colors?.textColortext,
          side: !isPrimary && !isTextButton
              ? BorderSide(
                  color: colors?.borderColorbordersecondary ?? Colors.grey,
                )
              : null,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        ),
        child: Text(
          text,
          style: typography?.textSmSemibold?.copyWith(
            color: isPrimary
                ? colors?.textColortextlightsolid
                : isTextButton
                ? colors?.primaryColorprimary
                : colors?.textColortext,
          ),
        ),
      ),
    );
  }
}
