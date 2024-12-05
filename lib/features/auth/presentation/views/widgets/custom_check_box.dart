import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/app_colors.dart';
import '../../model_views/signup_cubit/signup_cubit.dart';
import '../../model_views/signup_cubit/signup_state.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          child: InkWell(
            onTap: () {
              signupCubit.checkTermsAndConditions();
            },
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                border: Border.all(
                    color: signupCubit.getIsChecked
                        ? AppColors.primaryColor
                        : const Color(0xffDDDFDF),
                    width: 1.5),
                borderRadius: BorderRadius.circular(8),
                color: signupCubit.getIsChecked
                    ? AppColors.primaryColor
                    : AppColors.white,
              ),
              child: signupCubit.getIsChecked
                  ? const Icon(
                      Icons.check_rounded,
                      size: 20,
                      color: AppColors.white,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
