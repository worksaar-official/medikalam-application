// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

void removeAllAndPush(BuildContext context, String newRoute) {
  removeAll(context);
  context.pushReplacement(newRoute);
}

void removeAll(BuildContext context) {
  while (context.canPop()) {
    context.pop();
  }
}
