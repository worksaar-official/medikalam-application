// Flutter imports:
import 'package:flutter/material.dart';

Future<void> custombottomSheet({
  required BuildContext context,
  bool? scroll,
  Widget? child,
  VoidCallback? onClose,
}) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.white,
    isScrollControlled: scroll ?? true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(padding: const EdgeInsets.all(9), child: child),
            ),
          );
        },
      );
    },
  ).whenComplete(() {
    if (onClose != null) {
      onClose();
    }
  });
}
