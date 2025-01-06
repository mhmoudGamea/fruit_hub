import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  static const rn = '/otp_view';
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAuthAppBar(context, title: 'التحقق من الرمز'),
      body: const SafeArea(
        child: OtpViewBody(),
      ),
    );
  }
}
