import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/utilies/constants.dart';

import '../utilies/helper.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextInputType inputType;
  final Function(String?)? onSaved;
  final String? Function(String?)? validate;
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.inputType,
    this.onSaved,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
      onSaved: onSaved,
      keyboardType: inputType,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppStyle.fontbold13.copyWith(
          color: AppColors.hintInputTextColor,
        ),
        border: Helper.inputBorder(textFormFieldRadius),
        focusedBorder: Helper.inputBorder(textFormFieldRadius),
        enabledBorder: Helper.inputBorder(textFormFieldRadius),
        filled: true,
        fillColor: AppColors.fillInputTextColor,
      ),
    );
  }
}
