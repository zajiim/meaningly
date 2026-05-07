import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meaningly/features/main/search/presentation/providers/search_notifier.dart';

class SearchBarWidget extends ConsumerStatefulWidget {
  final Function(String) onSearch;

  const SearchBarWidget({super.key, required this.onSearch});

  @override
  ConsumerState<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch(query);
    });
  }

  void _onSubmit(String query) {
    if (query.isNotEmpty) {
      widget.onSearch(query);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void setSearchQuery(String query) {
    _controller.text = query;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchProvider);
    final hasText = state.query.isNotEmpty;

    if (state.query.isNotEmpty && _controller.text != state.query) {
      _controller.text = state.query;
    } else if (state.query.isEmpty && _controller.text.isNotEmpty) {
      _controller.clear();
    }

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
          hintText: 'Search for a word...',
          prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
          suffixIcon: hasText
              ? IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () {
              _controller.clear();
              widget.onSearch('');
            },
          )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}
