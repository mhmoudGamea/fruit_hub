import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import '../../../../../core/utilies/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../forget_password_view.dart';
import '../signup_view.dart';
import 'custom_account_prompt.dart';
import 'custom_divider.dart';
import 'custom_social_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: authViewPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
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
              child: InkWell(
                onTap: () => GoRouter.of(context).push(ForgetPasswordView.rn),
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: AppStyle.fontsemi13
                      .copyWith(color: AppColors.darkPrimaryColor),
                ),
              ),
            ),
            const SizedBox(height: 33),
            CustomButton(onPressed: () {}, data: 'تسجيل دخول'),
            const SizedBox(height: 33),
            CustomAccountPrompt(
              firstTitle: 'لا تمتلك حساب؟',
              secondTitle: '  قم بإنشاء حساب',
              onPressed: () {
                GoRouter.of(context).push(SignupView.rn);
              },
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
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
