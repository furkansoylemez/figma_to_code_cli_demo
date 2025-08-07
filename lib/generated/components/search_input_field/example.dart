import 'package:flutter/material.dart';
import './search_input_field.dart';

class SearchInputFieldExamplePage extends StatefulWidget {
  const SearchInputFieldExamplePage({super.key});

  @override
  State<SearchInputFieldExamplePage> createState() => _SearchInputFieldExamplePageState();
}

class _SearchInputFieldExamplePageState extends State<SearchInputFieldExamplePage> {
  final TextEditingController _controller = TextEditingController();
  
  String _placeholder = 'Search';
  bool _showClearButton = true;
  bool _enabled = true;
  double _height = 32.0;
  double _borderRadius = 6.0;
  double _borderWidth = 1.0;
  double _iconSize = 16.0;
  bool _autofocus = false;
  Color _backgroundColor = Colors.white;
  Color _borderColor = Colors.grey;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search_input_field Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Interactive Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SearchInputField(
              controller: _controller,
              placeholder: _placeholder,
              showClearButton: _showClearButton,
              enabled: _enabled,
              height: _height,
              borderRadius: _borderRadius,
              borderWidth: _borderWidth,
              iconSize: _iconSize,
              autofocus: _autofocus,
              backgroundColor: _backgroundColor,
              borderColor: _borderColor,
              onChanged: (value) {
                setState(() {});
              },
              onSubmitted: () {
                print('Search submitted: ${_controller.text}');
              },
            ),
            const SizedBox(height: 24),
            
            // Controls
            Text('Placeholder'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter placeholder text',
                isDense: true,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _placeholder = value.isEmpty ? 'Search' : value;
                });
              },
            ),
            const SizedBox(height: 16),
            
            SwitchListTile(
              title: Text('Show Clear Button'),
              value: _showClearButton,
              onChanged: (value) {
                setState(() {
                  _showClearButton = value;
                });
              },
            ),
            
            SwitchListTile(
              title: Text('Enabled'),
              value: _enabled,
              onChanged: (value) {
                setState(() {
                  _enabled = value;
                });
              },
            ),
            
            SwitchListTile(
              title: Text('Autofocus'),
              value: _autofocus,
              onChanged: (value) {
                setState(() {
                  _autofocus = value;
                });
              },
            ),
            
            Text('Height: ${_height.round()}'),
            Slider(
              value: _height,
              min: 24.0,
              max: 60.0,
              divisions: 36,
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
            ),
            
            Text('Border Radius: ${_borderRadius.round()}'),
            Slider(
              value: _borderRadius,
              min: 0.0,
              max: 20.0,
              divisions: 20,
              onChanged: (value) {
                setState(() {
                  _borderRadius = value;
                });
              },
            ),
            
            Text('Border Width: ${_borderWidth.toStringAsFixed(1)}'),
            Slider(
              value: _borderWidth,
              min: 0.0,
              max: 5.0,
              divisions: 50,
              onChanged: (value) {
                setState(() {
                  _borderWidth = value;
                });
              },
            ),
            
            Text('Icon Size: ${_iconSize.round()}'),
            Slider(
              value: _iconSize,
              min: 12.0,
              max: 24.0,
              divisions: 12,
              onChanged: (value) {
                setState(() {
                  _iconSize = value;
                });
              },
            ),
            
            const SizedBox(height: 32),
            const Text(
              'Basic Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            const Text('Default Search Field'),
            const SizedBox(height: 8),
            const SearchInputField(),
            const SizedBox(height: 16),
            
            const Text('Large Rounded Search Field'),
            const SizedBox(height: 8),
            SearchInputField(
              height: 48.0,
              borderRadius: 24.0,
              placeholder: 'Search products...',
              backgroundColor: Colors.grey[100],
              borderColor: Colors.blue,
            ),
            const SizedBox(height: 16),
            
            const Text('Compact Search Field'),
            const SizedBox(height: 8),
            const SearchInputField(
              height: 28.0,
              borderRadius: 14.0,
              placeholder: 'Quick search',
              iconSize: 14.0,
              showClearButton: false,
            ),
          ],
        ),
      ),
    );
  }
}