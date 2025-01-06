import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utilies/helper.dart';
import 'package:fruit_hub/features/auth/data/otp_model.dart';
import 'package:fruit_hub/features/auth/presentation/model_views/otp_cubit/otp_code_state.dart';
import 'package:fruit_hub/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import '../../../../../core/utilies/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_otp_text_field.dart';
import '../../model_views/otp_cubit/otp_code_cubit.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key, required this.credentials});

  final OtpModel credentials;

  @override
  Widget build(BuildContext context) {
    final otpCodeCubit = BlocProvider.of<OtpCodeCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAuthViewPadding),
      child: BlocConsumer<OtpCodeCubit, OtpCodeState>(
        listener: (context, state) {
          if (state is OtpCodeError) {
            Helper.errorMessage(context, message: state.message);
          } else if (state is OtpCodeSuccess) {
            Helper.successMessage(context, message: 'تم التحقق بنجاح');
            GoRouter.of(context).pushReplacement(HomeView.rn);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              state is OtpCodeLoading
                  ? LinearProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation(AppColors.primaryColor),
                      backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                    )
                  : const SizedBox(),
              const SizedBox(height: 24),
              SizedBox(
                width:
                    MediaQuery.of(context).size.width - (kAuthViewPadding * 2),
                child: const Text(
                  'من فضلك أدخل رمز التحقق الذي تم إرساله إلى هاتفك.',
                  style: AppStyle.fontsemi16,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 31),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOtpTextField(
                    controller: otpCodeCubit.field1Controller,
                  ),
                  CustomOtpTextField(
                    controller: otpCodeCubit.field2Controller,
                  ),
                  CustomOtpTextField(
                    controller: otpCodeCubit.field3Controller,
                  ),
                  CustomOtpTextField(
                    controller: otpCodeCubit.field4Controller,
                  ),
                  CustomOtpTextField(
                    controller: otpCodeCubit.field5Controller,
                  ),
                  CustomOtpTextField(
                    controller: otpCodeCubit.field6Controller,
                    isLast: true,
                  ),
                ],
              ),
              const SizedBox(height: 29),
              CustomButton(
                onPressed: () {
                  // phoneAuthCubit.validate(context);
                  otpCodeCubit.verifyOtpCode(credentials);
                  // log(otp.toString());
                },
                data: 'تحقق من الرمز',
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  //TODO: resend code
                },
                child: Text(
                  'إعادة إرسال الرمز',
                  style: AppStyle.fontsemi16
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
