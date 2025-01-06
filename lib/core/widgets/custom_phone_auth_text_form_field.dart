import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/app_style.dart';
import '../utilies/constants.dart';

class CustomPhoneAuthTextFormField extends StatelessWidget {
  const CustomPhoneAuthTextFormField({
    super.key,
    required this.hint,
    required this.inputType,
    // this.onSaved,
    this.validate,
    this.controller,
    this.maxLength,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final String hint;
  final TextInputType inputType;
  // final Function(String?)? onSaved;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  InputBorder inputBorder(double radius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide:
          const BorderSide(color: AppColors.borderInputTextColor, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validate ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
      // onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: inputType,
      cursorColor: AppColors.primaryColor,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyle.fontbold13.copyWith(
          color: AppColors.hintInputTextColor,
        ),
        border: inputBorder(textFormFieldRadius),
        focusedBorder: inputBorder(textFormFieldRadius),
        enabledBorder: inputBorder(textFormFieldRadius),
        filled: true,
        fillColor: AppColors.fillInputTextColor,
      ),
    );
  }
}
