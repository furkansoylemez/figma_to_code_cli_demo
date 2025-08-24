import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            _buildStatusBar(colors, typography),
            Expanded(
              child: Container(
                color: colors.white,
                child: Column(
                  children: [
                    _buildCountrySelector(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(typography, colors),
                            SizedBox(height: 32),
                            _buildForm(colors, typography),
                            SizedBox(height: 16),
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
            style: typography.textMdMedium?.copyWith(color: colors.gray800),
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
    );
  }

  Widget _buildCountrySelector() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.red,
            ),
            child: Center(
              child: Icon(Icons.flag, size: 12, color: Colors.white),
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down, size: 20),
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
    );
  }

  Widget _buildForm(CustomColors colors, CustomTypography typography) {
    return Column(
      children: [
        BaseInputFieldBase(
          type: BaseInputFieldType.defaultType,
          label: "Kullanıcı adı",
          placeholder: "Kullanıcı adınızı giriniz",
          hintText: "This is a hint text to he...",
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
          hintText: "This is a hint text to he...",
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
    );
  }

  Widget _buildForgotPasswordButton(
    CustomTypography typography,
    CustomColors colors,
  ) {
    return Align(
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
          style: typography.textSmSemibold?.copyWith(
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
          style: typography.textMdSemibold?.copyWith(
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
