import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import '../../../../../core/services/preferences.dart';
import '../../../../auth/presentation/views/signin_view.dart';
import '../../view_model/page_controller/controller_cubit.dart';
import '../../view_model/page_controller/controller_state.dart';

class PageViewItem extends StatelessWidget {
  final String image, bgImage;
  final Widget title;
  final String subtitle;
  const PageViewItem(
      {super.key,
      required this.image,
      required this.bgImage,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ControllerCubit>(context);
    return Stack(
      children: [
        SvgPicture.asset(
          bgImage,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 140,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 40),
              title,
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  subtitle,
                  style: AppStyle.fontsemi13
                      .copyWith(color: AppColors.subtitleColor),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        BlocBuilder<ControllerCubit, ControllerState>(
          builder: (context, state) => Visibility(
            visible: controller.getCurrentPage == 0 ? true : false,
            child: Positioned(
              top: 40,
              right: 25,
              child: InkWell(
                onTap: () {
                  Preferences.setOnBoardingStatus();
                  GoRouter.of(context).pushReplacement(SigninView.rn);
                },
                child: Text(
                  'تخط',
                  style: AppStyle.fontregular13
                      .copyWith(color: AppColors.subtitleColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
