import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../model_views/signup_cubit/signup_cubit.dart';
import 'widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  static const rn = '/signupView';
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAuthAppBar(context, title: 'حساب جديد'),
      body: BlocProvider(
        create: (context) => SignupCubit(),
        child: const SignupViewBody(),
      ),
    );
  }
}
