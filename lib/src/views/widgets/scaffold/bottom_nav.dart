// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

Widget bottomNav(Widget child) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.2.h),
    margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0.5.h),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 19,
          color: Color.fromRGBO(0, 0, 0, 0.08),
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    child: child,
  );
}
