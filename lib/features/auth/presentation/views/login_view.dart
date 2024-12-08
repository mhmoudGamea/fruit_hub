import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../model_views/login_cubit/login_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const rn = '/authView';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAuthAppBar(context, title: 'تسجيل دخول'),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginViewBody(),
      ),
    );
  }
}
