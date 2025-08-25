import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:figma_to_code_light/finalresults/component4.dart';
import 'package:flutter/material.dart';

class GiriYapScreen28 extends StatefulWidget {
  const GiriYapScreen28({Key? key}) : super(key: key);

  @override
  State<GiriYapScreen28> createState() => _GiriYapScreen28State();
}

class _GiriYapScreen28State extends State<GiriYapScreen28> {
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                        size: 16,
                        color: colors?.gray800,
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16, color: colors?.gray800),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.battery_full,
                        size: 16,
                        color: colors?.gray800,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 16,
                          color: colors?.gray800,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Giriş yap!",
                      style: typography?.displayXsSemibold?.copyWith(
                        color: colors?.textColortextbase,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Kaldığın yerden devam et....",
                      style: typography?.textSmRegular?.copyWith(
                        color: colors?.textColortextsecondary,
                      ),
                    ),
                    const SizedBox(height: 32),
                    BaseInputFieldBase(
                      label: "Kullanıcı adı",
                      hintText: "Kullanıcı adınızı giriniz",
                      controller: _usernameController,
                      leadingIcon: Icon(
                        Icons.person_outline,
                        color: colors?.textColortextsecondary,
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 20),
                    BaseInputFieldBase(
                      label: "Parola",
                      hintText: "••••••••",
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      leadingIcon: Icon(
                        Icons.lock_outline,
                        color: colors?.textColortextsecondary,
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
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "Parolamı unuttum",
                          style: typography?.textSmSemibold?.copyWith(
                            color: colors?.primaryColorprimary,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors?.primaryColorprimary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Giriş Yap",
                          style: typography?.textMdSemibold?.copyWith(
                            color: colors?.textColortextlightsolid,
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
