import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utilies/helper.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/custom_text_form_password_field.dart';
import '../../model_views/login_cubit/login_cubit.dart';
import '../forget_password_view.dart';

class CustomSigninForm extends StatelessWidget {
  const CustomSigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    final siginCubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: siginCubit.getFormKey,
      autovalidateMode: siginCubit.getAutoValidate,
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'البريد الإلكتروني',
            inputType: TextInputType.emailAddress,
            onSaved: (p0) {
              siginCubit.setEmail = p0!;
            },
            validate: (value) => Helper.validateEmail(value),
          ),
          const SizedBox(height: 16),
          CustomTextFormPasswordField(
            hint: 'كلمة المرور',
            inputType: TextInputType.visiblePassword,
            onSaved: (p0) {
              siginCubit.setPassword = p0!;
            },
            validate: (value) => Helper.validatePassword(value),
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
          CustomButton(
              onPressed: () {
                siginCubit.signinUser();
              },
              data: 'تسجيل دخول'),
        ],
      ),
    );
  }
}
