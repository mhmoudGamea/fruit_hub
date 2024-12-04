import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  static const rn = '/authView';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAuthAppBar(context, title: 'تسجيل دخول'),
      body: const LoginViewBody(),
    );
  }
}
