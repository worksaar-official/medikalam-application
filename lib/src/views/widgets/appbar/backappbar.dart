// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

PreferredSizeWidget backAppbar(BuildContext context, String title,
    {List<Widget>? action, Widget? tabs, double? height}) {
  return PreferredSize(
    preferredSize:
        Size.fromHeight(tabs != null ? (height ?? 9.5.h) : kToolbarHeight),
    child: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF7F7F7), Color(0xFFF9F9F9)],
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 2)),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
            preferredSize: Size.zero, child: tabs ?? const SizedBox.shrink()),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.w),
            child: SvgPicture.asset("assets/icons/back_btn.svg"),
          ),
        ),
        title: Text(title),
        actions: action,
      ),
    ),
  );
}
