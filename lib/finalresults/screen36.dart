import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:figma_to_code_light/example/component123.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AyarlarScreen36 extends StatefulWidget {
  const AyarlarScreen36({Key? key}) : super(key: key);

  @override
  State<AyarlarScreen36> createState() => _AyarlarScreen36State();
}

class _AyarlarScreen36State extends State<AyarlarScreen36> {
  bool isProfileSettingsSelected = true;

  final TextEditingController _nameController = TextEditingController(
    text: 'Yeşim',
  );
  final TextEditingController _surnameController = TextEditingController(
    text: 'Poyraz',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'yesim.poyraz@rdc.com.tr',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '*********',
  );
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: '*********');

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<CustomTypography>();
    final colors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      backgroundColor: colors?.backgroundColorbgcontainer,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 92,
            color: colors?.white,
            child: Column(
              children: [
                Container(
                  height: 41,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '08:15',
                        style: typography?.textSmMedium?.copyWith(
                          color: colors?.gray800,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.signal_cellular_4_bar,
                            size: 17,
                            color: colors?.gray800,
                          ),
                          const SizedBox(width: 5),
                          Icon(Icons.wifi, size: 15, color: colors?.gray800),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.battery_full,
                            size: 24,
                            color: colors?.gray800,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 51,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.chevron_left,
                          size: 24,
                          color: colors?.iconColoriconsecondary,
                        ),
                      ),
                      Text(
                        'Ayarlar',
                        style: typography?.textMdMedium?.copyWith(
                          color: colors?.primaryColorprimarytext,
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        size: 24,
                        color: colors?.iconColoriconsecondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 42,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => isProfileSettingsSelected = true),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: isProfileSettingsSelected
                            ? colors?.white
                            : colors?.borderColorbordersecondary,
                        border: isProfileSettingsSelected
                            ? Border(
                                bottom: BorderSide(
                                  color: colors?.blueGray200 ?? Colors.grey,
                                  width: 2,
                                ),
                              )
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          'Profil Ayarları',
                          style: typography?.textSmMedium?.copyWith(
                            color: isProfileSettingsSelected
                                ? colors?.gray800
                                : colors?.textColortextdescription,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => isProfileSettingsSelected = false),
                    child: Container(
                      height: 42,
                      color: !isProfileSettingsSelected
                          ? colors?.white
                          : colors?.borderColorbordersecondary,
                      child: Center(
                        child: Text(
                          'Uygulama Ayarları',
                          style: typography?.textSmMedium?.copyWith(
                            color: !isProfileSettingsSelected
                                ? colors?.gray800
                                : colors?.textColortextdescription,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 42),
                  Stack(
                    children: [
                      Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          color: colors?.primaryColorprimarybg,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                colors?.backgroundColorbgbase ?? Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 48,
                          color: colors?.primaryColorprimary,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                            color: colors?.backgroundColorbgbase,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  colors?.backgroundColorbgbase ?? Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: colors?.textColortext,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      BaseInputFieldBase(
                        label: 'Ad',
                        value: 'Yeşim',
                        controller: _nameController,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 16),
                      BaseInputFieldBase(
                        label: 'Soyad',
                        value: 'Poyraz',
                        controller: _surnameController,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 16),
                      BaseInputFieldBase(
                        label: 'Email',
                        value: 'yesim.poyraz@rdc.com.tr',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 16),
                      BaseInputFieldBase(
                        label: 'Şifre',
                        value: '*********',
                        controller: _passwordController,
                        obscureText: true,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 16),
                      BaseInputFieldBase(
                        label: 'Şifre Tekrar',
                        value: '*********',
                        controller: _confirmPasswordController,
                        obscureText: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {
                        HapticFeedback.lightImpact();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors?.primaryColorprimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        'Kaydet',
                        style: typography?.textSmSemibold?.copyWith(
                          color: colors?.backgroundColorbgbase,
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
    );
  }
}
