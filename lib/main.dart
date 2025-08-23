import 'package:figma_to_code_light/design_system/theme/app_theme.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:figma_to_code_light/input.dart';
import 'package:figma_to_code_light/screens/screen14.dart';
import 'package:figma_to_code_light/screens/screen16.dart';
import 'package:figma_to_code_light/screens/screen17.dart';
import 'package:figma_to_code_light/screens/screen18.dart';
import 'package:flutter/material.dart';

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
      home: RenimEriklerimScreen(),
    );
  }
}

/// Showcase page for BaseInputFieldBase demonstrating common variants
class BaseInputFieldShowcase extends StatefulWidget {
  const BaseInputFieldShowcase({super.key});

  @override
  State<BaseInputFieldShowcase> createState() => _BaseInputFieldShowcaseState();
}

class _BaseInputFieldShowcaseState extends State<BaseInputFieldShowcase> {
  // Controllers for examples
  final _defaultCtrl = TextEditingController(text: '');
  final _leadDdCtrl = TextEditingController(text: '532 123 45 67');
  final _trailDdCtrl = TextEditingController(text: 'Türkiye');
  final _leadTextCtrl = TextEditingController(text: 'example.com');
  final _paymentCtrl = TextEditingController(text: '');

  // Demo state
  bool _enabled = true;
  bool _destructive = false;
  String _leadingDropdownValue = 'TR';
  String _trailingDropdownValue = '🇹🇷';

