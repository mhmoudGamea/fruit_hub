import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/utilies/helper.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilies/constants.dart';
import '../../model_views/signup_cubit/signup_cubit.dart';
import '../../model_views/signup_cubit/signup_state.dart';
import 'custom_account_prompt.dart';
import 'custom_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Helper.successMessage(context,
              message: 'تم انشاء حساب جديد لك بنجاح.');
        }
        if (state is SignupFailure) {
          Helper.errorMessage(context, message: state.error);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: authViewPadding),
            child: Column(
              children: [
                state is SignupLoading
                    ? LinearProgressIndicator(color: AppColors.darkPrimaryColor)
                    : const SizedBox(height: 0),
                const SizedBox(height: 24),
                const CustomForm(),
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
      },
    );
  }
}
