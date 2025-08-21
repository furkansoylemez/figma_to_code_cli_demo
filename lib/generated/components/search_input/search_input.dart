import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

enum SearchInputVariant { search, inputForm, inputBasic }
enum SearchInputSize { medium, large }

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    this.variant = SearchInputVariant.search,
    this.size = SearchInputSize.medium,
    this.placeholder = 'Search',
    this.value,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.showLabel = false,
    this.label = 'Input Label',
    this.showDescription = false,
    this.description = 'This is a caption under a text input.',
    this.showPrefixIcon = false,
    this.showSuffixIcon = false,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
  });

  final SearchInputVariant variant;
  final SearchInputSize size;
  final String placeholder;
  final String? value;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final bool showLabel;
  final String label;
  final bool showDescription;
  final String description;
  final bool showPrefixIcon;
  final bool showSuffixIcon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.value);
    _focusNode = FocusNode();
    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = _controller.text.isNotEmpty;
    });
    widget.onChanged?.call(_controller.text);
  }

  void _onFocusChanged() {
    setState(() {});
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.variant == SearchInputVariant.inputForm && widget.showLabel)
          _buildLabel(customColors),
        _buildInputField(customColors),
        if (widget.variant == SearchInputVariant.inputForm && widget.showDescription)
          _buildDescription(customColors),
      ],
    );
  }

  Widget _buildLabel(CustomColors? customColors) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: customColors?.textColorText ?? 
                     Theme.of(context).colorScheme.onSurface.withOpacity(0.88),
              fontSize: 14,
              height: 24/14,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.help_outline,
            size: 14,
            color: customColors?.colorIcon ?? 
                   Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(CustomColors? customColors) {
    final isLarge = widget.size == SearchInputSize.large;
    
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      onSubmitted: widget.onSubmitted,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: isLarge ? 18 : 14,
        fontWeight: isLarge ? FontWeight.w500 : FontWeight.w400,
        color: customColors?.textColorText ?? Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: TextStyle(
          color: customColors?.textColorTextPlaceholder ?? 
                 Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
          fontSize: isLarge ? 18 : 14,
          fontWeight: isLarge ? FontWeight.w500 : FontWeight.w400,
        ),
        filled: true,
        fillColor: customColors?.backgroundColorBgContainer ?? 
                   Theme.of(context).colorScheme.surface,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: isLarge ? 20 : 8,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isLarge ? 8 : 6),
          borderSide: BorderSide(
            color: customColors?.borderColorBorder ?? 
                   Theme.of(context).colorScheme.outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isLarge ? 8 : 6),
          borderSide: BorderSide(
            color: customColors?.borderColorBorder ?? 
                   Theme.of(context).colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isLarge ? 8 : 6),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        prefixIcon: _buildPrefixIcon(customColors),
        suffixIcon: _buildSuffixIcon(customColors),
      ),
    );
  }

  Widget? _buildPrefixIcon(CustomColors? customColors) {
    if (widget.variant == SearchInputVariant.search) return null;
    
    if (widget.showPrefixIcon) {
      return widget.prefixIcon ?? Icon(
        Icons.person_outline,
        color: customColors?.colorIcon ?? 
               Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
        size: 16,
      );
    }
    return null;
  }

  Widget? _buildSuffixIcon(CustomColors? customColors) {
    if (widget.variant == SearchInputVariant.search) {
      return Icon(
        Icons.search,
        color: customColors?.colorIcon ?? 
               Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
        size: 16,
      );
    }
    
    if (widget.showSuffixIcon || _showClearButton) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_showClearButton)
            GestureDetector(
              onTap: _clearText,
              child: Icon(
                Icons.cancel,
                color: customColors?.colorIcon ?? 
                       Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
                size: 16,
              ),
            ),
          if (widget.showSuffixIcon) ...[
            if (_showClearButton) const SizedBox(width: 8),
            widget.suffixIcon ?? Icon(
              Icons.info_outline,
              color: customColors?.colorIcon ?? 
                     Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
              size: 16,
            ),
          ],
        ],
      );
    }
    return null;
  }

  Widget _buildDescription(CustomColors? customColors) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        widget.description,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: customColors?.textColorTextDescription ?? 
                 Theme.of(context).colorScheme.onSurface.withOpacity(0.45),
          fontSize: 14,
          height: 22/14,
        ),
      ),
    );
  }
}