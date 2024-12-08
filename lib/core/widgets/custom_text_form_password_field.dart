import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../config/app_colors.dart';
import '../config/app_style.dart';
import '../utilies/constants.dart';

class CustomTextFormPasswordField extends StatefulWidget {
  final String hint;
  final TextInputType inputType;
  final Function(String?)? onSaved;

  const CustomTextFormPasswordField({
    super.key,
    required this.hint,
    required this.inputType,
    this.onSaved,
  });

  @override
  State<CustomTextFormPasswordField> createState() =>
      _CustomTextFormPasswordFieldState();
}

class _CustomTextFormPasswordFieldState
    extends State<CustomTextFormPasswordField> {
  var _isObscured = true;
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
      onSaved: widget.onSaved,
      keyboardType: widget.inputType,
      obscureText: _isObscured,
      obscuringCharacter: '⦁',
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppStyle.fontbold13.copyWith(
          color: AppColors.hintInputTextColor,
        ),
        border: inputBorder(textFormFieldRadius),
        focusedBorder: inputBorder(textFormFieldRadius),
        enabledBorder: inputBorder(textFormFieldRadius),
        filled: true,
        fillColor: AppColors.fillInputTextColor,
        suffixIcon: InkWell(
          onTap: () {
            _isObscured = !_isObscured;
            setState(() {});
          },
          child: Icon(
            _isObscured ? Iconsax.eye : Iconsax.eye_slash,
            size: 22,
            color: const Color(0xff949D9E),
          ),
        ),
      ),
    );
  }
}
