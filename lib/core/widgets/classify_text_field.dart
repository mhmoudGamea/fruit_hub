import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/utilies/helper.dart';

class ClassifyTextField extends StatelessWidget {
  const ClassifyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: '0',
        hintStyle: AppStyle.fontregular13.copyWith(
          color: const Color(0xff888FA0),
        ),
        border: Helper.inputBorder(8),
        focusedBorder: Helper.inputBorder(8),
        enabledBorder: Helper.inputBorder(8),
      ),
    );
  }
}
