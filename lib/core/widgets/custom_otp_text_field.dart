import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub/core/config/app_style.dart';

import '../config/app_colors.dart';
import '../utilies/constants.dart';
import '../utilies/helper.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField(
      {super.key, required this.controller, this.isLast = false});

  final TextEditingController controller;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        onChanged: (value) {
          if (value.isNotEmpty && isLast == false) {
            FocusScope.of(context).nextFocus();
          } else if (value.isNotEmpty && isLast == true) {
            FocusScope.of(context).unfocus();
          }
        },
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        controller: controller,
        keyboardType: TextInputType.phone,
        cursorColor: AppColors.primaryColor,
        textAlign: TextAlign.center,
        style: AppStyle.fontbold13,
        decoration: InputDecoration(
          border: Helper.inputBorder(textFormFieldRadius),
          focusedBorder: Helper.inputBorder(textFormFieldRadius),
          enabledBorder: Helper.inputBorder(textFormFieldRadius),
          fillColor: AppColors.fillInputTextColor,
          filled: true,
        ),
      ),
    );
  }
}
