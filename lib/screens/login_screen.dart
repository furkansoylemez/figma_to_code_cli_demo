import 'package:figma_to_code_light/components/custom_form_field.dart';
import 'package:figma_to_code_light/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    final customColors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      backgroundColor: customColors?.textColorTextLightSolid ?? Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text(
                'Giriş yap!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: customColors?.textColorTextBase ?? Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Kaldığın yerden devam et. Eğitimlerin, hedeflerin ve ekibin seni bekliyor.',
                style: TextStyle(
                  fontSize: 16,
                  color: customColors?.textColorTextSecondary ?? Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Kullanıcı adı',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: customColors?.textColorTextBase ?? Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              CustomFormField(
                controller: _usernameController,
                hintText: 'Kullanıcı adınızı giriniz',
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: customColors?.textColorTextSecondary ?? Colors.grey,
                ),
                borderColor:
                    customColors?.borderColorBorderSecondary ??
                    Colors.grey.shade300,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              Text(
                'Parola',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: customColors?.textColorTextBase ?? Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              CustomFormField(
                controller: _passwordController,
                hintText: '••••••••',
                obscureText: _obscurePassword,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: customColors?.textColorTextSecondary ?? Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: customColors?.textColorTextSecondary ?? Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                borderColor:
                    customColors?.borderColorBorderSecondary ??
                    Colors.grey.shade300,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Parolamı unuttum',
                    style: TextStyle(
                      color: customColors?.primaryColorPrimary ?? Colors.purple,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        customColors?.primaryColorPrimary ?? Colors.purple,
                    foregroundColor:
                        customColors?.textColorTextLightSolid ?? Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
