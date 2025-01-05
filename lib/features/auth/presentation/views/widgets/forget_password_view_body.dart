import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/utilies/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAuthViewPadding),
      child: Column(
        children: [
          const SizedBox(height: 24),
          SizedBox(
            width: MediaQuery.of(context).size.width - (kAuthViewPadding * 2),
            child: const Text(
              'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
              style: AppStyle.fontsemi16,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 31),
          const CustomTextFormField(
            hint: 'ادخل رقم هاتفك',
            inputType: TextInputType.phone,
          ),
          const SizedBox(height: 30),
          CustomButton(onPressed: () {}, data: 'إرسل رمز التحقق')
        ],
      ),
    );
  }
}
