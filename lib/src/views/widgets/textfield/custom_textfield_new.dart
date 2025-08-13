// ignore_for_file: always_put_required_named_parameters_first

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:responsive_sizer/responsive_sizer.dart';

// Project imports:
import 'package:Medikalam/src/core/utils/constants/colors.dart';
import 'package:Medikalam/src/core/utils/helpers/helpers.dart';

class CustomTextFieldNew extends StatefulWidget {
  // ignore: public_member_api_docs
  const CustomTextFieldNew({
    super.key,
    this.textFieldTap,
    this.onEditingComplete,
    this.hint,
    this.control,
    this.hintStyle,
    required this.isRequired,
    this.contentPadding,
    required this.keyboardType,
    this.type,
    this.maxLength,
    required this.isNumber,
    this.onChanged,
    required this.textInputAction,
    this.icon,
    this.onTap,
    this.isReadOnly,
    this.singleInput = false,
    this.style,
    this.prefIcon,
    this.fillColor,
    this.focusNode,
    this.labelText,
    this.minLine,
    this.maxLine,
    this.errortext,
    this.enabledBorder,
    this.focusedBorder,
    this.textAlign,
    this.inputFormatters,
    this.borderRadius,
    this.filled,
    this.iconColor,
  });
  final VoidCallback? textFieldTap;
  final VoidCallback? onEditingComplete;
  final TextEditingController? control;
  final String? type;
  final int? maxLength;
  final bool isNumber;
  final TextStyle? style;
  final ValueChanged<String>? onChanged;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? hint;
  final bool isRequired;
  final IconData? icon;
  final IconData? prefIcon;
  final VoidCallback? onTap;
  final bool? isReadOnly;
  final Color? fillColor;
  final Color? iconColor;
  final bool? filled;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final String? labelText;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final int? minLine;
  final int? maxLine;
  final String? errortext;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final bool singleInput;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderRadius;

  @override
  State<CustomTextFieldNew> createState() => _CustomTextFieldNewState();
}

class _CustomTextFieldNewState extends State<CustomTextFieldNew> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: widget.minLine ?? 1,
      maxLines: widget.maxLine ?? 1,
      onEditingComplete: widget.onEditingComplete,
      controller: widget.control,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      onTap: widget.textFieldTap,
      style: widget.style,
      textAlign: widget.textAlign ?? TextAlign.start,
      validator: (value) {
        if (widget.isRequired) {
          switch (widget.type) {
            case 'normal':
              return Helpers.validateField(value!);
            case 'email':
              return Helpers.validateEmail(value!);
            case 'phone':
              return Helpers.validatePhone(value!);
            case 'password':
              return Helpers.validatePassword(value!);
            default:
              return Helpers.validateField(value!);
          }
        }
        return null;
      },
      onChanged: (value) {
        if (widget.onChanged != null) {
          // ignore: prefer_null_aware_method_calls
          widget.onChanged!(value);
        }
      },
      inputFormatters: widget.isNumber
          ? widget.singleInput
              ? [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  LengthLimitingTextInputFormatter(1),
                ]
              : [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  LengthLimitingTextInputFormatter(10),
                ]
          : widget.type == 'username'
              ? [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ]
              : widget.keyboardType ==
                      const TextInputType.numberWithOptions(
                        signed: true,
                      )
                  ? [NumberInputFormat()]
                  : widget.inputFormatters,
      obscureText: widget.type == 'password' ? !_isVisible : _isVisible,
      textInputAction: widget.textInputAction,
      readOnly: widget.isReadOnly ?? false,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(fontSize: 10),
        hintStyle: widget.hintStyle,
        filled: widget.filled,
        fillColor: widget.fillColor ?? AppColors.offWhite,
        alignLabelWithHint: false,
        isDense: widget.filled,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
        hintText: widget.hint,
        counterText: '',
        enabledBorder: widget.enabledBorder,
        focusedBorder: widget.focusedBorder,
        prefixIcon: widget.prefIcon != null
            ? Icon(
                widget.prefIcon,
                color: widget.iconColor ?? AppColors.txtLabel,
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
