import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../model_views/phone_auth_cubit/phone_auth_cubit.dart';
import 'widgets/phone_auth_view_body.dart';

class PhoneAuthView extends StatelessWidget {
  static const String rn = '/phone-auth-view';
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAuthAppBar(context,
          title: 'تسجيل الدخول برقم الهاتف'),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => PhoneAuthCubit(),
          child: const PhoneAuthViewBody(),
        ),
      ),
    );
  }
}
