import 'package:flutter/material.dart';
import './status_badge.dart';

class StatusBadgeExamplePage extends StatefulWidget {
  const StatusBadgeExamplePage({super.key});

  @override
  State<StatusBadgeExamplePage> createState() => _StatusBadgeExamplePageState();
}

class _StatusBadgeExamplePageState extends State<StatusBadgeExamplePage> {
  String _text = 'Status Badge';
  Color _indicatorColor = Colors.green;
  Color _indicatorBorderColor = Colors.white;
  Color _textColor = Colors.black87;
  double _indicatorSize = 6.0;
  double _indicatorBorderWidth = 2.0;
  double _spacing = 8.0;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  bool _isInteractive = false;
  bool _hasPadding = false;

  final List<Color> _colorOptions = [
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.grey,
  ];

  final List<MainAxisAlignment> _alignmentOptions = [
    MainAxisAlignment.start,
    MainAxisAlignment.center,
    MainAxisAlignment.end,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('status_badge Example'),
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
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Badge Text',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _text = value.isNotEmpty ? value : 'Status Badge';
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text('Indicator Color'),
                    Wrap(
                      spacing: 8,
                      children: _colorOptions.map((color) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _indicatorColor = color;
                            });
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: _indicatorColor == color
                                  ? Border.all(color: Colors.black, width: 2)
                                  : null,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    Text('Indicator Size: ${_indicatorSize.toInt()}px'),
                    Slider(
                      value: _indicatorSize,
                      min: 4.0,
                      max: 20.0,
                      divisions: 16,
                      onChanged: (value) {
                        setState(() {
                          _indicatorSize = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Text('Spacing: ${_spacing.toInt()}px'),
                    Slider(
                      value: _spacing,
                      min: 4.0,
                      max: 24.0,
                      divisions: 20,
                      onChanged: (value) {
                        setState(() {
                          _spacing = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text('Alignment'),
                    DropdownButton<MainAxisAlignment>(
                      value: _mainAxisAlignment,
                      isExpanded: true,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _mainAxisAlignment = value;
                          });
                        }
                      },
                      items: _alignmentOptions.map((alignment) {
                        return DropdownMenuItem(
                          value: alignment,
                          child: Text(alignment.toString().split('.').last),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: const Text('Interactive'),
                      subtitle: const Text('Makes badge tappable'),
                      value: _isInteractive,
                      onChanged: (value) {
                        setState(() {
                          _isInteractive = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Add Padding'),
                      subtitle: const Text('Adds padding around badge'),
                      value: _hasPadding,
                      onChanged: (value) {
                        setState(() {
                          _hasPadding = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text('Preview:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: StatusBadge(
                        text: _text,
                        indicatorColor: _indicatorColor,
                        indicatorBorderColor: _indicatorBorderColor,
                        textColor: _textColor,
                        indicatorSize: _indicatorSize,
                        spacing: _spacing,
                        mainAxisAlignment: _mainAxisAlignment,
                        padding: _hasPadding ? const EdgeInsets.all(8.0) : null,
                        onTap: _isInteractive ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Badge tapped!')),
                          );
                        } : null,
                      ),
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
                    const Text('Success Status', style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Green indicator for positive states'),
                    const SizedBox(height: 8),
                    const StatusBadge(
                      text: 'Connected',
                      indicatorColor: Colors.green,
                    ),
                    const SizedBox(height: 16),
                    const Text('Error Status', style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Red indicator with custom styling'),
                    const SizedBox(height: 8),
                    StatusBadge(
                      text: 'Connection Failed',
                      indicatorColor: Colors.red,
                      indicatorSize: 8.0,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Interactive Badge', style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Tappable badge with padding'),
                    const SizedBox(height: 8),
                    StatusBadge(
                      text: 'Tap me!',
                      indicatorColor: Colors.blue,
                      padding: const EdgeInsets.all(8.0),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Example badge tapped!')),
                        );
                      },
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