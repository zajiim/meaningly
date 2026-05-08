import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectionsSearchBar extends StatefulWidget {
  final Function(String)? onChanged;
  final Function(String) onSubmitted;
  final VoidCallback? onClear;

  const CollectionsSearchBar({
    super.key,
    this.onChanged,
    required this.onSubmitted,
    this.onClear,
  });

  @override
  State<CollectionsSearchBar> createState() => _CollectionsSearchBarState();
}

class _CollectionsSearchBarState extends State<CollectionsSearchBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    setState(() {});
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged?.call(query);
    });
  }

  void _onSubmit(String query) {
    if (query.isNotEmpty) {
      widget.onSubmitted(query);
    }
  }

  void _onClear() {
    _controller.clear();
    setState(() {});
    widget.onChanged?.call('');
    widget.onClear?.call();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _controller.text.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: _onSearchChanged,
        onSubmitted: _onSubmit,
        decoration: InputDecoration(
          hintText: 'Search offline words...',
          prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
          suffixIcon: hasText
              ? IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: _onClear,
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
