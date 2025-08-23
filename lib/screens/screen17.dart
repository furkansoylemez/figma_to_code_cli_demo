import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GiriYapScreen extends StatefulWidget {
  @override
  _GiriYapScreenState createState() => _GiriYapScreenState();
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 24,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: Image.asset(
                                  'assets/images/turkey_flag.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.keyboard_arrow_down, size: 16),
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 16),
                      ],
                    ),
                    SizedBox(height: 40),
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
                    Expanded(
                      child: Column(
                        children: [
                          _buildInputField(
                            label: "Kullanıcı adı",
                            placeholder: "Kullanıcı adınızı giriniz",
                            controller: _usernameController,
                            prefixIcon: Icons.person_outline,
                            colors: colors,
                            typography: typography,
                          ),
                          SizedBox(height: 20),
                          _buildInputField(
                            label: "Parola",
                            placeholder: "••••••••",
                            controller: _passwordController,
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
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colors.primaryColorprimary,
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
    required String placeholder,
    required TextEditingController controller,
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
        SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: colors.textColortextlightsolid,
            border: Border.all(color: colors.borderColorbordersecondary!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword && !isPasswordVisible,
            decoration: InputDecoration(
              hintText: placeholder,
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
                  : Icon(
                      Icons.visibility_off,
                      color: colors.textColortexttertiary,
                      size: 20,
                    ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
        ),
        SizedBox(height: 6),
        Text(
          "This is a hint text to he...",
          style: typography.textSmRegular?.copyWith(color: colors.gray600),
        ),
      ],
    );
  }
}
