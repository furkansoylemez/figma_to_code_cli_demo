import 'package:flutter/material.dart';
import './base_button.dart';

class BaseButtonExamplePage extends StatefulWidget {
  const BaseButtonExamplePage({super.key});

  @override
  State<BaseButtonExamplePage> createState() => _BaseButtonExamplePageState();
}

class _BaseButtonExamplePageState extends State<BaseButtonExamplePage> {
  String _text = 'Click Me';
  ButtonSize _size = ButtonSize.medium;
  bool _isLoading = false;
  bool _showLeftIcon = false;
  bool _showRightIcon = false;
  bool _showText = true;
  bool _isEnabled = true;
  double _borderRadius = 8.0;
  Color _backgroundColor = Colors.blue;
  Color _foregroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BaseButton Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Interactive Section
            Text(
              'Interactive Controls',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    BaseButton(
                      text: _text,
                      size: _size,
                      isLoading: _isLoading,
                      showLeftIcon: _showLeftIcon,
                      showRightIcon: _showRightIcon,
                      showText: _showText,
                      leftIcon: const Icon(Icons.favorite),
                      rightIcon: const Icon(Icons.arrow_forward),
                      onPressed: _isEnabled ? () {} : null,
                      borderRadius: _borderRadius,
                      backgroundColor: _backgroundColor,
                      foregroundColor: _foregroundColor,
                    ),
                    const SizedBox(height: 24),
                    
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Button Text',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _text = value.isEmpty ? 'Click Me' : value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    
                    Row(
                      children: [
                        const Text('Size: '),
                        const SizedBox(width: 16),
                        DropdownButton<ButtonSize>(
                          value: _size,
                          items: ButtonSize.values.map((size) {
                            return DropdownMenuItem(
                              value: size,
                              child: Text(size.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _size = value;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    Row(
                      children: [
                        const Text('Border Radius: '),
                        Expanded(
                          child: Slider(
                            value: _borderRadius,
                            min: 0,
                            max: 24,
                            divisions: 24,
                            label: _borderRadius.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                _borderRadius = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    
                    SwitchListTile(
                      title: const Text('Show Text'),
                      value: _showText,
                      onChanged: (value) {
                        setState(() {
                          _showText = value;
                        });
                      },
                    ),
                    
                    SwitchListTile(
                      title: const Text('Show Left Icon'),
                      value: _showLeftIcon,
                      onChanged: (value) {
                        setState(() {
                          _showLeftIcon = value;
                        });
                      },
                    ),
                    
                    SwitchListTile(
                      title: const Text('Show Right Icon'),
                      value: _showRightIcon,
                      onChanged: (value) {
                        setState(() {
                          _showRightIcon = value;
                        });
                      },
                    ),
                    
                    SwitchListTile(
                      title: const Text('Loading State'),
                      value: _isLoading,
                      onChanged: (value) {
                        setState(() {
                          _isLoading = value;
                        });
                      },
                    ),
                    
                    SwitchListTile(
                      title: const Text('Enabled'),
                      value: _isEnabled,
                      onChanged: (value) {
                        setState(() {
                          _isEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Basic Examples Section
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
                    const Text('Different Sizes', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      children: [
                        BaseButton(
                          text: 'Small',
                          size: ButtonSize.small,
                          onPressed: () {},
                        ),
                        BaseButton(
                          text: 'Medium',
                          size: ButtonSize.medium,
                          onPressed: () {},
                        ),
                        BaseButton(
                          text: 'Large',
                          size: ButtonSize.large,
                          onPressed: () {},
                        ),
                      ],
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
                    const Text('With Icons', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        BaseButton(
                          text: 'Left Icon',
                          showLeftIcon: true,
                          leftIcon: const Icon(Icons.star),
                          onPressed: () {},
                          backgroundColor: Colors.green,
                        ),
                        BaseButton(
                          text: 'Right Icon',
                          showRightIcon: true,
                          rightIcon: const Icon(Icons.send),
                          onPressed: () {},
                          backgroundColor: Colors.orange,
                        ),
                        BaseButton(
                          text: 'Both Icons',
                          showLeftIcon: true,
                          showRightIcon: true,
                          leftIcon: const Icon(Icons.download),
                          rightIcon: const Icon(Icons.arrow_forward),
                          onPressed: () {},
                          backgroundColor: Colors.purple,
                        ),
                      ],
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
                    const Text('Loading & Disabled States', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      children: [
                        BaseButton(
                          text: 'Loading',
                          isLoading: true,
                          onPressed: () {},
                        ),
                        BaseButton(
                          text: 'Disabled',
                          onPressed: null,
                        ),
                      ],
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