// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';
import 'package:Medikalam/src/views/widgets/textfield/custom_textfield_new.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final Color? color;
  final Function(String)? onChanged;
  const SearchField(
      {required this.controller,
      this.color,
      this.onChanged,
      required this.text,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldNew(
      control: controller,
      prefIcon: Icons.search,
      hint: 'Search $text',
      iconColor: AppColors.hexToColor("#94A3B8"),
      hintStyle: context.textTheme.bodySmall?.copyWith(
        color: AppColors.txtLabel,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      isRequired: true,
      keyboardType: TextInputType.text,
      isNumber: false,
      fillColor: color ?? AppColors.searchBgColor,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
    );
  }
}
