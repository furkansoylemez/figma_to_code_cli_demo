import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:figma_to_code_light/example/component123.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GiriYapScreen33 extends StatefulWidget {
  const GiriYapScreen33({Key? key}) : super(key: key);

  @override
  State<GiriYapScreen33> createState() => _GiriYapScreen33State();
}

class _GiriYapScreen33State extends State<GiriYapScreen33> {
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
      backgroundColor: colors?.white,
      appBar: AppBar(
        backgroundColor: colors?.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 94),
              _buildLanguageSelector(colors, typography),
              const SizedBox(height: 32),
              _buildHeader(colors, typography),
              const SizedBox(height: 32),
              _buildForm(colors, typography),
              const SizedBox(height: 24),
              _buildForgotPasswordButton(colors, typography),
              const SizedBox(height: 24),
              _buildLoginButton(colors, typography),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageSelector(
    CustomColors? colors,
    CustomTypography? typography,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.red,
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.red,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 12,
                        height: 8,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Center(
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, size: 16, color: colors?.gray900),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(CustomColors? colors, CustomTypography? typography) {
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
          'Kaldığın yerden devam et. Eğitimlerin, hedeflerin ve ekibin seni bekliyor.',
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
            size: 20,
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
            size: 20,
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
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              size: 16,
              color: colors?.gray900,
            ),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton(
    CustomColors? colors,
    CustomTypography? typography,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
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
      ],
    );
  }

  Widget _buildLoginButton(CustomColors? colors, CustomTypography? typography) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colors?.primaryColorprimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
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
