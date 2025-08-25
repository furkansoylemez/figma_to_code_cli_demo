import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:figma_to_code_light/finalresults/component4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GiriYapScreen extends StatefulWidget {
  @override
  _GiriYapScreenState createState() => _GiriYapScreenState();
}

class _GiriYapScreenState extends State<GiriYapScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<CustomTypography>();
    final colors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      backgroundColor: colors?.blueGray100,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: colors?.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "08:15",
                    style: typography?.textMdRegular?.copyWith(
                      color: colors?.gray800,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        color: colors?.gray800,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, color: colors?.gray800, size: 16),
                      SizedBox(width: 4),
                      Icon(
                        Icons.battery_full,
                        color: colors?.gray800,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: colors?.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    colors?.borderColorbordersecondary ??
                                    Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(6),
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
                                SizedBox(width: 6),
                                Icon(Icons.keyboard_arrow_down, size: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40),
                            Text(
                              "Giriş yap!",
                              style: typography?.displayXsSemibold?.copyWith(
                                color: colors?.textColortextbase,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Kaldığın yerden devam et....",
                              style: typography?.textSmRegular?.copyWith(
                                color: colors?.textColortextsecondary,
                              ),
                            ),
                            SizedBox(height: 32),
                            BaseInputFieldBase(
                              label: "Kullanıcı adı",
                              hintText: "Kullanıcı adınızı giriniz",
                              controller: _usernameController,
                              leadingIcon: Icon(
                                Icons.person_outline,
                                color: colors?.textColortextsecondary,
                                size: 20,
                              ),
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 20),
                            BaseInputFieldBase(
                              label: "Parola",
                              hintText: "••••••••",
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              leadingIcon: Icon(
                                Icons.lock_outline,
                                color: colors?.textColortextsecondary,
                                size: 20,
                              ),
                              trailingIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                                child: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: colors?.textColortextsecondary,
                                  size: 20,
                                ),
                              ),
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  "Parolamı unuttum",
                                  style: typography?.textSmSemibold?.copyWith(
                                    color: colors?.primaryColorprimary,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colors?.primaryColorprimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  "Giriş Yap",
                                  style: typography?.textMdSemibold?.copyWith(
                                    color: colors?.textColortextlightsolid,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                          ],
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
