import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/custom_account_prompt.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/custom_social_button.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import '../../../../../core/utilies/constants.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: authViewBorder),
        child: Column(
          children: [
            const CustomTextFormField(
              hint: 'البريد الإلكتروني',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hint: 'كلمة المرور',
              inputType: TextInputType.visiblePassword,
              withSuffix: true,
              iconType: IconType.password,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'نسيت كلمة المرور؟',
                style: AppStyle.fontsemi13
                    .copyWith(color: AppColors.darkPrimaryColor),
              ),
            ),
            const SizedBox(height: 33),
            CustomButton(onPressed: () {}, data: 'تسجيل دخول'),
            const SizedBox(height: 33),
            const CustomAccountPrompt(
              firstTitle: 'لا تمتلك حساب؟',
              secondTitle: '  قم بإنشاء حساب',
            ),
            const SizedBox(height: 49),
            const CustomDivider(),
            const SizedBox(height: 31),
            CustomSocialButton(
              onPressed: () {},
              text: 'تسجيل بواسطة جوجل',
              socialMediaLogo: 'assets/images/google.svg',
            ),
            const SizedBox(height: 16),
            CustomSocialButton(
              onPressed: () {},
              text: 'تسجيل بواسطة أبل',
              socialMediaLogo: 'assets/images/apple.svg',
            ),
            const SizedBox(height: 16),
            CustomSocialButton(
              onPressed: () {},
              text: 'تسجيل بواسطة فيسبوك',
              socialMediaLogo: 'assets/images/facebook.svg',
            ),
          ],
        ),
      ),
    );
  }
}
