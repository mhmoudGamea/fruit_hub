import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  static const rn = '/forgetPasswordView';
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar.customAuthAppBar(context, title: 'نسيان كلمة المرور'),
      body: const ForgetPasswordViewBody(),
    );
  }
}
