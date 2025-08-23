import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class ParolamUnuttumScreen extends StatefulWidget {
  const ParolamUnuttumScreen({super.key});

  @override
  State<ParolamUnuttumScreen> createState() => _ParolamUnuttumScreenState();
}

class _ParolamUnuttumScreenState extends State<ParolamUnuttumScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomColors>()!;
    final customTypography = theme.extension<CustomTypography>()!;

    return Scaffold(
      backgroundColor: customColors.textColortextlightsolid,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '08:15',
                    style: customTypography.textSmRegular?.copyWith(
                      color: customColors.textColortextsecondary,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_4_bar,
                        size: 16,
                        color: customColors.textColortextsecondary,
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.wifi,
                        size: 16,
                        color: customColors.textColortextsecondary,
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.battery_full,
                        size: 16,
                        color: customColors.textColortextsecondary,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: customColors.textColortextsecondary,
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kodu gir',
                              style: customTypography.displayXsSemibold,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'E-posta adresine gönderdiğimiz 4 haneli doğrulama kodunu yaz.',
                              style: customTypography.textSmRegular?.copyWith(
                                color: customColors.textColortextsecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (index) {
                            return Container(
                              margin: EdgeInsets.only(
                                right: index < 3 ? 12 : 0,
                              ),
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: customColors.textColortextlightsolid,
                                border: Border.all(
                                  color:
                                      customColors.borderColorbordersecondary,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 2,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                style: customTypography.displaySmMedium
                                    ?.copyWith(
                                      color:
                                          customColors.textColortextsecondary,
                                    ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onChanged: (value) =>
                                    _onCodeChanged(index, value),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: customColors.primaryColorprimary,
                              foregroundColor:
                                  customColors.textColortextlightsolid,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 1,
                            ),
                            child: Text(
                              'Devam Et',
                              style: customTypography.textMdSemibold?.copyWith(
                                color: customColors.textColortextlightsolid,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
