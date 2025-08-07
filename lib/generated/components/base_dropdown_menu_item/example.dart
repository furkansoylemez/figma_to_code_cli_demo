import 'package:flutter/material.dart';
import './base_dropdown_menu_item.dart';

class BaseDropdownMenuItemExamplePage extends StatefulWidget {
  const BaseDropdownMenuItemExamplePage({super.key});

  @override
  State<BaseDropdownMenuItemExamplePage> createState() => _BaseDropdownMenuItemExamplePageState();
}

class _BaseDropdownMenuItemExamplePageState extends State<BaseDropdownMenuItemExamplePage> {
  String _text = 'Settings';
  IconData? _leadingIcon = Icons.settings;
  bool _showIcon = true;
  bool _enabled = true;
  double _height = 32.0;
  double _horizontalPadding = 12.0;
  double _iconSize = 16.0;
  double _iconSpacing = 8.0;
  Color? _backgroundColor;
  bool _autofocus = false;
  int _tapCount = 0;

  final List<IconData> _availableIcons = [
    Icons.settings,
    Icons.home,
    Icons.person,
    Icons.notifications,
    Icons.help,
    Icons.logout,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('base_dropdown_menu_item Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Interactive Section
            Text(
              'Interactive Example',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            // Controls
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Text',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => setState(() => _text = value),
                      controller: TextEditingController(text: _text),
                    ),
                    const SizedBox(height: 16),
                    
                    Row(
                      children: [
                        const Text('Leading Icon: '),
                        const SizedBox(width: 8),
                        DropdownButton<IconData?>(
                          value: _leadingIcon,
                          items: [
                            const DropdownMenuItem(value: null, child: Text('None')),
                            ..._availableIcons.map((icon) => DropdownMenuItem(
                              value: icon,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(icon, size: 16),
                                  const SizedBox(width: 8),
                                  Text(icon.toString().split('.').last),
                                ],
                              ),
                            )),
                          ],
                          onChanged: (value) => setState(() => _leadingIcon = value),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    Row(
                      children: [
                        Expanded(
                          child: SwitchListTile(
                            title: const Text('Show Icon'),
                            value: _showIcon,
                            onChanged: (value) => setState(() => _showIcon = value),
                          ),
                        ),
                        Expanded(
                          child: SwitchListTile(
                            title: const Text('Enabled'),
                            value: _enabled,
                            onChanged: (value) => setState(() => _enabled = value),
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Height: ${_height.toInt()}'),
                              Slider(
                                value: _height,
                                min: 24.0,
                                max: 64.0,
                                divisions: 40,
                                onChanged: (value) => setState(() => _height = value),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Horizontal Padding: ${_horizontalPadding.toInt()}'),
                              Slider(
                                value: _horizontalPadding,
                                min: 4.0,
                                max: 24.0,
                                divisions: 20,
                                onChanged: (value) => setState(() => _horizontalPadding = value),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Icon Size: ${_iconSize.toInt()}'),
                              Slider(
                                value: _iconSize,
                                min: 12.0,
                                max: 32.0,
                                divisions: 20,
                                onChanged: (value) => setState(() => _iconSize = value),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Icon Spacing: ${_iconSpacing.toInt()}'),
                              Slider(
                                value: _iconSpacing,
                                min: 4.0,
                                max: 16.0,
                                divisions: 12,
                                onChanged: (value) => setState(() => _iconSpacing = value),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      children: [
                        const Text('Background Color: '),
                        const SizedBox(width: 8),
                        DropdownButton<Color?>(
                          value: _backgroundColor,
                          items: const [
                            DropdownMenuItem(value: null, child: Text('None')),
                            DropdownMenuItem(value: Colors.blue, child: Text('Blue')),
                            DropdownMenuItem(value: Colors.green, child: Text('Green')),
                            DropdownMenuItem(value: Colors.orange, child: Text('Orange')),
                          ],
                          onChanged: (value) => setState(() => _backgroundColor = value),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Interactive Component
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Live Preview:'),
                    const SizedBox(height: 8),
                    BaseDropdownMenuItem(
                      text: _text.isEmpty ? 'Settings' : _text,
                      leadingIcon: _leadingIcon,
                      showIcon: _showIcon,
                      enabled: _enabled,
                      height: _height,
                      horizontalPadding: _horizontalPadding,
                      iconSize: _iconSize,
                      iconSpacing: _iconSpacing,
                      backgroundColor: _backgroundColor,
                      onTap: () => setState(() => _tapCount++),
                    ),
                    const SizedBox(height: 8),
                    Text('Tapped $_tapCount times'),
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
                    const Text(
                      'Simple menu item with icon',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    BaseDropdownMenuItem(
                      text: 'Profile Settings',
                      leadingIcon: Icons.person,
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile Settings tapped')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Text-only menu item',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    BaseDropdownMenuItem(
                      text: 'About',
                      showIcon: false,
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('About tapped')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Disabled menu item',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const BaseDropdownMenuItem(
                      text: 'Premium Feature',
                      leadingIcon: Icons.star,
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