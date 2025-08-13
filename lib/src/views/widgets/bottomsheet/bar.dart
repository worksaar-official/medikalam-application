// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

Widget bar() {
  return Center(
    child: Container(
      width: 18.w,
      height: 0.5.h,
      decoration: BoxDecoration(color: const Color(0xFFEBEDF2),borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.only(bottom: 1.5.h),
    ),
  );
}
