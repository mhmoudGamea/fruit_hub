import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_phone_auth_text_form_field.dart';
import 'package:fruit_hub/features/auth/presentation/model_views/phone_auth_cubit/phone_auth_state.dart';
import 'package:fruit_hub/features/auth/presentation/views/otp_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_style.dart';
import '../../../../../core/utilies/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../model_views/phone_auth_cubit/phone_auth_cubit.dart';

class PhoneAuthViewBody extends StatelessWidget {
  const PhoneAuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneAuthCubit = BlocProvider.of<PhoneAuthCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAuthViewPadding),
      child: Column(
        children: [
          BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
            builder: (context, state) {
              return state is PhoneAuthLoading
                  ? LinearProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation(AppColors.primaryColor),
                      backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                    )
                  : const SizedBox();
            },
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: MediaQuery.of(context).size.width - (kAuthViewPadding * 2),
            child: const Text(
              'من فضلك أدخل رقم هاتفك وسوف نقوم بإرسال رمز التحقق.',
              style: AppStyle.fontsemi16,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 31),
          Form(
            key: phoneAuthCubit.formKey,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomPhoneAuthTextFormField(
                    controller: phoneAuthCubit.countryCodeController,
                    hint: '+20',
                    inputType: TextInputType.phone,
                    maxLength: 3,
                    focusNode: phoneAuthCubit.countryCodeFocusNode,
                    onFieldSubmitted: (value) {
                      phoneAuthCubit.countryCodeFocusNode.unfocus();
                      FocusScope.of(context)
                          .requestFocus(phoneAuthCubit.phoneNumberFocusNode);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: CustomPhoneAuthTextFormField(
                    controller: phoneAuthCubit.phoneNumberController,
                    hint: 'ادخل رقم هاتفك',
                    inputType: TextInputType.phone,
                    maxLength: 10,
                    focusNode: phoneAuthCubit.phoneNumberFocusNode,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
              onPressed: () {
                // phoneAuthCubit.validate(context);
                GoRouter.of(context).pushReplacement(OtpView.rn);
              },
              data: 'إرسل رمز التحقق')
        ],
      ),
    );
  }
}
