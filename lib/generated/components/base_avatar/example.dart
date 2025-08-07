import 'package:flutter/material.dart';
import './base_avatar.dart';

class BaseAvatarExamplePage extends StatefulWidget {
  const BaseAvatarExamplePage({super.key});

  @override
  State<BaseAvatarExamplePage> createState() => _BaseAvatarExamplePageState();
}

class _BaseAvatarExamplePageState extends State<BaseAvatarExamplePage> {
  AvatarType _selectedType = AvatarType.text;
  AvatarSize _selectedSize = AvatarSize.medium;
  double _customDiameter = 48;
  Color _backgroundColor = Colors.blue;
  Color _textColor = Colors.white;
  String _text = 'JD';
  IconData _selectedIcon = Icons.person;
  double _borderWidth = 0;
  Color _borderColor = Colors.grey;
  bool _hasOnTap = false;
  bool _enabled = true;

  final List<IconData> _availableIcons = [
    Icons.person,
    Icons.star,
    Icons.favorite,
    Icons.home,
    Icons.settings,
  ];

  final List<Color> _availableColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.teal,
  ];

  void _showTapMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Avatar tapped!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BaseAvatar Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Interactive Section
            Text(
              'Interactive Demo',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Preview Avatar
                    Center(
                      child: _buildInteractiveAvatar(),
                    ),
                    const SizedBox(height: 24),
                    
                    // Type Selection
                    Row(
                      children: [
                        const Text('Type: '),
                        const SizedBox(width: 16),
                        DropdownButton<AvatarType>(
                          value: _selectedType,
                          items: AvatarType.values.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(type.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedType = value;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Size Selection
                    Row(
                      children: [
                        const Text('Size: '),
                        const SizedBox(width: 16),
                        DropdownButton<AvatarSize>(
                          value: _selectedSize,
                          items: AvatarSize.values.map((size) {
                            return DropdownMenuItem(
                              value: size,
                              child: Text(size.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedSize = value;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Custom Diameter
                    Row(
                      children: [
                        const Text('Custom Diameter: '),
                        Expanded(
                          child: Slider(
                            value: _customDiameter,
                            min: 20,
                            max: 100,
                            divisions: 20,
                            label: _customDiameter.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                _customDiameter = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Background Color
                    Row(
                      children: [
                        const Text('Background: '),
                        const SizedBox(width: 16),
                        Wrap(
                          spacing: 8,
                          children: _availableColors.map((color) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _backgroundColor = color;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: _backgroundColor == color
                                      ? Border.all(width: 2, color: Colors.black)
                                      : null,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Text input for text avatars
                    if (_selectedType == AvatarType.text)
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Avatar Text',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _text = value.isEmpty ? 'JD' : value;
                          });
                        },
                      ),
                    
                    // Icon selection for icon avatars
                    if (_selectedType == AvatarType.icon) ...[
                      const Text('Select Icon:'),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: _availableIcons.map((icon) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIcon = icon;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _selectedIcon == icon
                                      ? Colors.blue
                                      : Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(icon),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                    const SizedBox(height: 16),
                    
                    // Border Width
                    Row(
                      children: [
                        const Text('Border Width: '),
                        Expanded(
                          child: Slider(
                            value: _borderWidth,
                            min: 0,
                            max: 5,
                            divisions: 10,
                            label: _borderWidth.toStringAsFixed(1),
                            onChanged: (value) {
                              setState(() {
                                _borderWidth = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Interactive Options
                    SwitchListTile(
                      title: const Text('Enable Tap'),
                      value: _hasOnTap,
                      onChanged: (value) {
                        setState(() {
                          _hasOnTap = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Enabled'),
                      value: _enabled,
                      onChanged: (value) {
                        setState(() {
                          _enabled = value;
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
            
            // Text Avatar Examples
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Text Avatars', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        BaseAvatar.text(text: 'AB', size: AvatarSize.small),
                        const SizedBox(width: 16),
                        BaseAvatar.text(text: 'CD', size: AvatarSize.medium),
                        const SizedBox(width: 16),
                        BaseAvatar.text(text: 'EF', size: AvatarSize.large),
                        const SizedBox(width: 16),
                        BaseAvatar.text(
                          text: 'Custom',
                          diameter: 60,
                          backgroundColor: Colors.purple,
                          borderWidth: 2,
                          borderColor: Colors.purple.shade700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Icon Avatar Examples
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Icon Avatars', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        BaseAvatar.icon(icon: Icons.star, backgroundColor: Colors.orange),
                        const SizedBox(width: 16),
                        BaseAvatar.icon(icon: Icons.favorite, backgroundColor: Colors.red),
                        const SizedBox(width: 16),
                        BaseAvatar.icon(
                          icon: Icons.settings,
                          size: AvatarSize.large,
                          backgroundColor: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Image Avatar Examples
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Image Avatars', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        BaseAvatar.image(
                          imageProvider: const NetworkImage('https://picsum.photos/100/100?random=1'),
                          size: AvatarSize.small,
                        ),
                        const SizedBox(width: 16),
                        BaseAvatar.image(
                          imageProvider: const NetworkImage('https://picsum.photos/100/100?random=2'),
                          size: AvatarSize.medium,
                          borderWidth: 2,
                          borderColor: Colors.blue,
                        ),
                        const SizedBox(width: 16),
                        BaseAvatar.image(
                          imageProvider: const NetworkImage('https://invalid-url.com/image.jpg'),
                          size: AvatarSize.large,
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

  Widget _buildInteractiveAvatar() {
    switch (_selectedType) {
      case AvatarType.text:
        return BaseAvatar.text(
          text: _text,
          size: _selectedSize,
          diameter: _customDiameter,
          backgroundColor: _backgroundColor,
          textColor: _textColor,
          borderWidth: _borderWidth,
          borderColor: _borderColor,
          onTap: _hasOnTap ? _showTapMessage : null,
          enabled: _enabled,
          semanticLabel: 'Interactive text avatar',
        );
      case AvatarType.icon:
        return BaseAvatar.icon(
          icon: _selectedIcon,
          size: _selectedSize,
          diameter: _customDiameter,
          backgroundColor: _backgroundColor,
          iconColor: _textColor,
          borderWidth: _borderWidth,
          borderColor: _borderColor,
          onTap: _hasOnTap ? _showTapMessage : null,
          enabled: _enabled,
          semanticLabel: 'Interactive icon avatar',
        );
      case AvatarType.image:
        return BaseAvatar.image(
          imageProvider: const NetworkImage('https://picsum.photos/100/100?random=3'),
          size: _selectedSize,
          diameter: _customDiameter,
          backgroundColor: _backgroundColor,
          borderWidth: _borderWidth,
          borderColor: _borderColor,
          onTap: _hasOnTap ? _showTapMessage : null,
          enabled: _enabled,
          semanticLabel: 'Interactive image avatar',
        );
    }
  }
}