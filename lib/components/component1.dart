import 'package:figma_to_code_light/design_system/theme/extensions/colors.dart';
import 'package:figma_to_code_light/design_system/theme/extensions/typography.dart';
import 'package:flutter/material.dart';

class BaseTypeDefaultDestructiveFalse extends StatefulWidget {
  final String label;
  final String placeholder;
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  const BaseTypeDefaultDestructiveFalse({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<BaseTypeDefaultDestructiveFalse> createState() =>
      _BaseTypeDefaultDestructiveFalseState();
}

class _BaseTypeDefaultDestructiveFalseState
    extends State<BaseTypeDefaultDestructiveFalse> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: theme
                    .extension<CustomTypography>()!
                    .textSmMedium
                    .copyWith(color: theme.extension<CustomColors>()!.gray700),
              ),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: theme.extension<CustomColors>()!.white,
                  border: Border.all(
                    color: theme.extension<CustomColors>()!.gray300,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Icon(
                        Icons.mail_outline,
                        size: 20,
                        color: theme.extension<CustomColors>()!.gray500,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        enabled: widget.enabled,
                        onChanged: widget.onChanged,
                        style: theme
                            .extension<CustomTypography>()!
                            .textMdRegular
                            .copyWith(
                              color: theme.extension<CustomColors>()!.gray500,
                            ),
                        decoration: InputDecoration(
                          hintText: widget.placeholder,
                          hintStyle: theme
                              .extension<CustomTypography>()!
                              .textMdRegular
                              .copyWith(
                                color: theme.extension<CustomColors>()!.gray500,
                              ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Icon(
                        Icons.help_outline,
                        size: 20,
                        color: theme.extension<CustomColors>()!.gray400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 6),
        Text(
          widget.hintText,
          style: theme.extension<CustomTypography>()!.textSmRegular.copyWith(
            color: theme.extension<CustomColors>()!.gray600,
          ),
        ),
      ],
    );
  }
}
// Import your widget here
// import 'path_to_your_widget/base_type_default_destructive_false.dart';

class InputFieldShowcasePage extends StatefulWidget {
  const InputFieldShowcasePage({Key? key}) : super(key: key);

  @override
  State<InputFieldShowcasePage> createState() => _InputFieldShowcasePageState();
}

class _InputFieldShowcasePageState extends State<InputFieldShowcasePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-populate some fields for demonstration
    _emailController.text = 'john.doe@example.com';
    _companyController.text = 'Acme Corporation';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor:
          theme.extension<CustomColors>()?.gray50 ?? Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Input Field Showcase',
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
            Container(
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
                    'BaseTypeDefaultDestructiveFalse',
                    style: theme
                        .extension<CustomTypography>()
                        ?.textXlSemibold
                        ?.copyWith(
                          color: theme.extension<CustomColors>()?.gray900,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A customizable input field component with label, placeholder, hint text, and icon support.',
                    style: theme
                        .extension<CustomTypography>()
                        ?.textMdRegular
                        ?.copyWith(
                          color: theme.extension<CustomColors>()?.gray600,
                        ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Basic Examples Section
            _buildSection(
              'Basic Examples',
              'Standard input fields with different configurations',
              [
                BaseTypeDefaultDestructiveFalse(
                  label: 'Email Address',
                  placeholder: 'Enter your email address',
                  hintText: 'We\'ll use this to send you important updates',
                  controller: _emailController,
                  onChanged: (value) {
                    print('Email changed: $value');
                  },
                ),

                const SizedBox(height: 24),

                BaseTypeDefaultDestructiveFalse(
                  label: 'Full Name',
                  placeholder: 'John Doe',
                  hintText: 'Enter your first and last name',
                  controller: _nameController,
                  onChanged: (value) {
                    print('Name changed: $value');
                  },
                ),

                const SizedBox(height: 24),

                BaseTypeDefaultDestructiveFalse(
                  label: 'Phone Number',
                  placeholder: '+1 (555) 123-4567',
                  hintText: 'Include country code for international numbers',
                  controller: _phoneController,
                  onChanged: (value) {
                    print('Phone changed: $value');
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Pre-filled Example
            _buildSection(
              'Pre-filled Input',
              'Input field with existing content',
              [
                BaseTypeDefaultDestructiveFalse(
                  label: 'Company Name',
                  placeholder: 'Enter company name',
                  hintText: 'The organization you work for',
                  controller: _companyController,
                  onChanged: (value) {
                    print('Company changed: $value');
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Disabled State
            _buildSection('Disabled State', 'Input field in disabled state', [
              BaseTypeDefaultDestructiveFalse(
                label: 'Account ID',
                placeholder: 'Auto-generated',
                hintText: 'This field is automatically populated',
                enabled: false,
                onChanged: (value) {
                  print('Account ID changed: $value');
                },
              ),
            ]),

            const SizedBox(height: 32),

            // Different Use Cases
            _buildSection(
              'Various Use Cases',
              'Different scenarios where this input field can be used',
              [
                BaseTypeDefaultDestructiveFalse(
                  label: 'Username',
                  placeholder: 'Choose a unique username',
                  hintText: 'Must be 3-20 characters, letters and numbers only',
                ),

                const SizedBox(height: 24),

                BaseTypeDefaultDestructiveFalse(
                  label: 'Website URL',
                  placeholder: 'https://example.com',
                  hintText:
                      'Optional: Link to your personal or business website',
                ),

                const SizedBox(height: 24),

                BaseTypeDefaultDestructiveFalse(
                  label: 'Referral Code',
                  placeholder: 'Enter referral code',
                  hintText:
                      'Have a referral code? Enter it here for special benefits',
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
            'Properties',
            style: theme
                .extension<CustomTypography>()
                ?.textLgSemibold
                ?.copyWith(color: theme.extension<CustomColors>()?.gray900),
          ),
          const SizedBox(height: 16),
          _buildPropertyRow(
            'label',
            'String',
            'Required',
            'The label text displayed above the input',
          ),
          _buildPropertyRow(
            'placeholder',
            'String',
            'Required',
            'Placeholder text shown inside the input',
          ),
          _buildPropertyRow(
            'hintText',
            'String',
            'Required',
            'Helper text displayed below the input',
          ),
          _buildPropertyRow(
            'controller',
            'TextEditingController?',
            'Optional',
            'Text editing controller for the input',
          ),
          _buildPropertyRow(
            'onChanged',
            'ValueChanged<String>?',
            'Optional',
            'Callback fired when text changes',
          ),
          _buildPropertyRow(
            'enabled',
            'bool',
            'Optional (default: true)',
            'Whether the input is enabled or disabled',
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
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: Text(
              name,
              style: theme
                  .extension<CustomTypography>()
                  ?.textSmMedium
                  ?.copyWith(color: theme.extension<CustomColors>()?.gray900),
            ),
          ),
          Container(
            width: 180,
            child: Text(
              type,
              style: theme
                  .extension<CustomTypography>()
                  ?.textSmRegular
                  ?.copyWith(color: theme.extension<CustomColors>()?.blue600),
            ),
          ),
          Container(
            width: 120,
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
}
