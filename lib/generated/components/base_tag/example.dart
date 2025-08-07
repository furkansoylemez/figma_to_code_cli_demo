import 'package:flutter/material.dart';
import './base_tag.dart';

class BaseTagExamplePage extends StatefulWidget {
  const BaseTagExamplePage({super.key});

  @override
  State<BaseTagExamplePage> createState() => _BaseTagExamplePageState();
}

class _BaseTagExamplePageState extends State<BaseTagExamplePage> {
  String _text = 'Sample Tag';
  bool _showCloseIcon = false;
  bool _showPlusIcon = false;
  bool _hasDashedBorder = false;
  bool _isDisabled = false;
  double _borderWidth = 1.0;
  double _horizontalPadding = 8.0;
  double _verticalPadding = 4.0;
  double _iconSize = 12.0;
  double _backgroundOpacity = 0.02;
  double _textOpacity = 0.88;
  Color _backgroundColor = Colors.blue;
  Color _borderColor = Colors.blue;
  Color _textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('base_tag Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Interactive Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            // Interactive tag display
            Center(
              child: BaseTag(
                text: _text,
                showCloseIcon: _showCloseIcon,
                showPlusIcon: _showPlusIcon,
                hasDashedBorder: _hasDashedBorder,
                isDisabled: _isDisabled,
                backgroundColor: _backgroundColor,
                borderColor: _borderColor,
                textColor: _textColor,
                borderWidth: _borderWidth,
                horizontalPadding: _horizontalPadding,
                verticalPadding: _verticalPadding,
                iconSize: _iconSize,
                backgroundOpacity: _backgroundOpacity,
                textOpacity: _textOpacity,
                onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tag tapped!')),
                ),
                onClose: _showCloseIcon ? () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Close tapped!')),
                ) : null,
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Controls
            TextField(
              decoration: const InputDecoration(labelText: 'Tag Text'),
              onChanged: (value) => setState(() => _text = value.isEmpty ? 'Sample Tag' : value),
            ),
            
            const SizedBox(height: 16),
            
            SwitchListTile(
              title: const Text('Show Close Icon'),
              value: _showCloseIcon,
              onChanged: (value) => setState(() => _showCloseIcon = value),
            ),
            
            SwitchListTile(
              title: const Text('Show Plus Icon'),
              value: _showPlusIcon,
              onChanged: (value) => setState(() => _showPlusIcon = value),
            ),
            
            SwitchListTile(
              title: const Text('Dashed Border'),
              value: _hasDashedBorder,
              onChanged: (value) => setState(() => _hasDashedBorder = value),
            ),
            
            SwitchListTile(
              title: const Text('Disabled'),
              value: _isDisabled,
              onChanged: (value) => setState(() => _isDisabled = value),
            ),
            
            const SizedBox(height: 16),
            
            Text('Border Width: ${_borderWidth.toStringAsFixed(1)}'),
            Slider(
              value: _borderWidth,
              min: 0.5,
              max: 4.0,
              divisions: 7,
              onChanged: (value) => setState(() => _borderWidth = value),
            ),
            
            Text('Horizontal Padding: ${_horizontalPadding.toStringAsFixed(1)}'),
            Slider(
              value: _horizontalPadding,
              min: 4.0,
              max: 20.0,
              divisions: 16,
              onChanged: (value) => setState(() => _horizontalPadding = value),
            ),
            
            Text('Icon Size: ${_iconSize.toStringAsFixed(1)}'),
            Slider(
              value: _iconSize,
              min: 8.0,
              max: 20.0,
              divisions: 12,
              onChanged: (value) => setState(() => _iconSize = value),
            ),
            
            Text('Background Opacity: ${_backgroundOpacity.toStringAsFixed(2)}'),
            Slider(
              value: _backgroundOpacity,
              min: 0.0,
              max: 1.0,
              divisions: 20,
              onChanged: (value) => setState(() => _backgroundOpacity = value),
            ),
            
            const SizedBox(height: 32),
            
            const Text(
              'Basic Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            const Text('Standard Colorful Tag:'),
            const SizedBox(height: 8),
            BaseTag.colorful(
              text: 'Success',
              backgroundColor: Colors.green.shade100,
              borderColor: Colors.green,
              textColor: Colors.green.shade800,
              onTap: () {},
            ),
            
            const SizedBox(height: 16),
            
            const Text('Closable Tag:'),
            const SizedBox(height: 8),
            BaseTag.closable(
              text: 'Remove me',
              backgroundColor: Colors.red.shade50,
              borderColor: Colors.red.shade300,
              textColor: Colors.red.shade700,
              onClose: () {},
            ),
            
            const SizedBox(height: 16),
            
            const Text('Add New Tag:'),
            const SizedBox(height: 8),
            BaseTag.addNew(
              text: 'Add new item',
              borderColor: Colors.grey.shade400,
              textColor: Colors.grey.shade600,
              onTap: () {},
            ),
            
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}