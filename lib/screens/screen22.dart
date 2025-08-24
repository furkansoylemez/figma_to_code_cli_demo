import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class GiriYapScreen extends StatefulWidget {
  const GiriYapScreen({super.key});

  @override
  State<GiriYapScreen> createState() => _GiriYapScreenState();
}

class _GiriYapScreenState extends State<GiriYapScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "08:15",
                    style: typography.textMdMedium?.copyWith(
                      color: colors.gray800,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        size: 16,
                        color: colors.gray800,
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.wifi, size: 16, color: colors.gray800),
                      const SizedBox(width: 4),
                      Icon(Icons.battery_full, size: 16, color: colors.gray800),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colors.borderColorbordersecondary!,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 20,
                                  height: 14,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/turkey_flag.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 16,
                                  color: colors.textColortextsecondary,
                                ),
                              ],
                            ),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Giriş yap!",
                                  style: typography.displayXsSemibold?.copyWith(
                                    color: colors.textColortextbase,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Kaldığın yerden devam et....",
                                  style: typography.textSmRegular?.copyWith(
                                    color: colors.textColortextsecondary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Column(
                              children: [
                                _buildInputField(
                                  label: "Kullanıcı adı",
                                  controller: _usernameController,
                                  hintText: "Kullanıcı adınızı giriniz",
                                  prefixIcon: Icons.person_outline,
                                  colors: colors,
                                  typography: typography,
                                ),
                                const SizedBox(height: 20),
                                _buildInputField(
                                  label: "Parola",
                                  controller: _passwordController,
                                  hintText: "••••••••",
                                  prefixIcon: Icons.lock_outline,
                                  isPassword: true,
                                  isPasswordVisible: _isPasswordVisible,
                                  onTogglePassword: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  colors: colors,
                                  typography: typography,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
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
                            const Spacer(),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colors.primaryColorprimary,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required CustomColors colors,
    required CustomTypography typography,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onTogglePassword,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: typography.textSmMedium?.copyWith(
            color: colors.textColortexttertiary,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: isPassword && !isPasswordVisible,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: typography.textMdRegular?.copyWith(
              color: colors.textColortextsecondary,
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: colors.textColortextsecondary,
              size: 20,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: onTogglePassword,
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: colors.textColortexttertiary,
                      size: 20,
                    ),
                  )
                : null,
            filled: true,
            fillColor: colors.textColortextlightsolid,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.borderColorbordersecondary!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.borderColorbordersecondary!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colors.primaryColorprimary!),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
