import 'package:figma_to_code_light/design_system/theme/app_theme.dart';
import 'package:figma_to_code_light/finalresults/screen28.dart';
import 'package:figma_to_code_light/finalresults/screen30.dart';
import 'package:figma_to_code_light/finalresults/screen31.dart';
import 'package:figma_to_code_light/finalresults/screen32.dart';
import 'package:figma_to_code_light/finalresults/screen33.dart';
import 'package:figma_to_code_light/finalresults/screen36.dart';
import 'package:figma_to_code_light/finalresults/screen37.dart';

import 'package:flutter/material.dart';

import 'example/screen123.dart';

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
      home: AKlamaScreen(),
    );
  }
}