  @override
  void dispose() {
    _defaultCtrl.dispose();
    _leadDdCtrl.dispose();
    _trailDdCtrl.dispose();
    _leadTextCtrl.dispose();
    _paymentCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>();
    final typo = Theme.of(context).extension<CustomTypography>();

    return Scaffold(
      appBar: AppBar(title: const Text('BaseInputField Showcase')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildToggles(context),
          const SizedBox(height: 16),

          // Default
          _Section(
            title: 'Default',
            child: BaseInputFieldBase(
              label: 'Full name',
              hintText: 'This will be shown on your profile',
              inputText: 'John Appleseed',
              type: BaseInputFieldType.defaultType,
              enabled: _enabled,
              destructive: _destructive
                  ? BaseInputFieldDestructive.trueValue
                  : BaseInputFieldDestructive.falseValue,
              controller: _defaultCtrl,
              onChanged: (v) => debugPrint('Default changed: $v'),
            ),
          ),

          const SizedBox(height: 12),

          // Leading dropdown
          _Section(
            title: 'Leading Dropdown',
            trailing: DropdownButton<String>(
              value: _leadingDropdownValue,
              items: const [
                DropdownMenuItem(value: 'TR', child: Text('TR')),
                DropdownMenuItem(value: 'US', child: Text('US')),
                DropdownMenuItem(value: 'DE', child: Text('DE')),
              ],
              onChanged: (v) => setState(() => _leadingDropdownValue = v!),
            ),
            child: BaseInputFieldBase(
              label: 'Phone number',
              hintText: 'Use your active number',
              inputText: '5XX XXX XX XX',
              type: BaseInputFieldType.leadingDropdown,
              leadingText: _leadingDropdownValue,
              enabled: _enabled,
              destructive: _destructive
                  ? BaseInputFieldDestructive.trueValue
                  : BaseInputFieldDestructive.falseValue,
              controller: _leadDdCtrl,
              onChanged: (v) => debugPrint('LeadingDD changed: $v'),
            ),
          ),

          const SizedBox(height: 12),

          // Trailing dropdown
          _Section(
            title: 'Trailing Dropdown',
            trailing: DropdownButton<String>(
              value: _trailingDropdownValue,
              items: const [
                DropdownMenuItem(value: '🇹🇷', child: Text('🇹🇷')),
                DropdownMenuItem(value: '🇺🇸', child: Text('🇺🇸')),
                DropdownMenuItem(value: '🇩🇪', child: Text('🇩🇪')),
              ],
              onChanged: (v) => setState(() => _trailingDropdownValue = v!),
            ),
            child: BaseInputFieldBase(
              label: 'Country',
              hintText: 'Where do you live?',
              inputText: 'Select…',
              type: BaseInputFieldType.trailingDropdown,
              enabled: _enabled,
              destructive: _destructive
                  ? BaseInputFieldDestructive.trueValue
                  : BaseInputFieldDestructive.falseValue,
              controller: _trailDdCtrl,
              onChanged: (v) => debugPrint('TrailingDD changed: $v'),
            ),
          ),

          const SizedBox(height: 12),

          // Leading text
          _Section(
            title: 'Leading Text',
            child: BaseInputFieldBase(
              label: 'Website',
              hintText: 'Your company website',
              inputText: 'yourdomain.com',
              type: BaseInputFieldType.leadingText,
              leadingText: 'https://',
              enabled: _enabled,
              destructive: _destructive
                  ? BaseInputFieldDestructive.trueValue
                  : BaseInputFieldDestructive.falseValue,
              controller: _leadTextCtrl,
              onChanged: (v) => debugPrint('LeadingText changed: $v'),
            ),
          ),

          const SizedBox(height: 12),

          // Payment input
          _Section(
            title: 'Payment Input',
            child: BaseInputFieldBase(
              label: 'Card number',
              hintText: 'We never store your card',
              inputText: '1234 5678 9012 3456',
              type: BaseInputFieldType.paymentInput,
              enabled: _enabled,
              destructive: _destructive
                  ? BaseInputFieldDestructive.trueValue
                  : BaseInputFieldDestructive.falseValue,
              controller: _paymentCtrl,
              onChanged: (v) => debugPrint('Payment changed: $v'),
            ),
          ),

          const SizedBox(height: 24),

          // Disabled preview
          _Section(
            title: 'Disabled Preview',
            subtitle: 'How inputs look when disabled',
            child: const _DisabledPreview(),
          ),

          const SizedBox(height: 32),
          if (colors != null && typo != null)
            _ThemeDebug(colors: colors, typography: typo),
        ],
      ),
    );
  }

  Widget _buildToggles(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Theme.of(context).dividerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Wrap(
          spacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Enabled'),
                Switch(
                  value: _enabled,
                  onChanged: (v) => setState(() => _enabled = v),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Destructive'),
                Switch(
                  value: _destructive,
                  onChanged: (v) => setState(() => _destructive = v),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final Widget child;

  const _Section({
    required this.title,
    required this.child,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.dividerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.titleMedium),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(subtitle!, style: theme.textTheme.bodySmall),
                      ],
                    ],
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _DisabledPreview extends StatelessWidget {
  const _DisabledPreview();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        BaseInputFieldBase(
          label: 'Disabled / Default',
          inputText: '—',
          hintText: 'Not editable',
          enabled: false,
        ),
        SizedBox(height: 8),
        BaseInputFieldBase(
          label: 'Disabled / Leading Text',
          inputText: 'user',
          hintText: 'example.com/user',
          type: BaseInputFieldType.leadingText,
          leadingText: 'https://',
          enabled: false,
        ),
      ],
    );
  }
}

class _ThemeDebug extends StatelessWidget {
  final CustomColors colors;
  final CustomTypography typography;
  const _ThemeDebug({required this.colors, required this.typography});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ExpansionTile(
      title: const Text('Theme debug (extensions)'),
      subtitle: Text('CustomColors & CustomTypography present'),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _Chip(
              'Text Primary',
              Container(width: 18, height: 18, color: colors.textColortext),
            ),
            _Chip(
              'Text Secondary',
              Container(
                width: 18,
                height: 18,
                color: colors.textColortextsecondary,
              ),
            ),
            _Chip(
              'Border',
              Container(width: 18, height: 18, color: colors.borderColorborder),
            ),
            _Chip(
              'Error',
              Container(width: 18, height: 18, color: colors.error100),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text('Typography samples', style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        Text('textSmMedium', style: typography.textSmMedium),
        Text('textSmRegular', style: typography.textSmRegular),
        Text('textMdRegular', style: typography.textMdRegular),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Widget swatch;
  const _Chip(this.label, this.swatch);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [swatch, const SizedBox(width: 8), Text(label)],
      ),
    );
  }
}
