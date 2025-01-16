import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/utilies/app_images.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        SvgPicture.asset(AppImages.successPayment),
        const SizedBox(height: 30),
        const Text('تم بنجاح !', style: AppStyle.fontbold16),
        const SizedBox(height: 9),
        Text(
          'رقم الطلب : 1245789663#',
          style:
              AppStyle.fontregular13.copyWith(color: const Color(0xff4E5556)),
        )
      ],
    );
  }
}
