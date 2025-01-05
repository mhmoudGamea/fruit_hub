import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/phone_auth_view_body.dart';

class PhoneAuthView extends StatelessWidget {
  static const String rn = '/phone-auth-view';
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAuthAppBar(context,
          title: 'تسجيل الدخول برقم الهاتف'),
      body: const SafeArea(child: PhoneAuthViewBody()),
    );
  }
}
