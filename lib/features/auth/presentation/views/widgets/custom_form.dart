import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilies/helper.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_text_form_password_field.dart';
import '../../model_views/signup_cubit/signup_cubit.dart';
import 'custom_terms_and_condition.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return Form(
      key: signupCubit.getFormKey,
      autovalidateMode: signupCubit.getAutoValidate,
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'الاسم كامل',
            inputType: TextInputType.name,
            onSaved: (p0) {
              signupCubit.setName = p0!;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hint: 'البريد الإلكتروني',
            inputType: TextInputType.emailAddress,
            onSaved: (p0) {
              signupCubit.setEmail = p0!;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormPasswordField(
            hint: 'كلمة المرور',
            inputType: TextInputType.visiblePassword,
            onSaved: (p0) {
              signupCubit.setPassword = p0!;
            },
          ),
          const SizedBox(height: 16),
          const CustomTermsAndCondition(
            firstTitle: 'من خلال إنشاء حساب ، فإنك توافق على',
            secondTitle: ' الشروط والأحكام الخاصة بنا',
          ),
          const SizedBox(height: 30),
          CustomButton(
              onPressed: () {
                if (signupCubit.getFormKey.currentState!.validate()) {
                  signupCubit.getFormKey.currentState!.save();
                  if (signupCubit.getIsChecked) {
                    signupCubit.signupUser(
                        name: signupCubit.getName,
                        email: signupCubit.getEmail,
                        password: signupCubit.getPassword);
                  } else {
                    Helper.successMessage(context,
                        message:
                            'من فضلك قم بمراجعه الشروط والاحكام لإنشاء حساب جديد.');
                  }
                } else {
                  signupCubit.setAutoValidate = AutovalidateMode.always;
                }
              },
              data: 'إنشاء حساب جديد'),
        ],
      ),
    );
  }
}
