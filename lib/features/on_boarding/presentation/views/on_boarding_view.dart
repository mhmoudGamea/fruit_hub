import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view_model/page_controller/controller_cubit.dart';

import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  static const rn = '/onBoardingView';
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ControllerCubit()..setListner(),
          child: const OnBoardingViewBody(),
        ),
      ),
    );
  }
}
