import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilies/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'custom_account_prompt.dart';
import 'custom_terms_and_condition.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: authViewPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hint: 'الاسم كامل',
              inputType: TextInputType.name,
            ),
            const SizedBox(height: 16),
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
            const CustomTermsAndCondition(
              firstTitle: 'من خلال إنشاء حساب ، فإنك توافق على',
              secondTitle: ' الشروط والأحكام الخاصة بنا',
            ),
            const SizedBox(height: 30),
            CustomButton(onPressed: () {}, data: 'إنشاء حساب جديد'),
            const SizedBox(height: 26),
            CustomAccountPrompt(
              firstTitle: 'تمتلك حساب بالفعل؟',
              secondTitle: ' تسجيل دخول',
              onPressed: () {
                GoRouter.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
