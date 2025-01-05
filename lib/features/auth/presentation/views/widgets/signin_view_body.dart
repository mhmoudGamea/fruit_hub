import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/presentation/views/phone_auth_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/utilies/constants.dart';
import '../../../../../core/utilies/helper.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../model_views/signin_cubit/signin_cubit.dart';
import '../../model_views/signin_cubit/signin_state.dart';
import '../signup_view.dart';
import 'custom_account_prompt.dart';
import 'custom_divider.dart';
import 'custom_signin_form.dart';
import 'custom_social_button.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Helper.successMessage(context,
              message: 'لقد قمت بتسجيل الدخول بنجاح.');
        }
        if (state is SigninFailure) {
          Helper.errorMessage(context, message: state.error);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kAuthViewPadding),
            child: Column(
              children: [
                state is SigninLoading
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
                    context
                        .read<SigninCubit>()
                        .signinWithGoogle()
                        .then((_) => GoRouter.of(context).push(HomeView.rn));
                  },
                  text: 'تسجيل بواسطة جوجل',
                  socialMediaLogo: 'assets/images/google.svg',
                ),
                const SizedBox(height: 16),
                CustomSocialButton(
                  onPressed: () {
                    GoRouter.of(context).push(PhoneAuthView.rn);
                  },
                  text: 'تسجيل الدخول بواسطه الهاتف',
                  socialMediaLogo: 'assets/images/phone.svg',
                ),
                const SizedBox(height: 16),
                if (Platform.isIOS)
                  CustomSocialButton(
                    onPressed: () {},
                    text: 'تسجيل بواسطة أبل',
                    socialMediaLogo: 'assets/images/apple.svg',
                  ),
                if (Platform.isIOS) const SizedBox(height: 16),
                CustomSocialButton(
                  onPressed: () {
                    // context.read<SigninCubit>().signinWithFacebook();
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
