import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

enum BaseInputFieldType {
  defaultType,
  paymentInput,
  leadingDropdown,
  leadingText,
  trailingDropdown,
}

class BaseInputFieldBase extends StatefulWidget {
  final String label;
  final String? value;
  final String? placeholder;
  final String? hintText;
  final BaseInputFieldType type;
  final bool destructive;
  final Widget? leadingIcon;
  final String? leadingText;
  final String? dropdownValue;
  final List<String>? dropdownItems;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onDropdownChanged;
  final VoidCallback? onHelpPressed;

  const BaseInputFieldBase({
    Key? key,
    required this.label,
    this.value,
    this.placeholder,
    this.hintText,
    this.type = BaseInputFieldType.defaultType,
    this.destructive = false,
    this.leadingIcon,
    this.leadingText,
    this.dropdownValue,
    this.dropdownItems,
    this.onChanged,
    this.onDropdownChanged,
    this.onHelpPressed,
  }) : super(key: key);

  @override
  State<BaseInputFieldBase> createState() => _BaseInputFieldBaseState();
}

class _BaseInputFieldBaseState extends State<BaseInputFieldBase> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: theme.typographyy?.textSmMedium.copyWith(
            color: theme.colors?.gray700,
          ),
        ),
        const SizedBox(height: 6),
        _buildInput(theme),
        if (widget.hintText != null) ...[
          const SizedBox(height: 6),
          Text(
            widget.hintText!,
            style: theme.typographyy?.textSmRegular.copyWith(
              color: widget.destructive
                  ? theme.colors?.error500
                  : theme.colors?.gray600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInput(ThemeData theme) {
    final borderColor = widget.destructive
        ? theme.colors?.error300
        : theme.colors?.gray300;

    switch (widget.type) {
      case BaseInputFieldType.paymentInput:
        return _buildPaymentInput(theme, borderColor ?? Colors.grey);
      case BaseInputFieldType.leadingDropdown:
        return _buildLeadingDropdownInput(theme, borderColor ?? Colors.grey);
      case BaseInputFieldType.leadingText:
        return _buildLeadingTextInput(theme, borderColor ?? Colors.grey);
      case BaseInputFieldType.trailingDropdown:
        return _buildTrailingDropdownInput(theme, borderColor ?? Colors.grey);
      default:
        return _buildDefaultInput(theme, borderColor ?? Colors.grey);
    }
  }

  Widget _buildDefaultInput(ThemeData theme, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors?.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (widget.leadingIcon != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: widget.leadingIcon!,
            ),
          ],
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              style: theme.typographyy?.textMdRegular.copyWith(
                color: theme.colors?.gray500,
              ),
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: theme.typographyy?.textMdRegular.copyWith(
                  color: theme.colors?.gray500,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: widget.leadingIcon != null ? 12 : 14,
                  right: 14,
                  top: 10,
                  bottom: 10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: widget.onHelpPressed,
              child: Icon(
                widget.destructive ? Icons.error_outline : Icons.help_outline,
                size: 20,
                color: widget.destructive
                    ? theme.colors?.error500
                    : theme.colors?.gray400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentInput(ThemeData theme, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors?.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: _buildMastercardIcon(theme),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              style: theme.typographyy?.textMdRegular.copyWith(
                color: theme.colors?.gray500,
              ),
              decoration: InputDecoration(
                hintText: widget.placeholder ?? "Card number",
                hintStyle: theme.typographyy?.textMdRegular.copyWith(
                  color: theme.colors?.gray500,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  left: 12,
                  right: 14,
                  top: 10,
                  bottom: 10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: widget.onHelpPressed,
              child: Icon(
                widget.destructive ? Icons.error_outline : Icons.help_outline,
                size: 20,
                color: widget.destructive
                    ? theme.colors?.error500
                    : theme.colors?.gray400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingDropdownInput(ThemeData theme, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors?.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.dropdownValue ?? "US",
                  style: theme.typographyy?.textMdRegular.copyWith(
                    color: theme.colors?.gray900,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: theme.colors?.gray500,
                ),
              ],
            ),
          ),
          Container(width: 1, height: 44, color: theme.colors?.gray300),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              style: theme.typographyy?.textMdRegular.copyWith(
                color: theme.colors?.gray500,
              ),
              decoration: InputDecoration(
                hintText: widget.placeholder ?? "+1 (555) 000-0000",
                hintStyle: theme.typographyy?.textMdRegular.copyWith(
                  color: theme.colors?.gray500,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  left: 14,
                  right: 14,
                  top: 10,
                  bottom: 10,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: widget.onHelpPressed,
              child: Icon(
                widget.destructive ? Icons.error_outline : Icons.help_outline,
                size: 20,
                color: widget.destructive
                    ? theme.colors?.error500
                    : theme.colors?.gray400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeadingTextInput(ThemeData theme, Color borderColor) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.colors?.white,
            border: Border.all(color: theme.colors?.gray300 ?? Colors.grey),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            widget.leadingText ?? "http://",
            style: theme.typographyy?.textMdRegular.copyWith(
              color: theme.colors?.gray500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: theme.colors?.white,
              border: Border.all(color: borderColor),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: widget.onChanged,
                    style: theme.typographyy?.textMdRegular.copyWith(
                      color: theme.colors?.gray500,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.placeholder ?? "www.untitledui.com",
                      hintStyle: theme.typographyy?.textMdRegular.copyWith(
                        color: theme.colors?.gray500,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                        top: 10,
                        bottom: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: GestureDetector(
                    onTap: widget.onHelpPressed,
                    child: Icon(
                      widget.destructive
                          ? Icons.error_outline
                          : Icons.help_outline,
                      size: 20,
                      color: widget.destructive
                          ? theme.colors?.error500
                          : theme.colors?.gray400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrailingDropdownInput(ThemeData theme, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colors?.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: widget.onChanged,
                    style: theme.typographyy?.textMdRegular.copyWith(
                      color: theme.colors?.gray500,
                    ),
                    decoration: InputDecoration(
                      prefixText: "\$ ",
                      prefixStyle: theme.typographyy?.textMdRegular.copyWith(
                        color: theme.colors?.gray500,
                      ),
                      hintText: widget.placeholder ?? "1,000.00",
                      hintStyle: theme.typographyy?.textMdRegular.copyWith(
                        color: theme.colors?.gray500,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                        top: 10,
                        bottom: 10,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: GestureDetector(
                    onTap: widget.onHelpPressed,
                    child: Icon(
                      widget.destructive
                          ? Icons.error_outline
                          : Icons.help_outline,
                      size: 20,
                      color: widget.destructive
                          ? theme.colors?.error500
                          : theme.colors?.gray400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(width: 1, height: 44, color: theme.colors?.gray300),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.dropdownValue ?? "USD",
                  style: theme.typographyy?.textMdRegular.copyWith(
                    color: theme.colors?.gray900,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: theme.colors?.gray500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMastercardIcon(ThemeData theme) {
    return Container(
      width: 32,
      height: 20,
      decoration: BoxDecoration(
        color: theme.colors?.gray100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 4,
            top: 2,
            child: Container(
              width: 12,
              height: 16,
              decoration: const BoxDecoration(
                color: Color(0xFFEB001B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 2,
            child: Container(
              width: 12,
              height: 16,
              decoration: const BoxDecoration(
                color: Color(0xFFF79E1B),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension SasdX on ThemeData {
  CustomColors? get colors {
    return this.extension<CustomColors>();
  }
}

extension SassdX on ThemeData {
  CustomTypography? get typographyy {
    return this.extension<CustomTypography>();
  }
}
// Import your widget here
// import 'path_to_your_widget/base_input_field_base.dart';

class BaseInputFieldShowcasePage extends StatefulWidget {
  const BaseInputFieldShowcasePage({Key? key}) : super(key: key);

  @override
  State<BaseInputFieldShowcasePage> createState() =>
      _BaseInputFieldShowcasePageState();
}

class _BaseInputFieldShowcasePageState
    extends State<BaseInputFieldShowcasePage> {
  String _emailValue = 'john.doe@example.com';
  String _cardValue = '4532 1234 5678 9012';
  String _phoneValue = '(555) 123-4567';
  String _websiteValue = 'mycompany';
  String _amountValue = '2,500.00';
  String _phoneCountry = 'US';
  String _currency = 'USD';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor:
          theme.extension<CustomColors>()?.gray50 ?? Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'BaseInputFieldBase Showcase',
          style: theme.extension<CustomTypography>()?.textLgSemibold,
        ),
        backgroundColor: theme.extension<CustomColors>()?.white ?? Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(
          color: theme.extension<CustomColors>()?.gray700 ?? Colors.grey[700],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Header
            _buildHeader(theme),

            const SizedBox(height: 32),

            // Default Type Section
            _buildSection(
              'Default Input Fields',
              'Standard input fields with optional icons and help buttons',
              [
                BaseInputFieldBase(
                  label: 'Email Address',
                  value: _emailValue,
                  placeholder: 'Enter your email',
                  hintText: 'We\'ll use this to send you updates',
                  type: BaseInputFieldType.defaultType,
                  leadingIcon: Icon(
                    Icons.mail_outline,
                    size: 20,
                    color: theme.extension<CustomColors>()?.gray500,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _emailValue = value;
                    });
                  },
                  onHelpPressed: () {
                    _showHelp('Email addresses must be valid and unique');
                  },
                ),

                const SizedBox(height: 24),

                BaseInputFieldBase(
                  label: 'Full Name',
                  placeholder: 'Enter your full name',
                  hintText: 'First and last name',
                  type: BaseInputFieldType.defaultType,
                  leadingIcon: Icon(
                    Icons.person_outline,
                    size: 20,
                    color: theme.extension<CustomColors>()?.gray500,
                  ),
                  onChanged: (value) {
                    print('Name changed: $value');
                  },
                  onHelpPressed: () {
                    _showHelp(
                      'Please enter your legal name as it appears on your ID',
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Payment Input Section
            _buildSection(
              'Payment Input',
              'Specialized input for credit card numbers with Mastercard icon',
              [
                BaseInputFieldBase(
                  label: 'Credit Card Number',
                  value: _cardValue,
                  placeholder: '1234 5678 9012 3456',
                  hintText: 'Enter your 16-digit card number',
                  type: BaseInputFieldType.paymentInput,
                  onChanged: (value) {
                    setState(() {
                      _cardValue = value;
                    });
                  },
                  onHelpPressed: () {
                    _showHelp(
                      'Your card number is encrypted and stored securely',
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Destructive state example
                BaseInputFieldBase(
                  label: 'Invalid Card Number',
                  value: '1234 5678',
                  placeholder: '1234 5678 9012 3456',
                  hintText: 'Card number must be 16 digits',
                  type: BaseInputFieldType.paymentInput,
                  destructive: true,
                  onChanged: (value) {
                    print('Card changed: $value');
                  },
                  onHelpPressed: () {
                    _showHelp('Please enter a valid 16-digit card number');
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Leading Dropdown Section
            _buildSection(
              'Leading Dropdown Input',
              'Input field with a dropdown selector at the beginning (e.g., phone numbers)',
              [
                BaseInputFieldBase(
                  label: 'Phone Number',
                  value: _phoneValue,
                  placeholder: '(555) 123-4567',
                  hintText: 'Include area code',
                  type: BaseInputFieldType.leadingDropdown,
                  dropdownValue: _phoneCountry,
                  dropdownItems: ['US', 'CA', 'UK', 'AU'],
                  onChanged: (value) {
                    setState(() {
                      _phoneValue = value;
                    });
                  },
                  onDropdownChanged: (value) {
                    setState(() {
                      _phoneCountry = value;
                    });
                  },
                  onHelpPressed: () {
                    _showHelp(
                      'Select your country code and enter your phone number',
                    );
                  },
                ),

                const SizedBox(height: 24),

                BaseInputFieldBase(
                  label: 'International Phone',
                  placeholder: '123-456-7890',
                  hintText: 'Select country and enter number',
                  type: BaseInputFieldType.leadingDropdown,
                  dropdownValue: 'UK',
                  dropdownItems: ['US', 'CA', 'UK', 'AU', 'DE', 'FR'],
                  onChanged: (value) {
                    print('International phone: $value');
                  },
                  onHelpPressed: () {
                    _showHelp('Choose your country from the dropdown');
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Leading Text Section
            _buildSection(
              'Leading Text Input',
              'Input field with fixed text prefix (e.g., URLs)',
              [
                BaseInputFieldBase(
                  label: 'Website URL',
                  value: _websiteValue,
                  placeholder: 'example.com',
                  hintText: 'Enter your website domain',
                  type: BaseInputFieldType.leadingText,
                  leadingText: 'https://',
                  onChanged: (value) {
                    setState(() {
                      _websiteValue = value;
                    });
                  },
                  onHelpPressed: () {
                    _showHelp(
                      'Enter just the domain name, we\'ll add https://',
                    );
                  },
                ),

                const SizedBox(height: 24),

                BaseInputFieldBase(
                  label: 'API Endpoint',
                  placeholder: 'api/v1/users',
                  hintText: 'Specify the API path',
                  type: BaseInputFieldType.leadingText,
                  leadingText: 'https://api.mysite.com/',
                  onChanged: (value) {
                    print('API endpoint: $value');
                  },
                  onHelpPressed: () {
                    _showHelp('Enter the path relative to the base API URL');
                  },
                ),

                const SizedBox(height: 24),

                // Destructive state for leading text
                BaseInputFieldBase(
                  label: 'Invalid URL',
                  value: 'invalid-url-format',
                  placeholder: 'example.com',
                  hintText: 'Please enter a valid domain name',
                  type: BaseInputFieldType.leadingText,
                  leadingText: 'http://',
                  destructive: true,
                  onChanged: (value) {
                    print('Invalid URL: $value');
                  },
                  onHelpPressed: () {
                    _showHelp(
                      'Domain must be in valid format (e.g., example.com)',
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Trailing Dropdown Section
            _buildSection(
              'Trailing Dropdown Input',
              'Input field with dropdown selector at the end (e.g., currency amounts)',
              [
                BaseInputFieldBase(
                  label: 'Amount',
                  value: _amountValue,
                  placeholder: '0.00',
                  hintText: 'Enter the amount in your selected currency',
                  type: BaseInputFieldType.trailingDropdown,
                  dropdownValue: _currency,
                  dropdownItems: ['USD', 'EUR', 'GBP', 'CAD', 'AUD'],
                  onChanged: (value) {
                    setState(() {
                      _amountValue = value;
                    });
                  },
                  onDropdownChanged: (value) {
                    setState(() {
                      _currency = value;
                    });
                  },
                  onHelpPressed: () {
                    _showHelp(
                      'Enter amount and select your preferred currency',
                    );
                  },
                ),

                const SizedBox(height: 24),

                BaseInputFieldBase(
                  label: 'Budget Limit',
                  placeholder: '10,000.00',
                  hintText: 'Set maximum spending limit',
                  type: BaseInputFieldType.trailingDropdown,
                  dropdownValue: 'EUR',
                  dropdownItems: ['USD', 'EUR', 'GBP'],
                  onChanged: (value) {
                    print('Budget: $value');
                  },
                  onHelpPressed: () {
                    _showHelp('This will be your maximum spending limit');
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Destructive States Section
            _buildSection(
              'Error/Destructive States',
              'Input fields showing error states with red styling',
              [
                BaseInputFieldBase(
                  label: 'Invalid Email',
                  value: 'invalid-email',
                  placeholder: 'Enter valid email',
                  hintText: 'Please enter a valid email address',
                  type: BaseInputFieldType.defaultType,
                  destructive: true,
                  leadingIcon: Icon(
                    Icons.mail_outline,
                    size: 20,
                    color: theme.extension<CustomColors>()?.error500,
                  ),
                  onChanged: (value) {
                    print('Invalid email: $value');
                  },
                  onHelpPressed: () {
                    _showHelp('Email must include @ symbol and valid domain');
                  },
                ),

                const SizedBox(height: 24),

                BaseInputFieldBase(
                  label: 'Insufficient Amount',
                  value: '50.00',
                  placeholder: '100.00',
                  hintText: 'Minimum amount is \$100.00',
                  type: BaseInputFieldType.trailingDropdown,
                  dropdownValue: 'USD',
                  destructive: true,
                  onChanged: (value) {
                    print('Insufficient amount: $value');
                  },
                  onHelpPressed: () {
                    _showHelp('Please enter an amount of at least \$100.00');
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Properties Overview
            _buildPropertiesSection(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.extension<CustomColors>()?.white ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BaseInputFieldBase',
            style: theme
                .extension<CustomTypography>()
                ?.textXlSemibold
                ?.copyWith(color: theme.extension<CustomColors>()?.gray900),
          ),
          const SizedBox(height: 8),
          Text(
            'A comprehensive input field component with multiple types, configurations, and states. Supports default, payment, leading dropdown, leading text, and trailing dropdown variations.',
            style: theme.extension<CustomTypography>()?.textMdRegular?.copyWith(
              color: theme.extension<CustomColors>()?.gray600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildTypeChip('Default', theme),
              _buildTypeChip('Payment', theme),
              _buildTypeChip('Leading Dropdown', theme),
              _buildTypeChip('Leading Text', theme),
              _buildTypeChip('Trailing Dropdown', theme),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypeChip(String label, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: theme.extension<CustomColors>()?.blue50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.extension<CustomColors>()?.blue200 ?? Colors.blue,
        ),
      ),
      child: Text(
        label,
        style: theme.extension<CustomTypography>()?.textSmMedium?.copyWith(
          color: theme.extension<CustomColors>()?.blue700,
        ),
      ),
    );
  }

  Widget _buildSection(
    String title,
    String description,
    List<Widget> children,
  ) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.extension<CustomColors>()?.white ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme
                .extension<CustomTypography>()
                ?.textLgSemibold
                ?.copyWith(color: theme.extension<CustomColors>()?.gray900),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: theme.extension<CustomTypography>()?.textSmRegular?.copyWith(
              color: theme.extension<CustomColors>()?.gray600,
            ),
          ),
          const SizedBox(height: 24),
          ...children,
        ],
      ),
    );
  }

  Widget _buildPropertiesSection() {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.extension<CustomColors>()?.white ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Properties & Configuration',
            style: theme
                .extension<CustomTypography>()
                ?.textLgSemibold
                ?.copyWith(color: theme.extension<CustomColors>()?.gray900),
          ),
          const SizedBox(height: 16),

          // Core Properties
          Text(
            'Core Properties',
            style: theme
                .extension<CustomTypography>()
                ?.textMdSemibold
                ?.copyWith(color: theme.extension<CustomColors>()?.gray800),
          ),
          const SizedBox(height: 8),
          _buildPropertyRow(
            'label',
            'String',
            'Required',
            'The label text displayed above the input',
          ),
          _buildPropertyRow(
            'value',
            'String?',
            'Optional',
            'Initial value for the input field',
          ),
          _buildPropertyRow(
            'placeholder',
            'String?',
            'Optional',
            'Placeholder text shown inside the input',
          ),
          _buildPropertyRow(
            'hintText',
            'String?',
            'Optional',
            'Helper text displayed below the input',
          ),

          const SizedBox(height: 16),

          // Type & State
          Text(
            'Type & State',
            style: theme
                .extension<CustomTypography>()
                ?.textMdSemibold
                ?.copyWith(color: theme.extension<CustomColors>()?.gray800),
          ),
          const SizedBox(height: 8),
          _buildPropertyRow(
            'type',
            'BaseInputFieldType',
            'Optional (default)',
            'Type of input field (default, payment, etc.)',
          ),
          _buildPropertyRow(
            'destructive',
            'bool',
            'Optional (false)',
            'Whether to show error/destructive state',
          ),

          const SizedBox(height: 16),

          // Customization
          Text(
            'Customization',
            style: theme
                .extension<CustomTypography>()
                ?.textMdSemibold
                ?.copyWith(color: theme.extension<CustomColors>()?.gray800),
          ),
          const SizedBox(height: 8),
          _buildPropertyRow(
            'leadingIcon',
            'Widget?',
            'Optional',
            'Icon displayed at the start of the input',
          ),
          _buildPropertyRow(
            'leadingText',
            'String?',
            'Optional',
            'Fixed text prefix (for leadingText type)',
          ),
          _buildPropertyRow(
            'dropdownValue',
            'String?',
            'Optional',
            'Selected value for dropdown components',
          ),
          _buildPropertyRow(
            'dropdownItems',
            'List<String>?',
            'Optional',
            'Available options for dropdown',
          ),

          const SizedBox(height: 16),

          // Callbacks
          Text(
            'Callbacks',
            style: theme
                .extension<CustomTypography>()
                ?.textMdSemibold
                ?.copyWith(color: theme.extension<CustomColors>()?.gray800),
          ),
          const SizedBox(height: 8),
          _buildPropertyRow(
            'onChanged',
            'ValueChanged<String>?',
            'Optional',
            'Called when input text changes',
          ),
          _buildPropertyRow(
            'onDropdownChanged',
            'ValueChanged<String>?',
            'Optional',
            'Called when dropdown selection changes',
          ),
          _buildPropertyRow(
            'onHelpPressed',
            'VoidCallback?',
            'Optional',
            'Called when help icon is tapped',
          ),

          const SizedBox(height: 16),

          // Input Field Types
          Text(
            'Available Types',
            style: theme
                .extension<CustomTypography>()
                ?.textMdSemibold
                ?.copyWith(color: theme.extension<CustomColors>()?.gray800),
          ),
          const SizedBox(height: 8),
          _buildTypeDescription(
            'defaultType',
            'Standard input with optional leading icon',
          ),
          _buildTypeDescription(
            'paymentInput',
            'Credit card input with Mastercard icon',
          ),
          _buildTypeDescription(
            'leadingDropdown',
            'Input with dropdown selector at start (e.g., country codes)',
          ),
          _buildTypeDescription(
            'leadingText',
            'Input with fixed text prefix (e.g., https://)',
          ),
          _buildTypeDescription(
            'trailingDropdown',
            'Input with dropdown at end (e.g., currency selector)',
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyRow(
    String name,
    String type,
    String requirement,
    String description,
  ) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            child: Text(
              name,
              style: theme
                  .extension<CustomTypography>()
                  ?.textSmMedium
                  ?.copyWith(color: theme.extension<CustomColors>()?.gray900),
            ),
          ),
          Container(
            width: 140,
            child: Text(
              type,
              style: theme
                  .extension<CustomTypography>()
                  ?.textSmRegular
                  ?.copyWith(color: theme.extension<CustomColors>()?.blue600),
            ),
          ),
          Container(
            width: 100,
            child: Text(
              requirement,
              style: theme
                  .extension<CustomTypography>()
                  ?.textSmRegular
                  ?.copyWith(color: theme.extension<CustomColors>()?.gray600),
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: theme
                  .extension<CustomTypography>()
                  ?.textSmRegular
                  ?.copyWith(color: theme.extension<CustomColors>()?.gray600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeDescription(String type, String description) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140,
            child: Text(
              type,
              style: theme
                  .extension<CustomTypography>()
                  ?.textSmMedium
                  ?.copyWith(color: theme.extension<CustomColors>()?.purple600),
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: theme
                  .extension<CustomTypography>()
                  ?.textSmRegular
                  ?.copyWith(color: theme.extension<CustomColors>()?.gray600),
            ),
          ),
        ],
      ),
    );
  }

  void _showHelp(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
