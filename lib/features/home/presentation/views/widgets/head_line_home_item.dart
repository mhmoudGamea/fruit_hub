import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';

class HeadLineHomeItem extends StatelessWidget {
  const HeadLineHomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('الأكثر مبيعًا', style: AppStyle.fontbold16),
        const Spacer(),
        Text(
          'المزيد',
          style: AppStyle.fontregular13.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
      ],
    );
  }
}
