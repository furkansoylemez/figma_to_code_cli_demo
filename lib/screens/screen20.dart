import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';
import '../components/component3.dart';

class GiriYapScreen extends StatefulWidget {
  @override
  _GiriYapScreenState createState() => _GiriYapScreenState();
}

class _GiriYapScreenState extends State<GiriYapScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>()!;
    final typography = Theme.of(context).extension<CustomTypography>()!;

    return Scaffold(
      backgroundColor: colors.blueGray100,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "08:15",
                    style: typography.textMdRegular?.copyWith(
                      color: colors.gray800,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        color: colors.gray800,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, color: colors.gray800, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, color: colors.gray800, size: 16),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: colors.borderColorbordersecondary!,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 20,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.keyboard_arrow_down, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: colors.white,
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Giriş yap!",
                          style: typography.displayXsSemibold?.copyWith(
                            color: colors.textColortextbase,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Kaldığın yerden devam et....",
                          style: typography.textSmRegular?.copyWith(
                            color: colors.textColortextsecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Column(
                      children: [
                        BaseInputFieldBase(
                          type: BaseInputFieldType.defaultType,
                          label: "Kullanıcı adı",
                          placeholder: "Kullanıcı adınızı giriniz",
                          leadingIcon: Icon(
                            Icons.person_outline,
                            color: colors.textColortextsecondary,
                          ),
                          controller: _usernameController,
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 20),
                        BaseInputFieldBase(
                          type: BaseInputFieldType.defaultType,
                          label: "Parola",
                          placeholder: "••••••••",
                          leadingIcon: Icon(
                            Icons.lock_outline,
                            color: colors.textColortextsecondary,
                          ),
                          trailingIcon: Icon(
                            Icons.visibility_off_outlined,
                            color: colors.textColortexttertiary,
                          ),
                          controller: _passwordController,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Parolamı unuttum",
                          style: typography.textSmSemibold?.copyWith(
                            color: colors.primaryColorprimary,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.primaryColorprimary,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Giriş Yap",
                          style: typography.textMdSemibold?.copyWith(
                            color: colors.textColortextlightsolid,
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

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
