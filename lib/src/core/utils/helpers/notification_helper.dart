// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:toastification/toastification.dart';

ToastificationItem showSuccess(String message) {
  return toastification.show(
    type: ToastificationType.success,
    title: Center(
        child:
            Text(message, style: const TextStyle(fontWeight: FontWeight.w600))),
    autoCloseDuration: const Duration(seconds: 2),
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.none,
    borderRadius: BorderRadius.circular(100),
    animationBuilder: (context, animation, alignment, child) {
      final opacity = Tween<double>(begin: 0.0, end: 1.0).animate(animation);

      final slide =
          Tween<Offset>(begin: const Offset(0, -0.1), end: Offset.zero)
              .animate(animation);

      return Align(
        alignment: Alignment.topCenter,
        child: FadeTransition(
          opacity: opacity,
          child: SlideTransition(
            position: slide,
            child: IntrinsicWidth(
              child: child,
            ),
          ),
        ),
      );
    },
  );
}

ToastificationItem showError(String message) {
  return toastification.show(
    type: ToastificationType.error,
    title: Center(
      child: Text(
        message,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    autoCloseDuration: const Duration(seconds: 2),
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.none,
    borderRadius: BorderRadius.circular(100),
    animationBuilder: (context, animation, alignment, child) {
      final opacity = Tween<double>(begin: 0.0, end: 1.0).animate(animation);

      final slide =
          Tween<Offset>(begin: const Offset(0, -0.1), end: Offset.zero)
              .animate(animation);

      return Align(
        alignment: Alignment.topCenter,
        child: FadeTransition(
          opacity: opacity,
          child: SlideTransition(
            position: slide,
            child: IntrinsicWidth(
              child: child,
            ),
          ),
        ),
      );
    },
  );
}
