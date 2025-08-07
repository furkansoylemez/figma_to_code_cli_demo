import 'package:flutter/material.dart';
import './base_checkbox.dart';

class BaseCheckboxExamplePage extends StatefulWidget {
  const BaseCheckboxExamplePage({super.key});

  @override
  State<BaseCheckboxExamplePage> createState() => _BaseCheckboxExamplePageState();
}

class _BaseCheckboxExamplePageState extends State<BaseCheckboxExamplePage> {
  bool _interactiveValue = false;
  double _size = 20.0;
  double _spacing = 8.0;
  double _borderRadius = 4.0;
  double _borderWidth = 1.0;
  bool _enabled = true;
  bool _tristate = false;
  String _label = 'Interactive Checkbox';
  Color _activeColor = Colors.blue;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;

  bool _example1 = false;
  bool _example2 = true;
  bool? _example3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BaseCheckbox Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interactive Section',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseCheckbox(
                      value: _tristate ? _interactiveValue : _interactiveValue,
                      onChanged: _enabled ? (value) {
                        setState(() {
                          _interactiveValue = value ?? false;
                        });
                      } : null,
                      label: _label,
                      size: _size,
                      spacing: _spacing,
                      borderRadius: _borderRadius,
                      borderWidth: _borderWidth,
                      enabled: _enabled,
                      tristate: _tristate,
                      activeColor: _activeColor,
                      crossAxisAlignment: _crossAxisAlignment,
                    ),
                    const SizedBox(height: 20),
                    
                    Text('Label Text:'),
                    TextField(
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      onChanged: (value) {
                        setState(() {
                          _label = value.isEmpty ? 'Interactive Checkbox' : value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    
                    Text('Size: ${_size.toStringAsFixed(1)}'),
                    Slider(
                      value: _size,
                      min: 16.0,
                      max: 32.0,
                      onChanged: (value) {
                        setState(() {
                          _size = value;
                        });
                      },
                    ),
                    
                    Text('Spacing: ${_spacing.toStringAsFixed(1)}'),
                    Slider(
                      value: _spacing,
                      min: 0.0,
                      max: 20.0,
                      onChanged: (value) {
                        setState(() {
                          _spacing = value;
                        });
                      },
                    ),
                    
                    Text('Border Radius: ${_borderRadius.toStringAsFixed(1)}'),
                    Slider(
                      value: _borderRadius,
                      min: 0.0,
                      max: 12.0,
                      onChanged: (value) {
                        setState(() {
                          _borderRadius = value;
                        });
                      },
                    ),
                    
                    Text('Border Width: ${_borderWidth.toStringAsFixed(1)}'),
                    Slider(
                      value: _borderWidth,
                      min: 1.0,
                      max: 4.0,
                      onChanged: (value) {
                        setState(() {
                          _borderWidth = value;
                        });
                      },
                    ),
                    
                    Row(
                      children: [
                        Text('Active Color: '),
                        const SizedBox(width: 8),
                        ...Colors.primaries.take(6).map((color) => 
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _activeColor = color;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: color,
                                border: Border.all(
                                  color: _activeColor == color ? Colors.black : Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    
                    SwitchListTile(
                      title: const Text('Enabled'),
                      value: _enabled,
                      onChanged: (value) {
                        setState(() {
                          _enabled = value;
                        });
                      },
                    ),
                    
                    SwitchListTile(
                      title: const Text('Tristate'),
                      value: _tristate,
                      onChanged: (value) {
                        setState(() {
                          _tristate = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            Text(
              'Basic Examples',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Simple Checkbox with Label', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    BaseCheckbox(
                      value: _example1,
                      onChanged: (value) {
                        setState(() {
                          _example1 = value ?? false;
                        });
                      },
                      label: 'Accept terms and conditions',
                    ),
                    const SizedBox(height: 16),
                    
                    const Text('Customized Checkbox', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    BaseCheckbox(
                      value: _example2,
                      onChanged: (value) {
                        setState(() {
                          _example2 = value ?? false;
                        });
                      },
                      label: 'Subscribe to newsletter',
                      size: 24,
                      spacing: 12,
                      activeColor: Colors.green,
                      borderRadius: 8,
                    ),
                    const SizedBox(height: 16),
                    
                    const Text('Tristate Checkbox', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    BaseCheckbox(
                      value: _example3,
                      onChanged: (value) {
                        setState(() {
                          if (_example3 == null) {
                            _example3 = true;
                          } else if (_example3 == true) {
                            _example3 = false;
                          } else {
                            _example3 = null;
                          }
                        });
                      },
                      label: 'Select all items',
                      tristate: true,
                      activeColor: Colors.purple,
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