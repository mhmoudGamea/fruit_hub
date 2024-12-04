import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/services/preferences.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../view_model/page_controller/controller_cubit.dart';
import '../../view_model/page_controller/controller_state.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ControllerCubit>(context);
    return BlocBuilder<ControllerCubit, ControllerState>(
      builder: (context, state) {
        return Column(
          children: [
            const Expanded(
              child: OnBoardingPageView(),
            ),
            DotsIndicator(
              dotsCount: 2,
              decorator: DotsDecorator(
                activeColor: AppColors.primaryColor,
                color: controller.getCurrentPage == 0
                    ? AppColors.lightPrimaryColor
                    : AppColors.primaryColor,
              ),
            ),
            Visibility(
              visible: controller.getCurrentPage == 0 ? false : true,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: const SizedBox(
                height: 10,
              ),
            ),
            Visibility(
              visible: controller.getCurrentPage == 0 ? false : true,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: CustomButton(
                data: 'ابدأ الان',
                onPressed: () {
                  Preferences.setOnBoardingStatus();
                  GoRouter.of(context).pushReplacement(LoginView.rn);
                },
              ),
            ),
            Visibility(
              visible: controller.getCurrentPage == 0 ? false : true,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: const SizedBox(
                height: 30,
              ),
            ),
          ],
        );
      },
    );
  }
}
