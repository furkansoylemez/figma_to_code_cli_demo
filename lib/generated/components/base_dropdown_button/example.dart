import 'package:flutter/material.dart';
import './base_dropdown_button.dart';

class BaseDropdownButtonExamplePage extends StatefulWidget {
  const BaseDropdownButtonExamplePage({super.key});

  @override
  State<BaseDropdownButtonExamplePage> createState() => _BaseDropdownButtonExamplePageState();
}

class _BaseDropdownButtonExamplePageState extends State<BaseDropdownButtonExamplePage> {
  String _selectedText = 'Select an option';
  bool _enabled = true;
  Color? _backgroundColor;
  Color? _borderColor;
  Color? _textColor;
  double _borderRadius = 6.0;
  double _borderWidth = 1.0;
  double _horizontalPadding = 16.0;
  double _minHeight = 32.0;
  MainAxisAlignment _alignment = MainAxisAlignment.spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BaseDropdownButton Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Interactive Section',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    BaseDropdownButton(
                      text: _selectedText,
                      enabled: _enabled,
                      backgroundColor: _backgroundColor,
                      borderColor: _borderColor,
                      textColor: _textColor,
                      borderRadius: _borderRadius,
                      borderWidth: _borderWidth,
                      horizontalPadding: _horizontalPadding,
                      minHeight: _minHeight,
                      alignment: _alignment,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Dropdown tapped!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            SwitchListTile(
              title: const Text('Enabled'),
              value: _enabled,
              onChanged: (value) => setState(() => _enabled = value),
            ),
            
            ListTile(
              title: const Text('Border Radius'),
              subtitle: Slider(
                value: _borderRadius,
                min: 0,
                max: 20,
                divisions: 20,
                label: _borderRadius.toStringAsFixed(1),
                onChanged: (value) => setState(() => _borderRadius = value),
              ),
            ),
            
            ListTile(
              title: const Text('Border Width'),
              subtitle: Slider(
                value: _borderWidth,
                min: 0,
                max: 5,
                divisions: 10,
                label: _borderWidth.toStringAsFixed(1),
                onChanged: (value) => setState(() => _borderWidth = value),
              ),
            ),
            
            ListTile(
              title: const Text('Horizontal Padding'),
              subtitle: Slider(
                value: _horizontalPadding,
                min: 8,
                max: 32,
                divisions: 24,
                label: _horizontalPadding.toStringAsFixed(0),
                onChanged: (value) => setState(() => _horizontalPadding = value),
              ),
            ),
            
            ListTile(
              title: const Text('Min Height'),
              subtitle: Slider(
                value: _minHeight,
                min: 24,
                max: 60,
                divisions: 36,
                label: _minHeight.toStringAsFixed(0),
                onChanged: (value) => setState(() => _minHeight = value),
              ),
            ),
            
            ListTile(
              title: const Text('Alignment'),
              subtitle: DropdownButton<MainAxisAlignment>(
                value: _alignment,
                isExpanded: true,
                onChanged: (value) => setState(() => _alignment = value!),
                items: const [
                  DropdownMenuItem(
                    value: MainAxisAlignment.spaceBetween,
                    child: Text('Space Between'),
                  ),
                  DropdownMenuItem(
                    value: MainAxisAlignment.start,
                    child: Text('Start'),
                  ),
                  DropdownMenuItem(
                    value: MainAxisAlignment.center,
                    child: Text('Center'),
                  ),
                  DropdownMenuItem(
                    value: MainAxisAlignment.end,
                    child: Text('End'),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            const Text(
              'Basic Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Default Style', style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    BaseDropdownButton(
                      text: 'Select Category',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Colored Style', style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    BaseDropdownButton(
                      text: 'Choose Location',
                      backgroundColor: Colors.blue.shade50,
                      borderColor: Colors.blue,
                      textColor: Colors.blue.shade700,
                      iconColor: Colors.blue,
                      borderRadius: 12.0,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Disabled State', style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    const BaseDropdownButton(
                      text: 'Not Available',
                      enabled: false,
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
}