import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';

class SearchInput extends StatefulWidget {
  final String? hintText;
  final String? value;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final bool enabled;
  final double? width;

  const SearchInput({
    super.key,
    this.hintText = 'Search',
    this.value,
    this.onChanged,
    this.onClear,
    this.enabled = true,
    this.width,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(SearchInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleClear() {
    _controller.clear();
    widget.onChanged?.call('');
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    final showClearButton = _controller.text.isNotEmpty;

    return Container(
      width: widget.width ?? 360,
      height: 32,
      decoration: BoxDecoration(
        color: customColors?.backgroundColorBgContainer ?? Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: customColors?.borderColorBorder ?? Theme.of(context).colorScheme.outline,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.enabled,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 22 / 14,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: (customColors?.textColorTextPlaceholder ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.25),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 22 / 14,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                isDense: true,
              ),
              onChanged: (value) {
                setState(() {});
                widget.onChanged?.call(value);
              },
              maxLines: 1,
            ),
          ),
          if (showClearButton)
            GestureDetector(
              onTap: _handleClear,
              child: Container(
                padding: const EdgeInsets.only(left: 4, right: 12),
                child: Icon(
                  Icons.close,
                  size: 12,
                  color: (customColors?.textColorTextPlaceholder ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.25),
                ),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.search,
                size: 16,
                color: (customColors?.colorIcon ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.45),
              ),
            ),
        ],
      ),
    );
  }
}