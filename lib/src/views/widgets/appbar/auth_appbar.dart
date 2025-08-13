// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

AppBar authAppbar(
  BuildContext context,
  String title,
) {
  return AppBar(
    leading: GestureDetector(
      onTap: () => context.pop(),
      child: Padding(
        padding: EdgeInsets.only(left: 4.5.w),
        child: SvgPicture.asset(
          'assets/icons/back.svg',
        ),
      ),
    ),
    title: Text(title),
  );
}
