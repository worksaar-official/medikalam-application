// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/enums.dart';

class ShimmerHandler extends StatelessWidget {
  final Status status;
  final Widget onSuccess;
  final Widget shimmer;
  const ShimmerHandler(
      {super.key,
      required this.status,
      required this.onSuccess,
      required this.shimmer});

  Widget _handleState() {
    late Widget child;
    switch (status) {
      case Status.initial:
      case Status.loading:
        child = shimmer;
        break;
      case Status.success:
        child = onSuccess;
        break;
      case Status.empty:
        child = const Placeholder();
        break;
      case Status.error:
        child = const Placeholder();
        break;
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: _handleState(),
    );
  }
}
