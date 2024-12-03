import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view_model/page_controller/controller_cubit.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view_model/page_controller/controller_state.dart';

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
                    ? AppColors.primaryColor.withOpacity(0.5)
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
                onPressed: () {},
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
