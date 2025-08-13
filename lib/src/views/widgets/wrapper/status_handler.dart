// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/enums.dart';
import 'package:Medikalam/src/views/widgets/wrapper/helpers/empty_widget.dart';
import 'package:Medikalam/src/views/widgets/wrapper/helpers/error_widget.dart';
import 'package:Medikalam/src/views/widgets/wrapper/helpers/loading_indicator.dart';

class StatusHandler extends StatelessWidget {
  final Status status;
  final Widget onSuccess;
  const StatusHandler(
      {super.key, required this.status, required this.onSuccess});

  Widget _handleState(BuildContext context) {
    late Widget child;
    switch (status) {
      case Status.initial:
      case Status.loading:
        child = const Center(child: CustomLoadingIndicator());
        break;
      case Status.empty:
        child = const EmptyScreen();
        break;
      case Status.success:
        child = onSuccess;
        break;
      case Status.error:
        child = const ErrorScreen();
        break;
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: _handleState(context),
    );
  }
}
