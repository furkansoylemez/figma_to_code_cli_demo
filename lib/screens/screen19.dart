import 'package:figma_to_code_light/components/component1.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

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
            _buildStatusBar(colors, typography),
            Expanded(
              child: Container(
                color: colors.white,
                child: Column(
                  children: [
                    _buildCountrySelector(colors),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(typography, colors),
                            SizedBox(height: 32),
                            _buildForm(colors, typography),
                            SizedBox(height: 24),
                            _buildForgotPasswordButton(typography, colors),
                            Spacer(),
                            _buildLoginButton(colors, typography),
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

  Widget _buildStatusBar(CustomColors colors, CustomTypography typography) {
    return Container(
      color: colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "08:15",
            style: typography.textMdRegular.copyWith(color: colors.gray800),
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
              Container(
                width: 24,
                height: 12,
                decoration: BoxDecoration(
                  border: Border.all(color: colors.gray800, width: 1),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 18,
                    height: 8,
                    decoration: BoxDecoration(
                      color: colors.gray800,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCountrySelector(CustomColors colors) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 16,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: Image.asset('assets/flags/turkey.png', fit: BoxFit.cover),
          ),
          SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down, color: colors.gray800, size: 20),
        ],
      ),
    );
  }

  Widget _buildHeader(CustomTypography typography, CustomColors colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Giriş yap!",
          style: typography.displayXsSemibold.copyWith(
            color: colors.textColortextbase,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Kaldığın yerden devam et....",
          style: typography.textSmRegular.copyWith(
            color: colors.textColortextsecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(CustomColors colors, CustomTypography typography) {
    return Column(
      children: [
        BaseTypeDefaultDestructiveFalse(
          label: "Kullanıcı adı",
          placeholder: "Kullanıcı adınızı giriniz",
          hintText: "This is a hint text to he...",
          controller: _usernameController,
          onChanged: (value) {},
          enabled: true,
        ),
        SizedBox(height: 20),
        BaseTypeDefaultDestructiveFalse(
          label: "Parola",
          placeholder: "••••••••",
          hintText: "This is a hint text to he...",
          controller: _passwordController,
          onChanged: (value) {},
          enabled: true,
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton(
    CustomTypography typography,
    CustomColors colors,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Parolamı unuttum",
          style: typography.textSmSemibold.copyWith(
            color: colors.primaryColorprimary,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(CustomColors colors, CustomTypography typography) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primaryColorprimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          "Giriş Yap",
          style: typography.textMdSemibold.copyWith(
            color: colors.textColortextlightsolid,
          ),
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
