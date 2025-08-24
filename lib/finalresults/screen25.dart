import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:figma_to_code_light/finalresults/component4.dart';
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
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
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
                            _buildForgotPasswordButton(typography, colors),
                            const SizedBox(height: 32),
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
            style: typography?.textMdRegular?.copyWith(color: colors?.gray800),
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 24,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.red,
            ),
            child: const Icon(Icons.flag, size: 12, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down, size: 16, color: colors?.gray800),
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
          placeholder: 'Kullanıcı adınızı giriniz',
          controller: _usernameController,
          focusNode: _usernameFocusNode,
          leadingIcon: Icon(
            Icons.person_outline,
            color: colors?.textColortextsecondary,
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
        const SizedBox(height: 16),
        BaseInputFieldBase(
          label: 'Parola',
          placeholder: '••••••••',
          controller: _passwordController,
          focusNode: _passwordFocusNode,
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
          onChanged: (value) {
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton(
    CustomTypography? typography,
    CustomColors? colors,
  ) {
    return Align(
      alignment: Alignment.centerRight,
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
      child: ElevatedButton(
        onPressed: () {
          _handleLogin();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: colors?.primaryColorprimary,
          foregroundColor: colors?.textColortextlightsolid,
          padding: const EdgeInsets.symmetric(vertical: 16),
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

  void _handleLogin() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun')),
      );
      return;
    }
  }
}
