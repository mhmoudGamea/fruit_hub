import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/data/otp_model.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../model_views/otp_cubit/otp_code_cubit.dart';
import 'widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  static const rn = '/otp_view';
  const OtpView({super.key, required this.arguments});

  final OtpModel arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAuthAppBar(context, title: 'التحقق من الرمز'),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => OtpCodeCubit(),
          child: OtpViewBody(credentials: arguments),
        ),
      ),
    );
  }
}
