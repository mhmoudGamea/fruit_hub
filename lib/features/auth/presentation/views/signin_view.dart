import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../model_views/signin_cubit/signin_cubit.dart';
import 'widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  static const rn = '/signinView';
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAuthAppBar(context, title: 'تسجيل دخول'),
      body: BlocProvider(
        create: (context) => SigninCubit(),
        child: const SigninViewBody(),
      ),
    );
  }
}
