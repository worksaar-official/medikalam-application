// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:Medikalam/src/providers/centralized_provider.dart';

mixin PaginatedSearchableMixin<T extends StatefulWidget,
    P extends CentralizedProvider> on State<T> {
  late final ScrollController scrollController;
  final searchController = TextEditingController();
  Timer _timer = Timer(const Duration(seconds: 1), () {});

  P get provider => context.read<P>();
  bool isPaginating = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_handleScroll);
    searchController.addListener(_handleSearch);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.clearSearch();
      if (provider.entities.isEmpty) {
        provider.getEntities();
      }
      onPostFrameCallback();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    _timer.cancel();
    super.dispose();
  }

  /// Handles the scroll event and determines whether to fetch the next page
  /// based on the scroll position and whether it is already paginating.
  ///
  /// If the user has scrolled to the end of the list and it is not paginating,
  /// it will start paginating and fetch the next page.
  void _handleScroll() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isPaginating) {
      setState(() {
        isPaginating = true; // Start paginating
      });
      provider.getNextPage().then((_) {
        if (mounted) {
          setState(() {
            isPaginating = false; // Reset pagination state
          });
        }
      }).catchError((error) {
        if (mounted) {
          setState(() {
            isPaginating = false; // Error handling
          });
        }
      });
    }
  }

  void _handleSearch() {
    if (searchController.text.isEmpty) {
      provider.clearSearch();
    } else {
      _timer.cancel();
      _timer = Timer(const Duration(milliseconds: 500), () {
        provider.getEntities(filters: {"searchQuery": searchController.text});
      });
    }
  }

  void onPostFrameCallback() {}
}
