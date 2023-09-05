import 'package:flutter/material.dart';

import '../app/themes/themes.dart';

class CustomTextFormField extends StatelessWidget {
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String?>? onSaved;
  final GestureTapCallback? onTap;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool? hasPrefixText;
  final Widget? prefixIcon;
  final bool? hasPrefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final bool? showPassword;
  final Color? fillColor;
  final bool? fill;
  final bool? hasBorder;
  final bool? readOnly;

  const CustomTextFormField({
    super.key,
    this.validator,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.keyboardType,
    this.hintText,
    this.hasPrefixText,
    this.prefixText,
    this.suffixIcon,
    this.prefixIcon,
    this.hasPrefixIcon,
    this.showPassword,
    this.initialValue,
    this.fillColor,
    this.fill,
    this.hasBorder,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      obscureText: showPassword ?? false,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor,
        filled: fill ?? false,
        contentPadding: const EdgeInsets.only(left: 15),
        border: hasBorder == null
            ? OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.grey2,
                ),
                borderRadius: BorderRadius.circular(8.0),
              )
            : OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
        enabledBorder: hasBorder == null
            ? OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.grey2,
                ),
                borderRadius: BorderRadius.circular(8.0),
              )
            : OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
        focusedBorder: hasBorder == null
            ? OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.grey2,
                ),
                borderRadius: BorderRadius.circular(8.0),
              )
            : OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
