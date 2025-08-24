import 'package:flutter/material.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';

import 'component4.dart';

class BaseInputFieldShowcasePage extends StatefulWidget {
  const BaseInputFieldShowcasePage({super.key});

  @override
  State<BaseInputFieldShowcasePage> createState() =>
      _BaseInputFieldShowcasePageState();
}

class _BaseInputFieldShowcasePageState
    extends State<BaseInputFieldShowcasePage> {
  final TextEditingController _basicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _multilineController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();

  String? _selectedCountryCode = '+1';
  String? _selectedCurrency = 'USD';
  bool _hasError = false;

  @override
  void dispose() {
    _basicController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _amountController.dispose();
    _multilineController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>();
    final typography = Theme.of(context).extension<CustomTypography>();

    return Scaffold(
      backgroundColor: colors?.gray50,
      appBar: AppBar(
        title: Text(
          'BaseInputField Showcase',
          style: typography?.textLgSemibold,
        ),
        backgroundColor: colors?.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Basic Input Fields', [
              BaseInputFieldBase(
                label: 'Full Name',
                placeholder: 'Enter your full name',
                controller: _basicController,
              ),
              const SizedBox(height: 16),
              BaseInputFieldBase(
                label: 'Email Address',
                placeholder: 'john@example.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'We\'ll never share your email with anyone else.',
              ),
            ]),
            _buildSection('Input Fields with Icons', [
              BaseInputFieldBase(
                label: 'Search',
                placeholder: 'Search for anything...',
                leadingIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: colors?.gray400,
                ),
              ),
              const SizedBox(height: 16),
              BaseInputFieldBase(
                label: 'Password',
                placeholder: 'Enter your password',
                controller: _passwordController,
                obscureText: true,
                trailingIcon: Icon(
                  Icons.visibility_off,
                  size: 20,
                  color: colors?.gray400,
                ),
              ),
            ]),
            _buildSection('Phone Number Input', [
              BaseInputFieldBase(
                label: 'Phone Number',
                placeholder: '(555) 000-0000',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                leadingDropdownValue: _selectedCountryCode,
                leadingDropdownItems: ['+1', '+44', '+49', '+33'],
                onLeadingDropdownTap: () => _showCountryCodePicker(),
                hintText: 'Select country code and enter phone number',
              ),
            ]),
            _buildSection('Payment Method Input', [
              BaseInputFieldBase(
                label: 'Card Number',
                placeholder: '1234 5678 9012 3456',
                controller: _cardController,
                keyboardType: TextInputType.number,
                paymentMethodIcon: Icon(
                  Icons.credit_card,
                  size: 16,
                  color: colors?.gray600,
                ),
                maxLength: 19,
              ),
            ]),
            _buildSection('Currency Input', [
              BaseInputFieldBase(
                label: 'Amount',
                placeholder: '0.00',
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                currencySymbol: '\$',
                trailingDropdownValue: _selectedCurrency,
                trailingDropdownItems: ['USD', 'EUR', 'GBP', 'JPY'],
                onTrailingDropdownTap: () => _showCurrencyPicker(),
              ),
            ]),
            _buildSection('Input with Leading Text', [
              BaseInputFieldBase(
                label: 'Website URL',
                placeholder: 'mywebsite',
                leadingText: 'https://',
                hintText: 'Enter your website domain',
              ),
            ]),
            _buildSection('Multiline Input', [
              BaseInputFieldBase(
                label: 'Description',
                placeholder: 'Tell us about yourself...',
                controller: _multilineController,
                maxLines: 4,
                maxLength: 500,
              ),
            ]),
            _buildSection('Input States', [
              BaseInputFieldBase(
                label: 'Disabled Input',
                placeholder: 'This field is disabled',
                enabled: false,
                value: 'Cannot edit this',
              ),
              const SizedBox(height: 16),
              BaseInputFieldBase(
                label: 'Input with Help',
                placeholder: 'Click the help icon',
                onHelpIconTap: () => _showHelpDialog(),
                hintText: 'Click the help icon for more information',
              ),
              const SizedBox(height: 16),
              BaseInputFieldBase(
                label: 'Error State',
                placeholder: 'This field has an error',
                isDestructive: _hasError,
                errorText: _hasError ? 'This field is required' : null,
                hintText: _hasError
                    ? null
                    : 'Toggle error state with button below',
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => setState(() => _hasError = !_hasError),
                child: Text(_hasError ? 'Clear Error' : 'Show Error'),
              ),
            ]),
            _buildSection('Complex Example', [
              BaseInputFieldBase(
                label: 'International Transfer',
                placeholder: '0.00',
                leadingDropdownValue: '+1',
                leadingDropdownItems: ['+1', '+44', '+49'],
                currencySymbol: '\$',
                trailingDropdownValue: 'USD',
                trailingDropdownItems: ['USD', 'EUR', 'GBP'],
                onLeadingDropdownTap: () => _showCountryCodePicker(),
                onTrailingDropdownTap: () => _showCurrencyPicker(),
                hintText: 'Select country, currency and enter amount',
              ),
            ]),
            const SizedBox(height: 32),
            _buildCodeExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    final typography = Theme.of(context).extension<CustomTypography>();
    final colors = Theme.of(context).extension<CustomColors>();

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors?.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colors?.gray900?.withOpacity(0.05) ?? Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: typography?.textLgSemibold?.copyWith(color: colors?.gray900),
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildCodeExample() {
    final typography = Theme.of(context).extension<CustomTypography>();
    final colors = Theme.of(context).extension<CustomColors>();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colors?.gray900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Example Usage',
            style: typography?.textLgSemibold?.copyWith(color: colors?.white),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors?.gray800,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '''BaseInputFieldBase(
  label: 'Email Address',
  placeholder: 'john@example.com',
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  leadingIcon: Icon(Icons.email),
  hintText: 'Enter a valid email address',
  onChanged: (value) => print('Email: \$value'),
)''',
              style: typography?.textSmRegular?.copyWith(
                color: colors?.gray100,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCountryCodePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Country Code',
                style: Theme.of(
                  context,
                ).extension<CustomTypography>()?.textLgSemibold,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('+1 (United States)'),
                onTap: () {
                  setState(() => _selectedCountryCode = '+1');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('+44 (United Kingdom)'),
                onTap: () {
                  setState(() => _selectedCountryCode = '+44');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('+49 (Germany)'),
                onTap: () {
                  setState(() => _selectedCountryCode = '+49');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCurrencyPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Currency',
                style: Theme.of(
                  context,
                ).extension<CustomTypography>()?.textLgSemibold,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('USD - US Dollar'),
                onTap: () {
                  setState(() => _selectedCurrency = 'USD');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('EUR - Euro'),
                onTap: () {
                  setState(() => _selectedCurrency = 'EUR');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('GBP - British Pound'),
                onTap: () {
                  setState(() => _selectedCurrency = 'GBP');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Help Information'),
          content: const Text(
            'This is a help dialog that appears when you tap the help icon. '
            'You can use this to provide additional context or instructions to users.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Got it'),
            ),
          ],
        );
      },
    );
  }
}
