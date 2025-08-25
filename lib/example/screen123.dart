import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:figma_to_code_light/example/component123.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GiriYapScreen extends StatefulWidget {
  const GiriYapScreen({Key? key}) : super(key: key);

  @override
  State<GiriYapScreen> createState() => _GiriYapScreenState();
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
            _buildStatusBar(colors, typography),
            Expanded(
              child: Container(
                color: colors?.white,
                child: Column(
                  children: [
                    _buildCountrySelector(colors),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildHeader(typography, colors),
                            const SizedBox(height: 32),
                            _buildForm(colors, typography),
                            const SizedBox(height: 16),
                            _buildForgotPassword(typography, colors),
                            const Spacer(),
                            _buildLoginButton(typography, colors),
                            const SizedBox(height: 24),
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

  Widget _buildStatusBar(CustomColors? colors, CustomTypography? typography) {
    return Container(
      color: colors?.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '08:15',
            style: typography?.textSmMedium?.copyWith(color: colors?.gray800),
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
              Icon(Icons.battery_full, size: 16, color: colors?.gray800),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCountrySelector(CustomColors? colors) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.red,
            ),
            child: const Center(
              child: Icon(Icons.flag, size: 12, color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down, size: 20),
        ],
      ),
    );
  }

  Widget _buildHeader(CustomTypography? typography, CustomColors? colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Giriş yap!',
          style: typography?.displayXsSemibold?.copyWith(
            color: colors?.textColortextbase,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Kaldığın yerden devam et....',
          style: typography?.textSmRegular?.copyWith(
            color: colors?.textColortextsecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(CustomColors? colors, CustomTypography? typography) {
    return Column(
      children: [
        BaseInputFieldBase(
          label: 'Kullanıcı adı',
          hintText: 'Kullanıcı adınızı giriniz',
          controller: _usernameController,
          leadingIcon: Icon(
            Icons.person_outline,
            color: colors?.textColortextsecondary,
          ),
          onChanged: (value) {},
        ),
        const SizedBox(height: 20),
        BaseInputFieldBase(
          label: 'Parola',
          hintText: '••••••••',
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
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: colors?.textColortextsecondary,
            ),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildForgotPassword(
    CustomTypography? typography,
    CustomColors? colors,
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
          'Parolamı unuttum',
          style: typography?.textSmSemibold?.copyWith(
            color: colors?.primaryColorprimary,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(CustomTypography? typography, CustomColors? colors) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colors?.primaryColorprimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          'Giriş Yap',
          style: typography?.textMdSemibold?.copyWith(
            color: colors?.textColortextlightsolid,
          ),
        ),
      ),
    );
  }
}
