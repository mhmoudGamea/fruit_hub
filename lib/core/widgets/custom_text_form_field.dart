import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/utilies/constants.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextInputType inputType;
  final bool withSuffix;
  final Function(String?)? onSaved;
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.inputType,
    this.withSuffix = false,
    this.onSaved,
  });

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
      validator: (value) {
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
          border: inputBorder(textFormFieldRadius),
          focusedBorder: inputBorder(textFormFieldRadius),
          enabledBorder: inputBorder(textFormFieldRadius),
          filled: true,
          fillColor: AppColors.fillInputTextColor,
          suffixIcon: withSuffix
              ? const Icon(
                  Iconsax.edit_2,
                  size: 22,
                  color: Color(0xff949D9E),
                )
              : null),
    );
  }
}
