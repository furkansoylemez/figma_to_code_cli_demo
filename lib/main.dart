import 'package:figma_to_code_light/design_system/theme/app_theme.dart';
import 'package:figma_to_code_light/finalresults/screen23.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: BaseInputFieldShowcasePage(),
    );
  }
}
