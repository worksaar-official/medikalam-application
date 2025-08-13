// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Medikalam/src/views/widgets/wrapper/helpers/empty_widget.dart';

class DataHandler extends StatelessWidget {
  final Object? data;
  final Widget child;
  const DataHandler({this.data, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final isEmpty = data == null || (data is List && (data as List).isEmpty);
    return isEmpty ? const EmptyScreen() : child;
  }
}
