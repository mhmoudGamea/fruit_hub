import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/utilies/constants.dart';
import '../../../../../core/utilies/helper.dart';
import '../../model_views/login_cubit/login_cubit.dart';
import '../../model_views/login_cubit/login_state.dart';
import '../signup_view.dart';
import 'custom_account_prompt.dart';
import 'custom_divider.dart';
import 'custom_signin_form.dart';
import 'custom_social_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Helper.successMessage(context,
              message: 'لقد قمت بتسجيل الدخول بنجاح.');
        }
        if (state is LoginFailure) {
          Helper.errorMessage(context, message: state.error);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: authViewPadding),
            child: Column(
              children: [
                state is LoginLoading
                    ? LinearProgressIndicator(color: AppColors.darkPrimaryColor)
                    : const SizedBox(height: 0),
                const SizedBox(height: 24),
                const CustomSigninForm(),
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
                  onPressed: () {
                    context.read<LoginCubit>().signinWithGoogle();
                  },
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
                  onPressed: () {
                    // context.read<LoginCubit>().signinWithFacebook();
                  },
                  text: 'تسجيل بواسطة فيسبوك',
                  socialMediaLogo: 'assets/images/facebook.svg',
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
