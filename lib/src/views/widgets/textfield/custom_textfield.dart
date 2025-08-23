// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/constants/extensions.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield(
      {this.labelText,
      super.key,
      this.formControlName,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.hintStyle,
      this.validator,
      this.onChanged,
      this.onEditingComplete,
      this.onSaved,
      this.focusNode,
      this.onTap,
      this.textInputAction = TextInputAction.next,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.prefixWidget,
      this.enabled = true,
      this.readOnly = false,
      this.controller,
      this.backgroundColor,
      this.borderColor,
      this.lines = 1,
      this.height = 40,
      this.inputFormatters,
      this.validationMessages,
      this.maxLines,
      this.style,
      this.fillColor,
      this.contentPadding,
      this.enabledBorder,
      this.focusedBorder,
      this.borderRadius,
      this.icon,
      this.type,
      this.prefIcon,
      this.onFieldTap,
      this.suffixWidget,
      this.textCapitalization = TextCapitalization.none});

  final String? formControlName;
  final String? labelText;
  final bool readOnly;
  final TextInputType keyboardType;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Function(FormControl<dynamic>)? onEditingComplete;
  final FormFieldSetter<String>? onSaved;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final bool enabled;
  final TextEditingController? controller;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? type;
  final int? lines;
  final List<TextInputFormatter>? inputFormatters;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final int? maxLines;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final Color? fillColor;
  final Padding? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final IconData? icon;
  final IconData? prefIcon;
  final Function(FormControl<dynamic>)? onFieldTap;
  final Widget? suffixWidget;
  final TextCapitalization textCapitalization;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<dynamic>(
      formControlName: widget.formControlName,
      controller: widget.controller,
      focusNode: widget.focusNode,
      readOnly: widget.readOnly,
      validationMessages: widget.validationMessages,
      maxLines: widget.maxLines ?? 1,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.type == "password" ? !_isVisible : _isVisible,
      inputFormatters: widget.inputFormatters,
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onFieldTap,
      textCapitalization: widget.textCapitalization,
      decoration: InputDecoration(
        enabled: widget.enabled,
        errorStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.bloodRed),
        labelText: widget.labelText,
        hintStyle:
            context.textTheme.bodyLarge?.copyWith(color: AppColors.subTitle),
        alignLabelWithHint: true,
        isDense: true,
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.fillColor ?? AppColors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
          borderSide: BorderSide(color: AppColors.txtPrimary, width: 1.4),
        ),
        prefix: widget.prefixWidget,
        suffix: widget.suffixWidget,
        prefixIcon: widget.prefIcon != null
            ? Icon(
                widget.prefIcon,
                color: AppColors.iconPrimary,
                size: 22,
              )
            : null,
        suffixIcon: widget.type == 'password'
            ? IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                icon: _isVisible
                    ? Icon(
                        Icons.visibility_outlined,
                        color: Theme.of(context).primaryColor,
                      )
                    : const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black38,
                      ),
                color: Theme.of(context).iconTheme.color,
              )
            : widget.icon != null
                ? IconButton(
                    constraints: const BoxConstraints(),
                    iconSize: 24,
                    padding: EdgeInsets.zero,
                    onPressed: widget.onTap,
                    icon: Icon(
                      widget.icon,
                      color: Colors.black54,
                    ),
                  )
                : null,
      ),
    );
  }
}
