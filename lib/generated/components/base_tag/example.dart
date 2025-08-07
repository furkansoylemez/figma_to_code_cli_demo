import 'package:flutter/material.dart';
import './base_tag.dart';

class BaseTagExamplePage extends StatefulWidget {
  const BaseTagExamplePage({super.key});

  @override
  State<BaseTagExamplePage> createState() => _BaseTagExamplePageState();
}

class _BaseTagExamplePageState extends State<BaseTagExamplePage> {
  String _text = 'Sample Tag';
  BaseTagStyle _style = BaseTagStyle.filled;
  BaseTagSize _size = BaseTagSize.medium;
  bool _showLeadingIcon = false;
  bool _showTrailingIcon = false;
  bool _enabled = true;
  bool _hasOnPressed = true;
  Color? _backgroundColor;
  Color? _textColor;
  double _borderRadius = 4.0;
  double _spacing = 4.0;

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
            // Interactive Section
            Text(
              'Interactive Demo',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Live Preview
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      child: Center(
                        child: BaseTag(
                          text: _text,
                          style: _style,
                          size: _size,
                          backgroundColor: _backgroundColor,
                          textColor: _textColor,
                          borderRadius: _borderRadius,
                          spacing: _spacing,
                          enabled: _enabled,
                          leadingWidget: _showLeadingIcon 
                            ? const Icon(Icons.star, size: 16)
                            : null,
                          trailingWidget: _showTrailingIcon
                            ? const Icon(Icons.close, size: 16)
                            : null,
                          onPressed: _hasOnPressed 
                            ? () => ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Tag pressed!'))
                              )
                            : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Controls
                    _buildTextControl(),
                    const SizedBox(height: 16),
                    _buildStyleControl(),
                    const SizedBox(height: 16),
                    _buildSizeControl(),
                    const SizedBox(height: 16),
                    _buildBooleanControls(),
                    const SizedBox(height: 16),
                    _buildColorControls(),
                    const SizedBox(height: 16),
                    _buildSliderControls(),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Basic Examples Section
            Text(
              'Basic Examples',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildExample(
              'Default Tag',
              'Simple tag with default styling',
              const BaseTag(text: 'Default'),
            ),
            
            _buildExample(
              'Outlined with Icon',
              'Outlined style tag with leading icon',
              BaseTag(
                text: 'Add New',
                style: BaseTagStyle.outlined,
                leadingWidget: const Icon(Icons.add, size: 14),
                onPressed: () {},
              ),
            ),
            
            _buildExample(
              'Soft Style with Close',
              'Soft colored tag with trailing close button',
              BaseTag(
                text: 'Removable',
                style: BaseTagStyle.soft,
                size: BaseTagSize.large,
                trailingWidget: const Icon(Icons.close, size: 16),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Text Content', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          decoration: const InputDecoration(
            hintText: 'Enter tag text',
            border: OutlineInputBorder(),
            isDense: true,
          ),
          onChanged: (value) => setState(() => _text = value.isEmpty ? 'Sample Tag' : value),
        ),
      ],
    );
  }

  Widget _buildStyleControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Style', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        DropdownButton<BaseTagStyle>(
          value: _style,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: BaseTagStyle.filled, child: Text('Filled')),
            DropdownMenuItem(value: BaseTagStyle.outlined, child: Text('Outlined')),
            DropdownMenuItem(value: BaseTagStyle.soft, child: Text('Soft')),
          ],
          onChanged: (value) => setState(() => _style = value!),
        ),
      ],
    );
  }

  Widget _buildSizeControl() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Size', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        DropdownButton<BaseTagSize>(
          value: _size,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: BaseTagSize.small, child: Text('Small')),
            DropdownMenuItem(value: BaseTagSize.medium, child: Text('Medium')),
            DropdownMenuItem(value: BaseTagSize.large, child: Text('Large')),
          ],
          onChanged: (value) => setState(() => _size = value!),
        ),
      ],
    );
  }

  Widget _buildBooleanControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Options', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text('Leading Icon'),
          value: _showLeadingIcon,
          onChanged: (value) => setState(() => _showLeadingIcon = value),
          dense: true,
        ),
        SwitchListTile(
          title: const Text('Trailing Icon'),
          value: _showTrailingIcon,
          onChanged: (value) => setState(() => _showTrailingIcon = value),
          dense: true,
        ),
        SwitchListTile(
          title: const Text('Enabled'),
          value: _enabled,
          onChanged: (value) => setState(() => _enabled = value),
          dense: true,
        ),
        SwitchListTile(
          title: const Text('Has onPressed'),
          value: _hasOnPressed,
          onChanged: (value) => setState(() => _hasOnPressed = value),
          dense: true,
        ),
      ],
    );
  }

  Widget _buildColorControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Colors', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('Background: '),
            const SizedBox(width: 8),
            _colorButton(Colors.blue.shade100, () => setState(() => _backgroundColor = Colors.blue.shade100)),
            const SizedBox(width: 8),
            _colorButton(Colors.green.shade100, () => setState(() => _backgroundColor = Colors.green.shade100)),
            const SizedBox(width: 8),
            _colorButton(Colors.red.shade100, () => setState(() => _backgroundColor = Colors.red.shade100)),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() => _backgroundColor = null),
              child: const Text('Reset'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _colorButton(Color color, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSliderControls() {
    return Column(
      children: [
        Row(
          children: [
            const Text('Border Radius: '),
            Expanded(
              child: Slider(
                value: _borderRadius,
                min: 0,
                max: 20,
                divisions: 20,
                label: _borderRadius.toStringAsFixed(0),
                onChanged: (value) => setState(() => _borderRadius = value),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Spacing: '),
            Expanded(
              child: Slider(
                value: _spacing,
                min: 0,
                max: 16,
                divisions: 16,
                label: _spacing.toStringAsFixed(0),
                onChanged: (value) => setState(() => _spacing = value),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExample(String title, String description, Widget example) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 12),
            example,
          ],
        ),
      ),
    );
  }
}