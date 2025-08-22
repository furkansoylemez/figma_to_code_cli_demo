import 'package:figma_to_code_light/screens/development_screen.dart';
import 'package:figma_to_code_light/screens/login_screen.dart';
import 'package:figma_to_code_light/theme/app_theme.dart';
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
      theme: AppTheme.mode1,
      home: LoginScreen(),
    );
  }
}
