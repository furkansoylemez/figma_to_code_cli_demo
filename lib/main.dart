import 'package:figma_to_code_light/generated/components/main_screen/example.dart';
import 'package:figma_to_code_light/theme/base_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: ExampleScreen(),
    );
  }
}
